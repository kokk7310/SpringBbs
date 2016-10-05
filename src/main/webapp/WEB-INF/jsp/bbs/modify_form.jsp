<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="Keywords" content="<spring:message code="bbs.modify.keywords" />" />
<meta name="Description" content="<spring:message code="bbs.modify.description" />" />
<title>BBS</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/screen.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
function check() {
    //var form = document.getElementById("modifyForm");
    //TODO Validation 
    return true;
}
function goView() {
    var form = document.getElementById("viewForm");
    form.submit();
}
</script>
</head>
<body>

<div id="wrap">

    <div id="header">
		<%@ include file="../inc/header.jsp" %>
    </div>
    
    <div id="main-menu">
		<%@ include file="../inc/main-menu.jsp" %>
    </div>
    
	<div id="container">
		<div id="content">

<!--  contents begin -->
<div id="url-navi">BBS</div>
<h1>${boardNm }</h1>
<div id="bbs">
<h2><spring:message code="global.modify" /></h2>
<sf:form id="modifyForm" action="modify?${_csrf.parameterName}=${_csrf.token}" method="post" commandName="article" enctype="multipart/form-data" onsubmit="return check()">
<input type="hidden" name="articleNo" value="${param.articleNo }" />
<input type="hidden" name="boardCd" value="${param.boardCd }" />
<input type="hidden" name="curPage" value="${param.curPage }" />
<input type="hidden" name="searchWord" value="${param.searchWord }" />
<sf:errors path="*" cssClass="error"/>
<table id="write-form">
<tr>
    <td><spring:message code="global.title" /></td>
    <td>
    	<sf:input path="title" style="width: 90%" value="${article.title }" /><br />
    	<sf:errors path="title" cssClass="error" />
    </td>
</tr>
<tr>
    <td colspan="2">
        <textarea name="content" rows="17" cols="50">${article.content }</textarea><br />
        <sf:errors path="content" cssClass="error" />
    </td>
</tr>
<tr>
    <td><spring:message code="global.attach.file" /></td>
    <td><input type="file" name="attachFile" /></td>
</tr>
</table>
<div style="text-align: center;padding-bottom: 15px;">
    <input type="submit" value="<spring:message code="global.submit" />" />
    <input type="button" value="<spring:message code="bbs.back.to.article" />" onclick="goView()" />
</div>
</sf:form>
</div>
<!-- contents end -->
		
		</div>
    </div>
    
	<div id="sidebar">
		<%@ include file="bbs-menu.jsp" %>	
	</div>
    
	<div id="extra">
		<%@ include file="../inc/extra.jsp" %>
	</div>
    
	<div id="footer">
		<%@ include file="../inc/footer.jsp" %>
	</div>
        
</div>

<div id="form-group" style="display: none">
    <form id="viewForm" action="view" method="get">
    <p>
        <input type="hidden" name="articleNo" value="${param.articleNo }" />
        <input type="hidden" name="boardCd" value="${param.boardCd }" />
        <input type="hidden" name="curPage" value="${param.curPage }" />
        <input type="hidden" name="searchWord" value="${param.searchWord }" />
    </p>
    </form>
</div>

</body>
</html>