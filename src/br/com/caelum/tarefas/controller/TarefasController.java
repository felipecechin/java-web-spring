package br.com.caelum.tarefas.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.tarefas.model.Tarefa;
import br.com.caelum.tarefas.model.TarefaDao;

@Transactional
@Controller
public class TarefasController {
	
	@Autowired
	TarefaDao dao;

	@RequestMapping("novaTarefa")
	public String form() {
		return "tarefa/formulario";
	}

	@RequestMapping("adicionaTarefa")
	public String adiciona(@Valid Tarefa tarefa, BindingResult result) {

		if (result.hasFieldErrors("descricao")) {
			return "tarefa/formulario";
		}
		dao.salvar(tarefa);
		return "tarefa/adicionada";
	}

	@RequestMapping("listaTarefas")
	public String lista(Model model) {
		model.addAttribute("tarefas", dao.getLista());
		return "tarefa/lista";
	}

	@RequestMapping("removeTarefa")
	public String remove(Tarefa tarefa) {
		dao.remover(tarefa);
		return "redirect:listaTarefas";
	}

	@RequestMapping("mostraTarefa")
	public String mostra(Long id, Model model) {
		model.addAttribute("tarefa", dao.obterPorId(id));
		return "tarefa/mostra";
	}

	@RequestMapping("alteraTarefa")
	public String altera(Tarefa tarefa, String dataFormulario) {
		java.util.Date d1 = null;

		// fazendo a conversão da data
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			// Para converter de String para Date:
			d1 = sdf.parse(dataFormulario);
		} catch (ParseException e) {
			System.out.println("Erro de conversão da data");
			return null; // para a execução do método
		}

		java.sql.Date d2 = new java.sql.Date(d1.getTime());
		tarefa.setDataFinalizacao(d2);
		dao.salvar(tarefa);
		return "redirect:listaTarefas";
	}

	@RequestMapping("finalizaTarefa")
	public String finaliza(Long id, Model model) {
		java.util.Date d1 = new java.util.Date();
		java.sql.Date d2 = new java.sql.Date(d1.getTime());
		Tarefa tarefa = dao.obterPorId(id);
		tarefa.setFinalizado(true);
		tarefa.setDataFinalizacao(d2);
		dao.salvar(tarefa);
		model.addAttribute("tarefa", tarefa);
		return "tarefa/finalizada";
	}

}
