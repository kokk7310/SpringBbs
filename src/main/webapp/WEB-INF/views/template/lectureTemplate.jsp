<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="Keywords" content="<tiles:insertAttribute name="keywords" />" />
<meta name="Description" content="<tiles:insertAttribute name="description" />" />
<title><tiles:insertAttribute name="title" /></title>
<link rel="stylesheet" href="/resources/css/screen.css" type="text/css" />
<link rel="stylesheet" href="/resources/css/prettify.css" type="text/css" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script src="/resources/js/prettify.js"></script>
<script src="/resources/js/commons.js"></script>
<script>
$(document).ready(function() {
	var url = $('#main-article').attr('title');
	$('#main-article').load('/resources/articles/' + url + '.html', function() {
		runAfterLoadArticle();
	});
	$('#next-prev a').click(function(e) {
		e.preventDefault();
		var $chapter = this.title;
		var $article = this.id;
		var $url = "/";
		if ($chapter) $url += $chapter;
		if ($article) $url += '/' + $article;
		$("#lectureForm").attr("action", $url);
		$('#lectureForm').submit();
	});
});
</script>
</head>
</head>
<body>

	<div id="wrap">

		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>

		<div id="main-menu">
			<tiles:insertAttribute name="main-menu" />
		</div>

		<div id="container">
			<div id="content">
				<div id="main-article" title="<tiles:insertAttribute name="content" />"></div>			
				<div id="next-prev">
					<ul>
						<li>
							<spring:message code="global.next" /> : 
							<a href="#" title="<tiles:insertAttribute name="chapter-of-next-article" />" id="<tiles:insertAttribute name="next-article" />"><tiles:insertAttribute name="next-article-title" /></a>
						</li>
						<li>
							<spring:message code="global.prev" /> : 
							<a href="#" title="<tiles:insertAttribute name="chapter-of-prev-article" />" id="<tiles:insertAttribute name="prev-article" />"><tiles:insertAttribute name="prev-article-title" /></a>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div id="sidebar">
			<tiles:insertAttribute name="sidebar" />
		</div>

		<div id="extra">
			<tiles:insertAttribute name="extra" />
		</div>

		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>

	</div>
<script>
/*
var url = $('#main-article').attr('title');
$('#main-article').load('/resources/articles/' + url + '.html', function() {
	runAfterLoadArticle();
});
*/
</script>
<div style="display:none;">
	<form id="lectureForm">
	</form>
</div>
</body>
</html>