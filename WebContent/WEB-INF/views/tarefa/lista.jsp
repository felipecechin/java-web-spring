<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
	<head>
		<link href="<c:url value="/jquery-ui-1.12.1.custom/jquery-ui.css"/>" rel="stylesheet">
		<link href="<c:url value="/jquery-ui-1.12.1.custom/jquery-ui.structure.css"/>" rel="stylesheet">
		<link href="<c:url value="/jquery-ui-1.12.1.custom/jquery-ui.theme.css"/>" rel="stylesheet">
	    <script src="<c:url value="/jquery-ui-1.12.1.custom/external/jquery/jquery.js"/>"></script>
	    <script src="<c:url value="/jquery-ui-1.12.1.custom/jquery-ui.js"/>"></script>
	    <script src="<c:url value="/jquery-ui-1.12.1.custom/jquery.maskedinput.min.js"/>"></script>
	    <script type="text/javascript">
		    function finalizaAgora(id) {
		      $.post("finalizaTarefa", {'id' : id}, function(resposta) {
		        // selecionando o elemento html através da 
		        // ID e alterando o HTML dele 
		    	$("#tarefa_"+id).html(resposta);
		      });
		    }
		    function removeTarefa(id) {
			  $.post("removeTarefa", {'id' : id}, function() {
			    // selecionando o elemento html através da 
			    // ID e alterando o HTML dele 
			    $("#tarefa_"+id).closest("tr").hide();
			  });
			}
  		</script>
	    
	</head>
	<body>
	  
	  <a href="novaTarefa">Criar nova tarefa</a> 
	
	  <br /> <br />        
	
	  <table id="tabela">
		  <tr>
		    <th>Id</th>
		    <th>Descrição</th>
		    <th>Finalizado?</th>
		    <th>Data de finalização</th>
		  </tr>
		  <c:forEach items="${tarefas}" var="tarefa">
		    <tr id="tarefa_${tarefa.id}">
		      <td>${tarefa.id}</td>
		      <td>${tarefa.descricao}</td>
		      <c:if test="${tarefa.finalizado eq false}">
		        <td>
		        	 <a href="#" onClick="finalizaAgora(${tarefa.id})">
				      Finaliza agora!
				     </a>
		        </td>
		      </c:if>
		      <c:if test="${tarefa.finalizado eq true}">
		        <td>Finalizado</td>
		      </c:if>
		      <td>
		        <fmt:formatDate 
		          value="${tarefa.dataFinalizacao}" 
		          pattern="dd/MM/yyyy"/>
		      </td>
		      <td>
		      	<a href="mostraTarefa?id=${tarefa.id}">Alterar</a>
		      </td>
		      <td>
		      	<a href="#" onclick="removeTarefa(${tarefa.id})">Remover</a>
		      </td>
		    </tr>
		  </c:forEach>
	  </table>
	</body>
</html>