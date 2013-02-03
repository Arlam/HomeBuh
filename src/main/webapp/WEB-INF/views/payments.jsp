<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			<td>${payment.date}</td>
			<td>${payment.accountFrom}</td>
			<td>${payment.accountTo}</td>
			<td>${payment.description}</td>
			<td>${payment.amount}</td>
		</tr>
	</c:forEach>
</table>
