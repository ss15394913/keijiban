<%@ page pageEncoding="Windows-31J"
	import="java.utill.*,bean.*"
	contentType="text/html;charsey=Windows-31J"%>
	
	
<html>
<head>
	<link rel="stylesheet" href="css/makeThread.css" type="text/css">
	<title>スレッド作成</title>
</head>
<body>
	<div class="text" style=" text-align:center;">
	<h1>スレッド作成フォーム</h1>
	<a href="index.html">トップへ</a>
	<a href="selectthread">スレッド一覧へ</a>
	<hr>
	<br>
	<form action='writethread' method='Post'>
	タイトル:<input type='text' name='title' placeholder="全角50文字まで">
	<select name='cat'>
		<option value="雑談">雑談</option>
		<option value="ゲーム">ゲーム</option>
		<option value="ﾊﾟｽﾀｧ">ﾊﾟｽﾀｧ</option>
		</select>
		<br>
		<br>
		名前:<input type='text' name='name' placeholder="名無し（全角10文字まで）"><br>
		<textarea name='text' cols='50' rows='5' placeholder="全角1000文字まで"></textarea><br><br>
		<input type='submit' value='スレッド作成'>
	</form>


</body>
</html>