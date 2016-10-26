<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script type="text/javascript">
$(document).ready(function() {
	$('#jdk-install a').click(function() {
		var url = '/java/jdk-install';
		$.getJSON(url, function(data) {
			$('title').empty();
			$('title').append(data.title);
			$("meta[name='Keywords']").attr("content", data.keywords);
			$("meta[name='Description']").attr("content", data.description);
			$('article').empty();
			$('article').append(data.contents);
			console.log(data);
			console.log($("meta[name='Keywords']").attr("content"));
			console.log($("meta[name='Description']").attr("content"));
		});
		return false;
	});
});
</script>

<div id="url-navi">Java</div>

<h1>자바 포스트 색인</h1>

<article>
<pre class="prettyprint">
public class User {
    private String username;
    private String password;
}
</pre>
</article>