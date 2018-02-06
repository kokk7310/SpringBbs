<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>

<script>
$(document).ready(function() {
   $('#writeForm').submit(function() {
      var title = $('#writeForm input[name*=title]').val();
      var content = $('#writeForm textarea').val();
      title = $.trim(title);
      content = $.trim(content);
      
      if (title.length === 0) {
          var msg = $('#title-empty').attr('title');
          alert(msg);
          $('#writeForm input[name*=title]').val('');
          return false;
      }
      
      if (content.length === 0) {
          var msg = $('#content-empty').attr('title'); 
          alert(msg);
          $('#writeForm textarea').val('');
          return false;
      }
      
      $('#writeForm input[name*=title]').val(title);
      $('#writeForm textarea').val(content);
   });
   
   $('#goList').click(function() {
      $('#listForm').submit(); 
   });
   
   $('#goView').click(function() {
      $('#viewForm').submit(); 
   });
});
</script>

<div id="url-navi">${boardName }</div>

<h3><spring:message code="bbs.new.article" /></h3>

<sf:form id="writeForm" action="/bbs/${boardCd}?${_csrf.parameterName}=${_csrf.token}" method="post" modelAttribute="article" enctype="multipart/form-data">
<sf:errors path="*" cssClass="error" />
<table id="write-form" class="bbs-table">
<tr>
    <td><spring:message code="global.title" /></td>
    <td>
    	<sf:input path="title" style="width: 90%" /><br />
    	<sf:errors path="title" cssClass="error" />
    </td>
</tr>
<tr>
    <td colspan="2">
        <textarea name="content" rows="17" cols="50"></textarea><br />
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
    <input type="button" value="<spring:message code="global.list" />" id="goList" />
    <c:if test="${not empty param.articleNo }">
    <input type="button" value="<spring:message code="bbs.back.to.article" />" id="goView" />
    </c:if>
</div>
</sf:form>

<div id="form-group" style="display: none">
    <form id="viewForm" action="/bbs/${boardCd }/${param.articleNo }" method="get">
        <input type="hidden" name="page" value="${param.page }" />
        <input type="hidden" name="searchWord" value="${param.searchWord }" />
    </form>
    <form id="listForm" action="/bbs/${boardCd }" method="get">
        <input type="hidden" name="page" value="${param.page }" />
        <input type="hidden" name="searchWord" value="${param.searchWord }" />
    </form>
    
    <div id="title-empty" title="<spring:message code="title.empty" />"></div>
    <div id="content-empty" title="<spring:message code="content.empty" />"></div>
</div>
