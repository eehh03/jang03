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
position:relative;
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
content:"";/*뭐나오기전에는 그냥둔다*/
opacity:0;/*투명도*/
transition:all 0.2s;/*움직임이 0.2초*/
}/*그림위에다가 출력시키려는데*/
.work-section .work-list li a:hover:before{/*hober뭔가떠있다*/
opacity:0.86;/*100프로가 1임*/
}
.work-section .work-list li .info{
position:absolute;
top:0;
left:23px;
z-index:20;
opacity:0;
transition:all 0.3s;
}/*사진위에 써있던게 사진으로 마우스가 가면 뜨게됨.*/
.work-section .work-list li a:hover .info{
transform:translateY(23px);
opacity:1;
}
.work-section .work-list li .info h3{
margin-bottom:8px;
font-size:23px;
color:#fff;
font-weight:normal;/*normal로 해서 두꺼운거에서 일반두께로*/
}/*작업1~8이 흰색으로 바뀌고 폰트가 커짐.*/
.work-section .work-list li .info span{
font-size:11px;
color:#fff;/*color:white*/
}/*소스/작업1~8이 흰색으로 바뀌고 폰트가 11로*/
.work-section .work-list li img{/*모든 이미지*/
display:block;
width:100%;/*현재 모바일 기준이라서 이미지가100프로. 반응형으로 나타남*/
max-width:100%;
height:auto;/*화면안깨지게 auto로*/
}
/*태블릿용 CSS*/
@media all and (min-width:768px){

/*태블릿 WORK 영역 CSS*/
.work-section{
margin-top:118px;
}
.work-section .sec-tit{
margin-bottom:76px;
}
.work-section .work-list li{
float:left;
width:50%; /*그림들을 50퍼씩 잡는다는 말.그럼 2개씩 이미지가 남옴*/
}
.work-section .work-list li .info{
 left:37px;/*마우스 올렸을 때 작업나오는게 info*/
 }
.work-section .work-list li a:hover .info{
transform:translateY(37px);/*작업1 칸에서 얼마나 띄어있나*/
}  }

/*PC용 work영역 CSS*/
@media all and (min-width:1132px){
.work-section .sec-tit{
text-align:left;
} 
.work-section .work-list li{
width:25%;
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

<section class="work-section cfixed">
<h2 class="sec-tit">WORK</h2>
<ul class="work-list">

<li>
<a href="#" onclick="return false">
<!-- #만해주면 클릭시 맨위로 감. 그래서 onclick~해줌 -->
<div class="info">
<h3>작업1</h3>
<span>소스/작업1</span>
</div>
<img src="/resources/images/sea.jpg" alt="">
</a>
</li>

<li>
<a href="#" onclick="return false">
<div class="info">
<h3>작업2</h3>
<span>소스/작업1</span>
</div>
<img src="/resources/images/sea.jpg" alt="">
</a>
</li>

<li>
<a href="#" onclick="return false">
<div class="info">
<h3>작업3</h3>
<span>소스/작업1</span>
</div>
<img src="/resources/images/sea.jpg" alt="">
</a>
</li>

<li>
<a href="#" onclick="return false">
<div class="info">
<h3>작업4</h3>
<span>소스/작업1</span>
</div>
<img src="/resources/images/sea.jpg" alt="">
</a>
</li>

<li>
<a href="#" onclick="return false">
<div class="info">
<h3>작업5</h3>
<span>소스/작업1</span>
</div>
<img src="/resources/images/sea.jpg" alt="">
</a>
</li>

<li>
<a href="#" onclick="return false">
<div class="info">
<h3>작업6</h3>
<span>소스/작업1</span>
</div>
<img src="/resources/images/sea.jpg" alt="">
</a>
</li>

<li>
<a href="#" onclick="return false">
<div class="info">
<h3>작업7</h3>
<span>소스/작업1</span>
</div>
<img src="/resources/images/sea.jpg" alt="">
</a>
</li>

<li>
<a href="#" onclick="return false">
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