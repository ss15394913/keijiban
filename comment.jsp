<%@ page pageEncoding="Windows-31J"
	import="java.util.*,bean.*"
	contentType="text/html;charset=Windows-31J"%>
	<%-- JSP�̃R�����g --%>

<%-- �R�����g�FJSTL�̃��t�@�����X���Ă�炵�� --%>
<%-- �R�����g�Fprefix="c"�Ŏg�p����uri�����߂Ă���A"c"�̂���core��c --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>${tb.title}</title>
	<link href="css/style2.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<div id="header">
	</div>

	
	<%
		ThreadBean tb = (ThreadBean)request.getAttribute("tb");
		ArrayList commentList = tb.getCommentList();
		request.setAttribute("comList",commentList); 
	%>
	
	<h1> ${tb.title} </h1>
	<h3>�J�e�S���F${tb.category}</h3>
	<a href="/testbb">�g�b�v��</a>
	<a href="/testbb/selectthread">�X���b�h�I����</a>
	<a href="#footer">�y�[�W�̈�ԉ��ց�</a>
	
	<hr>
	<c:forEach var="cb" items="${conList}">
		<c:out value="${cb.contentNo}"/>:
		<c:out value="${cb.name}" />
		<c:out value="${cb.date}"/><br>
		<pre><c:out value="${cb.text}"/></pre> <br>
	</c:forEach>
	
	<hr><hr><br>
	
	<c:if test="${tb.contentsCount < 100}" >
		<form method='Post' action='writecontents'>
			���O:<input type='text' name='name' placeholder="�������i�S�p20�����܂Łj"><br>
			<textarea name='text' cols='50' rows='5' placeholder="�S�p2000�����܂�"></textarea><br><br>
			<input type='submit' value='��������'>
			<input type="hidden" name="threadNo" value="${tb.threadNo}">
			<input type="hidden" name="contentNo" value="${tb.contentsCount+1}">
		</form>
	</c:if>
	
	<c:if test="${tb.contentsCount >= 100}" >
		���e��������𒴂��܂����A���̃X���b�h�ɂ͓��e�ł��܂���
		<br>
	</c:if>
	
	
	<div id="footer">
		<a href="#header">�y�[�W�̈�ԏ�ց�</a>
	</div>

</body>
</html>