<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table id="accounts" class="table table-striped table-bordered table-condensed span12">
	<tr>
		<th><spring:message code="label.account.name" /></th>
		<th><spring:message code="label.account.description" /></th>
		<th><spring:message code="label.account.balance" /></th>
	</tr>
	<c:forEach var="account" items="${accounts}">
		<tr>
			<td>${account.name}</td>
			<td>${account.description}</td>
			<td>${account.balance}</td>
		</tr>
	</c:forEach>
</table>
