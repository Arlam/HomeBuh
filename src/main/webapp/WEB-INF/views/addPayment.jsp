<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="tabbable span12">
    <!-- Only required for left/right tabs -->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab1" data-toggle="tab"><spring:message code="label.payment.tab1"/> </a></li>
        <li><a href="#tab2" data-toggle="tab"><spring:message code="label.payment.tab2"/></a></li>
        <li><a href="#tab3" data-toggle="tab"><spring:message code="label.payment.tab3"/></a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab1">
            <form:form method="POST" action="addPayment" commandName="payment">
                <div class="row-fluid">
                    <form:label path="accountFrom" cssClass="span3">
                        <spring:message code="label.account.from.name"/>
                    </form:label>
                    <form:label path="accountTo" cssClass="span3">
                        <spring:message code="label.account.to.name"/>
                    </form:label>
                    <form:label path="description" cssClass="span4">
                        <spring:message code="label.payment.description"/>
                    </form:label>
                    <form:label path="amount" cssClass="span2">
                        <spring:message code="label.payment.sum"/>
                    </form:label>
                </div>
                <div class="row-fluid">
                    <form:select path="accountFrom" cssClass="span3">
                        <form:options items="${accountsFrom}" itemLabel="name"
                                      itemValue="id"/>
                    </form:select>
                    <form:select path="accountTo" cssClass="span3">
                        <form:options items="${accounts}" itemLabel="name" itemValue="id"/>
                    </form:select>
                    <form:input path="description" class="span4"/>
                    <form:input path="amount" class="span2"/>

                </div>
                <div class="row text-center">
                    <input type="submit" class="btn span3" placeholder=".span12"/>
                </div>
            </form:form>
        </div>
        <div class="tab-pane" id="tab2">
            <form:form method="POST" action="addPayment" commandName="payment">
                <div class="row-fluid">
                    <form:label path="accountFrom" cssClass="span3">
                        <spring:message code="label.account.from.name"/>
                    </form:label>
                    <form:label path="accountTo" cssClass="span3">
                        <spring:message code="label.account.to.name"/>
                    </form:label>
                    <form:label path="description" cssClass="span4">
                        <spring:message code="label.payment.description"/>
                    </form:label>
                    <form:label path="amount" cssClass="span2">
                        <spring:message code="label.payment.sum"/>
                    </form:label>
                </div>
                <div class="row-fluid">
                    <form:select path="accountFrom" cssClass="span3">
                        <form:options items="${accounts}" itemLabel="name"
                                      itemValue="id"/>
                    </form:select>
                    <form:select path="accountTo" cssClass="span3">
                        <form:options items="${accountsTo}" itemLabel="name" itemValue="id"/>
                    </form:select>
                    <form:input path="description" class="span4"/>
                    <form:input path="amount" class="span2"/>

                </div>
                <div class="row text-center">
                    <input type="submit" class="btn span3" placeholder=".span12"/>
                </div>
            </form:form>
        </div>
        <div class="tab-pane" id="tab3">
            <form:form method="POST" action="addPayment" commandName="payment">
                <div class="row-fluid">
                    <form:label path="accountFrom" cssClass="span3">
                        <spring:message code="label.account.from.name"/>
                    </form:label>
                    <form:label path="accountTo" cssClass="span3">
                        <spring:message code="label.account.to.name"/>
                    </form:label>
                    <form:label path="description" cssClass="span4">
                        <spring:message code="label.payment.description"/>
                    </form:label>
                    <form:label path="amount" cssClass="span2">
                        <spring:message code="label.payment.sum"/>
                    </form:label>
                </div>
                <div class="row-fluid">
                    <form:select path="accountFrom" cssClass="span3">
                        <form:options items="${accounts}" itemLabel="name"
                                      itemValue="id"/>
                    </form:select>
                    <form:select path="accountTo" cssClass="span3">
                        <form:options items="${accounts}" itemLabel="name" itemValue="id"/>
                    </form:select>
                    <form:input path="description" class="span4"/>
                    <form:input path="amount" class="span2"/>

                </div>
                <div class="row text-center">
                    <input type="submit" class="btn span3" placeholder=".span12"/>
                </div>
            </form:form>
        </div>
    </div>
</div>

