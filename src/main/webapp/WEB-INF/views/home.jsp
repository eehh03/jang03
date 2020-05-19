<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HTML5 기본구조</title>
</head>
<body>
	<header>
		<div class="eunhwa">
			<h1>Hello world!</h1>
			<nav id="gnb">
				<ul>
					<li>메뉴1</li>
					<li>메뉴2</li>
					<li>메뉴3</li>

				</ul>
			</nav>
		</div>
	</header> 
	<section class="banner_slider">
		<div id="slier" class= "nivoslider">
			<img
				src="http://edu19.dothome.co.kr/metro/image/alp1.jpg" title="슬라이드1" />
		</div>
	</section>
	<section id="contents" class="eunhwa">
		<article id="main">
			<P>The time on the server is ${serverTime}.</P>
		</article>
	</section>
	<footer>
		<p class="eunhwa">주소 : 충남 천안시 성정동</p>

	</footer>
</body>
</html>
