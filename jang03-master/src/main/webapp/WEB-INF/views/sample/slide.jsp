<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- 위 뷰포트 메타태그 값은 모바일 기기에서 화면을 최적화 시키는 기능이 있음(필수) -->
	<title>반응형웹의구조</title>
    <style>
 .center { margin: 0 auto; }
    .row {
      /* overflow: hidden; */
      width: 100%;
      max-width: 960px;
      min-width: 748px;
      margin: 0 auto;
    }
    .col-1, .col-2, .col-3, .col-4, .col-5, .col-6, 
    .col-7, .col-8, .col-9, .col-10, .col-11 {
      float: left;
      margin-right: 3.8%;
      min-height: 1px;
    }
    .row .col-1  { width: 4.85%;	}
    .row .col-2  { width: 13.45%;	}
    .row .col-3  { width: 22.05%;	}
    .row .col-4  { width: 30.75%;	}
    .row .col-5  { width: 39.45%;	}
    .row .col-6  { width: 48%;	}
    .row .col-7  { width: 56.75%;	}
    .row .col-8  { width: 65.4%;	}
    .row .col-9  { width: 74.05%;	}
    .row .col-10 { width: 82.7%;	}
    .row .col-11 { width: 91.35%;	}
    .row .col-12 { width: 100%; float: left; }
    .last { margin-right: 0; } /* col 마지막 요소의 마진값을 없애서 레이아웃이 깨지는 것을 방지 */
    [class^=col]>:first-child { margin-top: 0; }
    img, object, embed, iframe { max-width: 100%; }
    img, iframe { height: auto; }
    .fr { float: right; }

    /* Tablet Size: 960px 이하 */
    @media all and (max-width: 960px) {
      body {
        font-size: 16px;
        line-height: 24px;
      }
      .row, body, .container {
        width: 100%;
        min-width: 0;
        margin-left: 0;
        margin-right: 0;
        padding-left: 0;
        padding-right: 0;
      }
      .row .col-1, .row .col-2, .row .col-3, .row .col-4, .row .col-5, .row .col-6, 
      .row .col-7, .row .col-8, .row .col-9, .row .col-10, .row .col-11, .row .col-12 {
        float: none;
        width: auto;
        margin-left: 0;
        margin-right: 0;
        padding-left: 20px;
        padding-right: 20px;
      }
    }
    /*위에꺼 common css라고 생각*/
.clearfix:after{
content:"";
display:block;
clear:both;/*플로트 라이트를 없애겠다.*/
}   
.blind{
visibility:hidden;
position:absolute;
top: -10000px;
height:1px;
width:1px;
}/*깨지는거 완화될것.*/
    </style>
    <style>
    @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
/*구글 나눔폰트 가져오기*/
body, h1, h2, h3, h4, h5, h6, li, p 
{font-family:"Nanum Gothic","NanumGothic" !important;
font-size:14px; line-height:24px;}
body {margin:0px; padding:0px;}/*reset.css에 들어있는거*/
  /* 속성설명
    -webkit- : 구글, 사파리 브라우저에 적용
    -moz- : 파이어폭스 브라우저에 적용
    -ms- : 익스플로러에 적용, 보통 생략합니다.
    -o- : 오페라 브라우저에 적용
    */
body header{
background: url(/resources/images/header-bg.jpg) no-repeat 50% 55%;
-webkit-background-size:cover;
-moz-background-size:cover;
background-size:cover;/*3개 같은말*/
position:fixed;
width:100%;
height:90px;
z-index:999;
}   
/*바디안쪽 섹션만 가르키는*/
body > section {/* >는 바로 다음 section(부모)만 적용. >없으면 section(부모,자식,손자 등)안에 섹션 다 적용.두번째 자식은 적용 두번째손자는 적용안됨*/
margin-top:0px;
}
body ul, body ol {
padding:0;
list-style:none; /*리스트앞 점있는거 없애줌*/
}
body header .row #gnb, /*#이니 gnb라는 영역*/
body header .row{
position:relative;
margin: 0 auto;/*가운데정렬*/
}
body header .row #brand{/*아이디가 브랜드*/
background: url(/resources/images/logoa.png) no-repeat 0 50%;/*norepeat반복하지 않겠다 0은가로위치 50은 세로위치*/
height:90px;
width:90px;
margin:0px;
text-indent:-10000px;/*들여쓰기*/
}
body header .row #brand:hover {/*hover일때 rgba가 나타날것*/
background-color:rgba(0, 0, 0, 0.1);/*0은 가장어두운, 255은 가장 밝은*/
}
body header .row #brand:hover:before{/*before있음 앞에 영역에란말*/
top:35px;
-webkit-transform:rotate(360deg);/*brand 때 로고가 빙글돌아감*/
-moz-transform:rotate(360deg);
-ms-transform:rotate(360deg);
transform:rotate(360deg);
}
body header .row #gnb{
position:absolute;/*위치절대값줄때 씀. top,right에*/
top: 35px;
right:0;
}
body header .row #gnb ul{
margin:0;
}
body header .row #gnb ul li {
float:left;
margin-right:30px;
}
body header .row #gnb ul li:last-child { /*오른쪽 마진 값을 제거하지 않으면 float drop 현상이 발생*/
margin-right:0;
}
body header .row #gnb ul li a{/*위에 메뉴*/
font-size:16px;
color:#fff;
text-decoration:none;/*링크언더바 없애는거*/
text-shadow:0 2px #282020;
}
body header .row #gnb ul li a:hover, 
body header .row #gnb ul li a:focus{
color: #fff;
text-shadow: none;
font-weight:bold;
}/*마우스 글자에 올리면 더 눈에 띄게 나타남*/
 body section#contents h2, 
 body section#contents h3 {
      position: relative;
      margin-bottom: 40px;
      border-bottom: 1px solid #e1dcda;
      padding-bottom: 20px;
      font-size: 24px;
      line-height:34px;
      color: #21759A;
      padding:20px;
    }
body section#contents h2:before, /*아이디가 콘텐츠인거 찾기, 만약 section #contents는 안쪽을 가리킴*/
body section#contents h3:hefore {
content:'';
position:absolute;
width:34px;
height:1px;
background:#21759A;
top:-10px;
left:-36px;
-webkit-transform: rotate(45deg);/*45도 회전*/
-moz-transform:rotate(45deg);
-ms-transform:rotate(45deg);
transform:rotate(45deg);
}/*워드프레스와 사각사이 떨어뜨림*/
body section#contents li{
margin-bottom:60px;
}
body section#contents li img{
border:1px solid #e0e0e0;
-webkit-box-sizing:border-box;
-moz-box-sizing:border-box;
box-siwing:border-box;
}/*이미지 박스*/
body section#contents li h4,
body secton#contents li h5{/*아래쪽 h4,h5부분*/
font-size:22px;
}
body section#contents li h5{
margin-top:22px;
margin-bottom:32px;
}
body section#contents li p{/*<p>안에 있는 글들 바꿈*/
font-size:14px;
line-height:24px;
color: #818181;
}
body footer{
border-top:1px solid #e2e2e2;/*실선*/
}
body footer p{
padding-top:40px;
padding-bottom:40px;
background:url(/resources/images/logoa.png) no-repeat 100% 50%;  /*100을 0으로 하면 왼쪽으로 붙음.*/
}
body footer p small {
display:block;
line-height:1.2;
}
body footer p small a:link,
body footer p small a:visited {
color:#606060;
text-decoration:none;
}
body footer p small a:hover, /*hover 마우스 오버*/
body footer p small a:active { /*active는 마우스 클릭*/
color: yellow;
}
/*요즘브라우저는 :보다 ::으로 씀*/
::selection {
background-color: #eee7dd;
color:#542e1c;/*폰트색상*/
}
::-moz-selection{
background-color: #eee7dd;
color:#542e1c;
}
/*pc버전 끝*/
/*태블릿: 960 이하*/
@media all and (max-width:960px) {/*pc버전으로 한거라서 사이즈가 축소되니 max로 한것*/
body section#contents li,
.row .col-1, .row .col-2, .row .col-3, .row .col-4, .row .col-5, .row .col-6, 
.row .col-7, .row .col-8, .row .col-9, .row .col-10, .row .col-11, .row .col-12 {
text-align:center;
}
body header,body section#contents,body footer {
width:100%;
padding-left:0%;
padding-right:0%;
}
section.banner_slider {display:none;} /*모바일에서는 슬라이더 안보이게*/
body section#contents {margin-top:90px;}

body header {z-index:999;}
body header .hamberger{float:right;}
body header a#pull {
position:relative;
top:-55px;
}
body header a#pull:after{
content:"";
background:url('/resources/images/nav-icon.png') no-repeat;
width: 30px;
height: 30px;
position:absolute;
right:0px;/*오른쪽으로 딱 달라붙게*/
}
nav > ul {display:none;} /* 햄버거 메뉴 사라짐.*/
body header .row #gnb {
position:static;
}
body header .row #gnb ul{ background-color:#fff; width:100%;}
body header .row #gnb ul li{
float:none;/*전에 가로로 되어있으니 세로로하려고 none로(?)*/
margin-right:0;
margin-bottom:1px;
border-top:1px solid #555;
border-bottom: 1px solid #555;
padding: 10px 30px;
background-color:rgba(56, 56, 56, 1);
}
body header .row #gnb ul li:hober, 
beader .row #gnb ul li:active{/*li태그에서*/
background-color:rgba(0, 0, 0, 1);
}
body header .row #gnb ul li a {
color:#fff;
text-shadow:none;
}
section#contents #main img, section#contents #sub img{/*컨텐츠인 섹션안에*/
width:90%;
padding:10px;
border:1px solid #e0e0e0;
background:#fff;
}
footer p {
padding-top:0px !important;
padding-bottom:15px !important;
width:90% !important;
margin:0 auto !important;
background: none !important;
}
}
.nivo-caption {text-align:center !important;}/*슬라이더 이미지아래를 가운데 정렬*/
.nivoSlider { height: 400px !important;} 
.nivoSlider img {height:400px !important;}/*이미지전체 400으로*/

	.row{
	margin-right: auto !important;
    margin-left: auto !important;
    }
    /*왼쪽으로 쏠려서 위에다가 만들어줌. important씀으로 그전에 무엇이 있든 위에거를 적용하겠다*/
 
  .item img{
    height: 600px !important;
    width: 100% !important;
    }/*아이템 영역안 이미지 사이즈*/
    
  .carousel-control .slide_arrow {
 position: absolute;
 top: 50% !important; 
  }
  
</style>
    <script src="/resources/js/jquery.min.js"></script>
    <script type="text/javascript">
    jQuery(function($){ //j쿼리 시작 : $(document).ready(function(){ }); == $(function(){ }); 과 동일
  //6.1 모바일메뉴 로딩시
    var pull=$('#pull');  //자바스크립트 pull이라는 영역안에 css인 #pull영역을 집어넣겠다 
    var menu=$('nav>ul');  //이 영역을 menu로 
    $(pull).on('click',function(e){  //pull영역에 click할때 이벤트 발생시 이벤트를 시행한다.
    	var w =$(window).width();  //화면괄호값에 w지원
    if(w<960){
    	if(menu.is(':visible')){  //visible(보였을때) 슬라이드코글인 메뉴를 보이거나 안보이거나 하겠다.
    		//alert('닫을때');
    		menu.slideToggle("fast");
    		return;
    	}
    	if(menu.is(':hidden')){
    		//alert('열때');
    		menu.slideToggle("slow");
    		return;
    	}
    }
    });//click 이벤트 끝
  //모바일에 토글에 대한 스타일->PC에서는 없앤다
  $(window).resize(function(){//resize시 function(기능)을 준다
	  var w=$(window).width();//window 사이즈 알고
  var menu=$('nav>ul');
	  if(w>960){
		  menu.removeAttr('style');
	  }else{
		  
	  }
	  return;
  });
    });
    

    </script>
</head>
<body>
	<header>
	   <div class="row">
		<h1 id="brand"><a href="javascript:;">장은화</a></h1>
        <div class="hamberger"><a id="pull" href="javascript:;"></a></div>
		<nav id="gnb">
			<a href="#contents" class="blind">skip navigation</a>
			<ul class="clearfix">
				<li><a href="javascript:;" title="Study CSS">Study CSS</a></li>
				<li><a href="javascript:;" title="Study LIB">Study LIB</a></li>
				<li><a href="javascript:;" title="Posts">Posts</a></li>
				<li><a href="javascript:;" title="WordPress">WordPress</a></li>
				<li><a href="javascript:;" title="Login">Login</a></li>
				<li><a href="javascript:;" title="Join">Join</a></li>
			</ul>
		</nav>
	   </div>
	</header>
<!-- e:header-->
<!--  6.3 니보슬라이더 작동 스크립트(아래)
  <script src="/resources/js/jquery.nivo.slider.js"></script>
  <link href="/resources/css/nivo-slider.css" media="screen" rel="stylesheet" type="text/css">
  <script type="text/javascript">
  jQuery(function($){ 
      $('#slider').nivoSlider({
    	  effect:'slideInLeft', //좌우로 왔다갔다
    	  directionNav:true, 
    	  controlNav:false,
    	  pauseOnHover:false, //슬라이드에 마우스 올리면 정지가 기본값인데 슬라이드 정지안되게
    	  prevText:'<span style="font-size:30px; color:#fff; padding-left:10px;">&lt;</span>',
		  nextText: '<span style="font-size:30px; color:#fff; padding-right:10px;">&gt;</span>',
      }); //슬라이드화면 좌우 화살표키 gt(크다)는 오른쪽 lt(작다)는 왼쪽 나오게
      $('.nivo-prevNav').on('mouseover', function(){
          $('#slider img').attr("data-transition","slideInRight");
     });
     $('.nivo-nextNav').on('mouseover', function(){
          $('#slider img').attr("slideInLeft");
     });//왼쪽클릭 왼쪽 오른쪽 클릭 오른쪽
});
  </script>
  -->
  <!--Carousel 스크립트가져와서 붙임 -->
  
 <!-- 부트스트랩 -->
 	<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

 <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	
	<script>
//	jQuery(function($){ 
	$(document).ready(function($) {
	$('.carousel').carousel({
		  interval: 2000,
		  pause: false
		})
	 });
	</script>
	<section class="banner_slider">

   <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li><!-- 사진아래 동그라미 4개 -->
    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>

  </ol>
  <div class="carousel-inner">
   <div class="item active">
      <img src="/resources/images/house.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="item">
      <img src="/resources/images/slide1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="item">
      <img src="/resources/images/slide2.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="item">
      <img src="/resources/images/slide3.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <!-- <a class ="left carousel-control" style="font-size:40px;font-weight:bold;" href="#carouselExampleIndicators"
   data-slide="prev" onclick="$('#myCarousel').carousel('prev')"> 
   <span class="slide_arrow"> &lt; </span>
   </a>
   
  <a class ="right carousel-control" style="font-size:40px;font-weight:bold;" href="#carouselExampleIndicators" 
  data-slide="next" onclick="$('#myCarousel').carousel('next')">
  <span class="slide_arrow"> &gt; </span> 
  </a> -->
  
  <a class="left carousel-control" href="#carouselExampleIndicators" role="button" data-slide="prev">
 	<span class ="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	</a>
  
  <a class="right carousel-control" href="#carouselExampleIndicators" role="button" data-slide="next">
     <span class ="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
 	 </a>
</div>


  <!-- 니보슬라이더용 비지니스 폼 
  	<div id="slider" class="nivoSlider">
      <img src="/resources/images/house.jpg" title="슬라이드1" />
      <img src="/resources/images/slide1.jpg" title="슬라이드2" />
      <img src="/resources/images/slide2.jpg" title="슬라이드3" />
      <img src="/resources/images/slide3.jpg" title="슬라이드4" />
    </div>
    -->
    
  </section>
	<section id="contents" class="row">
		<article id="main">
			<h2>타임스페이스는 사용자 중심의 웹페이지를 제작하는 회사 입니다. 
			그리고, 부가 사업으로 노트북/LCD모니터 리페어(재생) 부분을 운영하고 있습니다.</h2>
			<ul>
				<li class="clearfix">
				   <img class="col-4" src="/resources/images/house.jpg" alt="" width="296" height="206" />
				   <div class="col-8 last">
					<h4>워드프레스 홈페이지 전문제작</h4>
					<p>대부분의 언어가 지원되는 세계적인 홈페이지 제작 기반인 워드프레스를 자체 제작하는 디자인으로
					사용자 위주의 사이트를 제작 해 드립니다.</p>
				   </div>
				</li>
				<li class="clearfix">
				   <img class="col-8 fr last" src="/resources/images/house.jpg" alt="" width="620" height="416" />
				   <div class="col-4">
					<h4>사각 그리드형 홈페이지에는 반응형 웹을 사용합니다.</h4>
					<p>요즘은 홈페이지 접속하는 다양한 방법이 있습니다. 
					모바일로 대표되는 휴대폰이나, 태블릿 그리고, PC 등 다양한 사용자 환경에 여러분의 홈페이지가 노출되게 됩니다.
					공통된 디자인과, 내용을 다양한 접속환경에서 사용하실 수 있게 제작해 드립니다.</p>
				   </div>
				</li>
			</ul>
		</article><!-- e:#main -->
		<article id="sub" class="row clearfix">
			<h3>최근 공지사항<br />
			타임스페이스에서 현재 작업중인 홈페이지와 제작완료된 홈페이지를 보실 수 있습니다.
			재미있는 사이트 구성이 많습니다. 관심있게 살펴봐 주시기 바랍니다.
			</h3>
			<ul>
				<li class="col-3">
					<img src="/resources/images/house.jpg" alt="" width="218" height="325" />
					<h5>글로벌윙사이트 리뉴얼 완료</h5>
					<p>사이트URL: www.globalwing.co.kr ( 제로보드xe기반 ) -> 워드프레스 기반으로 리뉴얼완료
					글로벌윙 사이트 메인시안</p>
				</li>
				<li class="col-3">
					<img src="/resources/images/house.jpg" alt="" width="218" height="326" />
					<h5>크리웰터 사이트 오픈완료.</h5>
					<p>크리웰터 사이트 작업중 입니다. 워드프레스 기반의 영문홈페이지 입니다.
					오픈되었습니다.</p>
				</li>
				<li class="col-6 last">
					<img src="/resources/images/house.jpg" alt="" width="459" height="324" />
					<h5>에코바스 사이트 작업완료.</h5>
					<p>에코바스 사이트는 한글/영문 다국어 사이트로 워드프레스로 작업완료http://eco-bath.co.kr</p>
				</li>
			</ul>
		</article><!-- e:#sub-->
	</section><!-- e:#contents-->
	<footer>
		<p class="row">
			<small>
				© 30-704  충남 천안시 동남구 문암로 76(안서동 115번지) 
				백석대학교 학생복지동 3층 304호 타임스페이스 (창업보육센터 내)
			</small>
		</p>
	</footer><!-- e:footer-->
</body>
</html>