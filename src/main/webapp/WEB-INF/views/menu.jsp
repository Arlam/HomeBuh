<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<ul id="menu">
	<li>
		<a href="home"><spring:message code="menu.label.homepage" /></a>
	</li>
	<li>
		<a href="#"><spring:message code="menu.label.accounts" /></a>
		<ul>
			<li>
				<a href="accounts"><spring:message code="menu.label.viewAccounts" /></a>
			</li>
			<li>
				<a href="addAccount"><spring:message code="menu.label.createAccounts" /></a>
			</li>
		</ul>
	</li>
	<li>
		<a href="#"><spring:message code="menu.label.payments" /></a>
		<ul>
			<li><a href="payments"><spring:message code="menu.label.viewPayments" /></a>
			</li>
			<li><a href="addPayment"><spring:message code="menu.label.createPayment" /></a>
			</li>
		</ul>
	</li>
</ul>