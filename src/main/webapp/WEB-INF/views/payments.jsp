<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table id="payments">
	<tr>
		<th><spring:message code="label.payments.date" /></th>
		<th><spring:message code="label.payments.accountFrom" /></th>
		<th><spring:message code="label.payments.accountTo" /></th>
		<th><spring:message code="label.payments.description" /></th>
		<th><spring:message code="label.payments.ammount" /></th>
	</tr>
	<c:forEach var="payment" items="${payments}">
		<tr>
			<td><fmt:formatDate value="${payment.payDate}" pattern="yyyy-MM-dd HH:mm" /></td>
			<td>${payment.accountFrom.name}</td>
			<td>${payment.accountTo.name}</td>
			<td>${payment.description}</td>
			<td>${payment.amount}</td>
		</tr>
	</c:forEach>
</table>
