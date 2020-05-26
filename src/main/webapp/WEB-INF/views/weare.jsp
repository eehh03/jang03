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
.display-section{
margin-top:30px;
text-align:center; /*we are가 가운데 정렬*/
}
.display-section .sec-tit{
margin-bottom:30px; /*we are가 30px 만큼 떨어짐.*/
}
.display-section .desc{ /*we are아래 설명 글씨체 바뀜*/
font-family:"굴림";
color:#616161;
line-height:1.9; /*글 간격. 비율*/
}
/* WE ARE 내용 영역 CSS */
.promotion-section{ /*그림과 글 사이 간격이 떨어짐.*/
margin-top:68px;
}
.promotion-section .promo-list li{
margin-top:52px; /*맨 아래 텍스트 가운데 정렬*/
text-align:center;
}
.promotion-section .promo-list li:first-child{
margin-top:0; /*첫번째그림과 화면설계시간부분 간격*/
}
.promotion-section .promo-list li img{
height:53px; /*이미지 작게*/
}
.promotion-section .promo-list li h3{
margin:29px 0 20px 0;
color:#3f51b5; /*blog와 같은 부분 사이사이 띄우고 색 바꿈*/
font-weight:normal; /*normal 두꺼운것을 얇게*/
} 
.promotion-section .promo-list li p{
font-size:14px;
font-family:"궁서"; /*한글은 "" 영어는 ''*/
color:#616161;
line-height:1.5;
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
					
						<li><a href="#"> <img src="/resources/images/sea.jpg"
								alt="">
								<h3>HOME</h3>
								<p>휴면 교육센터 디지털 컨버전스 과정 입니다.</p>
						</a></li>
					
						<li><a href="#"> <img src="/resources/images/sea.jpg"
								alt="">
								<h3>WE ARE</h3>
								<p>휴면 교육센터 디지털 컨버전스 과정 입니다2.</p>
						</a></li>
					
						<li><a href="#"> <img src="/resources/images/sea.jpg"
								alt="">
								<h3>WORK</h3>
								<p>휴면 교육센터 디지털 컨버전스 과정 입니다3.</p>
						</a></li>
					
						<li><a href="#"> <img src="/resources/images/sea.jpg"
								alt="">
								<h3>BLOG</h3>
								<p>휴면 교육센터 디지털 컨버전스 과정 입니다4.</p>
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