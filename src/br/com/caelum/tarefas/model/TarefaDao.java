package br.com.caelum.tarefas.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

@Repository
public class TarefaDao {

	@PersistenceContext
	EntityManager manager;

	public void salvar(Tarefa tarefa) {
		manager.merge(tarefa);
	}

	@SuppressWarnings("unchecked")
	public List<Tarefa> getLista() {
		return manager.createQuery("select tarefa from Tarefa tarefa").getResultList();
	}

	public Tarefa obterPorId(Long id) {
		return manager.find(Tarefa.class, id);
	}

	public void remover(Tarefa tarefa) {
		Tarefa tarefaARemover = obterPorId(tarefa.getId());
		manager.remove(tarefaARemover);
	}

}
