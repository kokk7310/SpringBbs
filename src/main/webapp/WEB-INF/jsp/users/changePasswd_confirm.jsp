<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div id="url-navi"><spring:message code="user.membership" /></div>

<h2><spring:message code="user.changePasswd.confirm.heading" /></h2>

<spring:message code="user.changePasswd.confirm.login.again" />
<input type="button" value="<spring:message code="user.login" />" onclick="javascript:location.href='login'" />