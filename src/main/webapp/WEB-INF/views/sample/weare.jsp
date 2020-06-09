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
/* WE ARE 페이지 영역 CSS */
.display-section {
margin-top:30px;
text-align:center;
}
.display-section .sec-tit {
margin-bottom:30px;
}
.display-section .desc {
font-family:"굴림";
color:#616161;
line-height:1.9;
}
/* We Are 내용 영역 CSS */
.promotion-section {
margin-top:68px;
}
.promotion-section .promo-list li {
margin-top:52px;
text-align:center;
}
.promotion-section .promo-list li:first-child {
margin-top: 0px;
}
.promotion-section .promo-list li img {
height:202px;
}
.promotion-section .promo-list li h3 {
margin:29px 0 20px 0;
color:#3f51b5;
font-weight:normal;
}
.promotion-section .promo-list li p {
font-size:14px;
font-family:"궁서";
color:#616161;
line-height:1.5;
}
/*태블릿용 CSS. 반응형이면 기본적으로 필요함.*/
@media all and (min-width:768px){

.promotion-section .promo-list li img {
height:102px;
}

/*태블릭 we are영역 css*/
.display-section{
margin-top:95px;
}
/*태블릿 we are내용 영역css*/
/*큰 타이틀 아래 영역*/
.promotion-section .promo-list li{
float:left;
/*모바일은 세로로 나여랬으나 세로로 나열된 컨텐츠를가로로 배치하는 그래서 left쓰는*/
width:23.046875%;
/* 177px ÷ 768px
그림4개를 177으로 잡고 4개로 나눠서 %로 나온것*/
margin-left::2.604166666666667%;
  /* 20px ÷ 768px*/
  margin-top:0;
}
 /* [가변그리드공식] = 결과는 % 단위 입니다.
  [가변element값 %] = (가변크기로 만들 박스의 가로 너비 / 가변그키로 만들 박스를 감싸고 있는 박스의 가로 너비) X 100 
  [가변마진값 %] = (가변 마진을 적용할 마진값 / 적용할 박스를 감싸고 있는 박스의 가로 너비) X 100
  [가변패딩값 %] = (가변 패딩을 적용할 패딩값 / 적용할 박스를 감싸고 있는 박스의 가로 너비) X 100
  */
.promotion-section .promo-list li:first-child{
margin-left:0;/*첫번째(first~)는 left가 적용안됨. */
}
}

/*PC용 CSS*/
@media all and (min-width:1132px){
/*PC we are 타이틀 영역 css*/
.display-section{
text-align:left;
}
.display-section .sec-tit{
float:left;
margin-bottom:0;
}
.display-section .desc {
position:relative;
float:right;
padding-left:20px;
font-family:"바탕";
color:#616161;
line-height:1.9;
}
.display-section .desc:before{
display:block;
position:absolute;
top:9px;
left:-90px;
width:2px;
height:44px;
background:#e54a4a;/*weare 옆에 빨간줄*/
content:"";
}
/*PC WE ARE 내용 영역*/
.promotion-section .promo-list li{
width:23.23.67491166077739%;
/* 268px ÷ 1132px*/
margin-left:1.76678445229682%;
/* 20px ÷ 1132px*/
}
}
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
					<li><a href="/contactus">CONTACT US</a></li>
				</ul>
			</nav>
			<span class="menu-toggle-btn"> <span></span> <span></span> <span></span>
			</span>
		</header>
		<section class="content">

			<section class="display-section">
				<div class="container">
					<h2 class="sec-tit">WE ARE</h2>
					<p class="desc">
						"휴먼 교육센터 디지털 컨버전스 과정 입니다." <br> "그리고, 지금은 화면 설계 시간 입니다."
					</p>
				</div>
			</section>

			<section class="promotion-section">
				<div class="container">
					<ul class="promo-list">
						<li><a href="#" onclick="return false"> <img src="/resources/images/sea.jpg"
								alt="">
								<h3>HOME</h3>
								<p>휴면 교육센터 디지털 컨버전스 과정 입니다.</p>
						</a></li>
						<li><a href="#" onclick="return false"> <img src="/resources/images/sea.jpg"
								alt="">
								<h3>HOME</h3>
								<p>휴면 교육센터 디지털 컨버전스 과정 입니다.</p>
						</a></li>
						<li><a href="#" onclick="return false"> <img src="/resources/images/sea.jpg"
								alt="">
								<h3>HOME</h3>
								<p>휴면 교육센터 디지털 컨버전스 과정 입니다.</p>
						</a></li>
						<li><a href="#" onclick="return false"> <img src="/resources/images/sea.jpg"
								alt="">
								<h3>HOME</h3>
								<p>휴면 교육센터 디지털 컨버전스 과정 입니다.</p>
						</a></li>
					</ul>
				</div>
			</section>

		</section>
		<footer class="footer">
			<p class="copyright">LOGO</p>
		</footer>
	</div>
</body>
</html>