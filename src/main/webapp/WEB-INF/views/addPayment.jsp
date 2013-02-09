<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="newPayment">

	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">tab1</a></li>
			<li><a href="#tabs-2">tab2</a></li>
			<li><a href="#tabs-3">tab3</a></li>
		</ul>
		<div id="tabs-1">
			<form:form method="POST" action="addPayment" commandName="payment">
				<table>
					<tr>
						<th><form:label path="accountFrom">
								<spring:message code="label.accountfrom.name" />
							</form:label></th>
						<th><form:label path="accountTo">
								<spring:message code="label.accountto.name" />
							</form:label></th>
						<th><form:label path="description">
								<spring:message code="label.payment.description" />
							</form:label></th>
						<th><form:label path="amount">
								<spring:message code="label.payment.sum" />
							</form:label></th>
					</tr>
					<tr>
						<td><form:select path="accountFrom">
								<form:options items="${accountsFrom}" itemLabel="name"
									itemValue="id" />
							</form:select></td>
						<td><form:select path="accountTo">
								<form:options items="${accounts}" itemLabel="name"
									itemValue="id" />
							</form:select></td>
						<td><form:input path="description" /></td>
						<td><form:input path="amount" /></td>
					</tr>
					<tr>
						<td colspan="4"><input type="submit" /></td>
					</tr>
				</table>
			</form:form>
		</div>
		<div id="tabs-2">
			<form:form method="POST" action="addPayment" commandName="payment">
				<table>
					<tr>
						<th><form:label path="accountFrom">
								<spring:message code="label.accountfrom.name" />
							</form:label></th>
						<th><form:label path="accountTo">
								<spring:message code="label.accountto.name" />
							</form:label></th>
						<th><form:label path="description">
								<spring:message code="label.payment.description" />
							</form:label></th>
						<th><form:label path="amount">
								<spring:message code="label.payment.sum" />
							</form:label></th>
					</tr>
					<tr>
						<td><form:select path="accountFrom">
								<form:options items="${accounts}" itemLabel="name"
									itemValue="id" />
							</form:select></td>
						<td><form:select path="accountTo">
								<form:options items="${accountsTo}" itemLabel="name"
									itemValue="id" />
							</form:select></td>
						<td><form:input path="description" /></td>
						<td><form:input path="amount" /></td>
					</tr>
					<tr>
						<td colspan="4"><input type="submit" /></td>
					</tr>
				</table>
			</form:form>
		</div>
		<div id="tabs-3">
			<form:form method="POST" action="addPayment" commandName="payment">
				<table>
					<tr>
						<th><form:label path="accountFrom">
								<spring:message code="label.accountfrom.name" />
							</form:label></th>
						<th><form:label path="accountTo">
								<spring:message code="label.accountto.name" />
							</form:label></th>
						<th><form:label path="description">
								<spring:message code="label.payment.description" />
							</form:label></th>
						<th><form:label path="amount">
								<spring:message code="label.payment.sum" />
							</form:label></th>
					</tr>
					<tr>
						<td><form:select path="accountFrom">
								<form:options items="${accounts}" itemLabel="name"
									itemValue="id" />
							</form:select></td>
						<td><form:select path="accountTo">
								<form:options items="${accounts}" itemLabel="name"
									itemValue="id" />
							</form:select></td>
						<td><form:input path="description" /></td>
						<td><form:input path="amount" /></td>
					</tr>
					<tr>
						<td colspan="4"><input type="submit" /></td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>


</div>