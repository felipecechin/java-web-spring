package br.com.caelum.tarefas.model;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Entity
public class Tarefa {
	
		@Id
		@GeneratedValue
		private Long id;
		@Column
		@NotNull @Size(min=5)
		private String descricao;
		@Column
		private boolean finalizado;
		@Column
		private Date dataFinalizacao;
		
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getDescricao() {
			return descricao;
		}
		public void setDescricao(String descricao) {
			this.descricao = descricao;
		}
		public boolean isFinalizado() {
			return finalizado;
		}
		public void setFinalizado(boolean finalizado) {
			this.finalizado = finalizado;
		}
		public Date getDataFinalizacao() {
			return dataFinalizacao;
		}
		public void setDataFinalizacao(Date dataFinalizacao) {
			this.dataFinalizacao = dataFinalizacao;
		}
	  
		public String getDataFormatada() {  
		    String dataFormatada = null;  
		    if(this.getDataFinalizacao()!=null)  
		    {  
		        SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");             
		        dataFormatada = formatador.format(this.getDataFinalizacao());  
		    }  
		    return dataFormatada;  
		}
		
	}
