<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html><html lang="es"><head>
<meta charset="UTF-8"><title>Inventario de Productos</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head><body>
<div class="container">
<h1>Inventario de Productos</h1>
<c:if test="${not empty mensaje}">
    <p class="alert-success">${mensaje}</p>
</c:if>
<div class="page-actions">
    <a class="btn btn-primary" href="<c:url value="/productos?accion=formulario"/>">+ Nuevo Producto</a>
</div>
<table>
    <thead><tr>
        <th>ID</th><th>Nombre</th><th>Categoría</th>
        <th>Precio</th><th>Stock</th><th>Acciones</th>
    </tr></thead>
    <tbody>
    <c:forEach var="p" items="${productos}" varStatus="s">
        <tr class="${s.index % 2 == 0 ? 'par' : 'impar'}">
            <td>${p.id}</td>
            <td><c:out value="${p.nombre}"/></td>
            <td><c:out value="${p.categoria}"/></td>
            <td><fmt:formatNumber value="${p.precio}" type="currency"
                                  currencySymbol="$"/></td>
            <td>${p.stock}</td>
            <td class="actions">
                <a href="<c:url value="/productos?accion=editar&id=${p.id}"/>">Editar</a> |
                <a class="btn-danger" href="<c:url value="/productos?accion=eliminar&id=${p.id}"/>" onclick="return confirm('¿Eliminar ${p.nombre}?')">Eliminar</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
</body></html>