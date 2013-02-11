<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="accounts.jsp"/>


<form:form method="POST" action="addAccount" commandName="account" cssClass="span12">
    <table>
        <tr>
            <td>
                <form:label path="name"><spring:message code="label.account.name"/></form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="description"><spring:message code="label.account.description"/></form:label>
            </td>
            <td>
                <form:input path="description"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="balance"><spring:message code="label.account.balance"/></form:label>
            </td>
            <td>
                <form:input path="balance"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit"  class="btn"/>
            </td>
        </tr>
    </table>
</form:form>