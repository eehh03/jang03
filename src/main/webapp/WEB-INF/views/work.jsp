<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scaleable=no">
<title>HOME</title>
<link rel="shortcut icon" href="/images/favicon/favicon.ico">
<link rel="apple-touch-icon-precomposed"
	href="/images/favicon/home-touch-icon.png">
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">

<style>
/*WORK 영역 CSS*/
.work-section{
margin-top:73px;
}/*로그와 work 사이 여백*/
.work-section .sec-tit{
width:90%;
max-width:1132px; /*1132를 넘지 않는다*/
margin:0 auto;
margin-bottom:47px;
text-align:center;
}
.work-section .work-list li{ /*work 아래있는 거가 list*/
width:100%;
}
.work-section .work-list li a{
display:block;
position:realtive;
width:100%;
height:100%;
}
.work-section .work-list li a:before{ 
display:block;
position:absolute;
top:0;
left:0; /*a태그 바로위에 올리겠다*/
z-index:10; /*그림에 마우스 올릴때 뭐나오는게 2개화면 곁쳐서 나오는 건데 z-index값이 높을수록 위에 올라가*/
width:100%;
height:100%;
background:#3f51b5;
content:"";
opacity:0;
transition:all 0.2s;
}/*그림위에다가 출력시키려는데*/
.work-section .work-list li a:hover:before{
opacity:0.86;
}
.work-section .work-list li .info{
position:absolute;
top:0;
lieft:23px;
z-index:20;
opacity:0;
transition:all 0.3s;}

</style>

<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/common.js"></script>
<!-- 사용자 스크립트 -->
<script>

</script>
</head>
<body>

<!-- 더미 데이터:CSS작업전 내용 -->
	<div id="wrap">
		<header class="header cfixed">
			<h1 class="logo">
				<a href="">LOGO</a>
			</h1>
			<nav>
				<ul class="gnb">
					<li><a href="/">HOME</a></li>
					<li><a href="/weare">WE ARE</a></li>
					<li><a href="/work">WORK</a></li>
					<li><a href="/blog">BLOG</a></li>
					<li><a href="contactus">CONTACT US</a></li>
				</ul>
			</nav>
			<span class="menu-toggle-btn"> <span></span> <span></span> <span></span>
			</span>
		</header>

<section class="work-section cfixed">
<h2 class="sec-tit">WORK</h2>
<ul class="work-list">

<li>
<a href="#">
<div class="info">
<h3>작업1</h3>
<span>소스/작업1</span>
</div>
<img src="/resources/images/sea.jpg" alt="">
</a>
</li>

<li>
<a href="#">
<div class="info">
<h3>작업2</h3>
<span>소스/작업1</span>
</div>
<img src="/resources/images/sea.jpg" alt="">
</a>
</li>

<li>
<a href="#">
<div class="info">
<h3>작업3</h3>
<span>소스/작업1</span>
</div>
<img src="/resources/images/sea.jpg" alt="">
</a>
</li>

<li>
<a href="#">
<div class="info">
<h3>작업4</h3>
<span>소스/작업1</span>
</div>
<img src="/resources/images/sea.jpg" alt="">
</a>
</li>

<li>
<a href="#">
<div class="info">
<h3>작업5</h3>
<span>소스/작업1</span>
</div>
<img src="/resources/images/sea.jpg" alt="">
</a>
</li>

<li>
<a href="#">
<div class="info">
<h3>작업6</h3>
<span>소스/작업1</span>
</div>
<img src="/resources/images/sea.jpg" alt="">
</a>
</li>

<li>
<a href="#">
<div class="info">
<h3>작업7</h3>
<span>소스/작업1</span>
</div>
<img src="/resources/images/sea.jpg" alt="">
</a>
</li>

<li>
<a href="#">
<div class="info">
<h3>작업8</h3>
<span>소스/작업1</span>
</div>
<img src="/resources/images/sea.jpg" alt="">
</a>
</li>
</ul>
</section>
<footer class="footer">
			<p class="copyright">LOGO</p>
		</footer>
	</div>
</body>
</html>