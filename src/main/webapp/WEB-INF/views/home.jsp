<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimim-scale=1, maximum-scale=1, user-scalable=no">
<title>1. 반응형 웹구조 준비하기</title>
<!--  css작업 후 외부파일에 저장할 위치 -->
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<!-- 참고: 파이콘(Favorite Icon)즐겨찾기 아이콘으로 등록 http://est0que.tistory.com/1539 -->
<link rel="shortcut icon" href="/images/favicon/favicon.ico">
<link rel="apple-touch-icon-proecomposed"
	href="/images/favicon/home-touch-icon.png">
<!-- js작업후 외부파일에 저장할 위치 -->
<script src="/js/jquery.min.js"></script>
<style>
/* 모바일용 CSS */
/* 기본 CSS */
.container {
	width: 90%;
	max-width: 1132px;
	margin: 0 auto;
}

.cfixed:after, .container:after {
	display: block;
	content: "";
	clear: both;
}

.blind {
	position: absolute;
	width: 0;
	height: 0;
	line-height: 0;
	text-indent: -9999px;
	overflow: hidden;
}

-sec-tit {
	font-size: 42px;
	color: #3f51b5;
	font-weight: normal;
}

.divider {
	width: 90%;
	max-width: 1132px;
	margin: 0 auto;
	margin-top: 77px;
	background: #eee;
}

.m-divier {
	width: 20px;
	margin: 0 auto;
	margin-top: 77px;
	background: #3f51b5;
}

/*태블릿용 CSS*/
@media all and (min-width:768px) {
	/*기본 CSS*/
	.divider {
		margin-top: 124px;
	}
	.m-divider {
		margin-top: 124px;
	}
}

/*PC용 CSS*/
@media all and (min-width:1132px) {
}
</style>
</head>
<body>
	<div id="wrap">
		<header class="header cfixed">
			<h1 class="logo">
				<a href="">LOGO</a>
			</h1>
			<nav>
				<ul class="gnb">
					<li><a href="">HOME</a></li>
					<li><a href="">WE ARE</a></li>
					<li><a href="">WORK</a></li>
					<li><a href="">BLOG</a></li>
					<li><a href="">CONTACK US</a></li>
				</ul>
			</nav>
			<span class="menu-toggle-btn"> <span></span> <span></span> <span></span>
			</span>
		</header>
		<article class="slider">
			<img src="/images/slide1.jpg" alt="">
		</article>
	</div>
	<footer class="footer">
		<p class="copyright">LOGO</p>
	</footer>
</body>
</html>