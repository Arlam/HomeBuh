<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="newPayment">
<form:form method="POST" action="addPayment" commandName="payment">
	<table >
		<tr>
			<th>
				<form:label path="accountFrom">
					<spring:message code="label.accountfrom.name" />
				</form:label>
			</th> 
			<th>
				<form:label path="accountTo">
					<spring:message code="label.accountto.name" />
				</form:label>
			</th>
			<th>
				<form:label path="description">
					<spring:message code="label.payment.description" />
				</form:label>
			</th>
			<th>
				<form:label path="amount">
					<spring:message code="label.payment.sum" />
				</form:label>
			</th>			
		</tr> 
		<tr>
			<td>
				<form:select path="accountFrom" >
					<form:options items="${accountsFrom}" itemLabel="name" itemValue="id"/>
				</form:select>
			</td>
			<td>
				<form:select path="accountTo">
					<form:options items="${accountsTo}" itemLabel="name" itemValue="id"/>
				</form:select>
			</td>
			<td>
				<form:input path="description" />
			</td>
			<td>
				<form:input path="amount" />
			</td>
		</tr>	
		<tr>
			<td colspan="4"> 
				<input type="submit" />
			</td>
		</tr>			
	</table>
</form:form>
</div>