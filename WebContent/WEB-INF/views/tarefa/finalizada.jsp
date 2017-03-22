<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<td>${tarefa.id}</td>
<td>${tarefa.descricao}</td>
<td>Finalizada</td>
<td>
<fmt:formatDate value="${tarefa.dataFinalizacao}"
    pattern="dd/MM/yyyy" />
</td>
<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
<td><a href="#" onclick="removeTarefa(${tarefa.id})">Remover</a></td>