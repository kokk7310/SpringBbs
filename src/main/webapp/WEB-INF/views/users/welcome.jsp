<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div id="content-categories"><spring:message code="user.membership" /></div>

<h2><spring:message code="user.welcome.heading" /></h2>

<spring:message code="user.welcome.message" /><br />
<input type="button" value="<spring:message code="user.login" />" onclick="javascript:location.href='login'" />