<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>안뇽</title>
</head>

<style>

</style>
<body> 
<h1>HTML이란?</h1> 
<h2>HTML의 역사</h2>
<h3>팀버너스리에 대해</h3>
<h4>HTML의 태그</h4>
<h5>HTML의 태그</h5> 
<a href="/HTMLtest"> 페이지 다시 불러오기 </a>
<img src="/resources/images/xxx.jpg" alt="바다사진">
<p>
<strong> 이것은 </strong> 문단입니다. <br> <b>이것</b> 문단입니다. </p>
<ul>
		<li>리스트 1</li>
		<li>리스트 2</li>
	</ul>
	<ol>
		<li>리스트 1</li>
		<li>리스트 2</li>
	</ol>
	
	<div>
		<h2>회원가입폼 입니다.</h2>
		<form method="GET" action="/HTMLtest"> 
		성별을 입력
		<select name="gender"> 
		<option value="m">남</option>
		<option value="w">여</option>
		</select>
		<br>
		<input type="text" name="userid" placeholder="사용자이름입력"> 
		<input type="file" name="upload_file">
		<textarea name="contents" cols="100" rows="5" placeholder="여기에 글을 입력"></textarea>
		<input type="submit" name="submit" value="회원가입" >
		</form>
		</div>
	<br>
	<br>
	<table summary="00학교 00반 성적표" style="border: 1px solid black">
		<tr>
			<th>이름</th>
			<th>성적</th>
		</tr>
		<tr>
			<td>김일국</td>
			<td>15</td>
		</tr>
		<tr>
			<td colspan="2">BBB</td>
		</tr>
		<tr>
			<td>ccc</td>
			<td>15</td>
		</tr>
	</table>
	</body>