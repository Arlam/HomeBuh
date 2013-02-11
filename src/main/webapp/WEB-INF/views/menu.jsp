<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="navbar span12">
    <div class="navbar-inner">
        <ul class="nav">
            <li><a href="home"><spring:message code="menu.label.homepage"/></a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message
                        code="menu.label.accounts"/></a>
                <ul class="dropdown-menu">
                    <li><a href="accounts"><spring:message code="menu.label.viewAccounts"/></a></li>
                    <li><a href="addAccount"><spring:message code="menu.label.createAccounts"/></a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message
                        code="menu.label.payments"/></a>
                <ul class="dropdown-menu">
                    <li><a href="payments"><spring:message code="menu.label.viewPayments"/></a>
                    </li>
                    <li><a href="addPayment"><spring:message code="menu.label.createPayment"/></a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>

