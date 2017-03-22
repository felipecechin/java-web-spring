<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="f" %>
<html>
	<head>
		<link href="<c:url value="/jquery-ui-1.12.1.custom/jquery-ui.css"/>" rel="stylesheet">
		<link href="<c:url value="/jquery-ui-1.12.1.custom/jquery-ui.structure.css"/>" rel="stylesheet">
		<link href="<c:url value="/jquery-ui-1.12.1.custom/jquery-ui.theme.css"/>" rel="stylesheet">
	    <script src="<c:url value="/jquery-ui-1.12.1.custom/external/jquery/jquery.js"/>"></script>
	    <script src="<c:url value="/jquery-ui-1.12.1.custom/jquery-ui.js"/>"></script>
	    <script src="<c:url value="/jquery-ui-1.12.1.custom/jquery.maskedinput.min.js"/>"></script>
	</head>
	<body>
		  <h3>Alterar tarefa - ${tarefa.id}</h3>
		  <form action="alteraTarefa" method="post">
		
		    <input type="hidden" name="id" value="${tarefa.id}" />
		  
		    Descrição:<br />
		    <textarea name="descricao" cols="100" rows="5">${tarefa.descricao}</textarea>
		    <br />      
		
		    Finalizado? <input type="checkbox" name="finalizado" 
		      value="true" ${tarefa.finalizado? 'checked' : '' }/> <br />      
		
		    Data de finalização: <br />
		    <!-- <input type="text" name="dataFormulario" 
		      value="<fmt:formatDate 
		      value="${tarefa.dataFinalizacao}" 
		      pattern="dd/MM/yyyy" />"/>  -->
		      <f:campoData id="dataFormulario" valor="${tarefa.dataFormatada}"/>
		    <br />
		  
		    <input type="submit" value="Alterar"/>
		  </form>
	</body>
</html>