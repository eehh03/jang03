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
/* CONTACT US 영역 CSS */
.contact-section{
margin-top:109px;
}
.contact-section .sec-tit{
margin-bottom:47px;
text-align:center;
}
.contact-section .form-box .form input{
    width:100%;
    background:transparent;/*색상없음.배경색과 똑같아짐.*/
    line-height:1.2;
    padding:0 2px;
    height:50px;
    outline:none;
    border:none;/*name,phone,email박스 선*/
    border-bottom:2px solid #dbdbdb;
}
.blind{ /* 라벨 태그 숨기기 */
position:absolute;
width:0;/*0이니 안보임*/
height:0;/*영역안차지하려 0으로.*/
line-height:0;
text-indent:-9999px;/*-라 왼쪽으로 아예들어가있어서 안보일것임.이거많이씀*/
overflow:hidden;
}/*name name에서 숨겨서 name만 뜸.*/
.contact-section .form-box .textarea textarea{
width:100%;
background:transparent;
line-height:1.2;
outline:none;/*아마 아무색안나오게하려고*/
border:none;
border-bottom:2px solid #dbdbdb;
min-height:150px;/*150픽셀의 입력박스만듬*/
padding-top:13px;
padding-bottom:13px;
}/*메세지 숨기기*/
.contact-section .form-box .send-btn{
margin-top:36px;
text-align:right;
}
.contact-section .form-box .send-btn button{
padding:15px;/*메시지보내기 칸 크기*/
margin:0;
border:0;
font-size:12px;
color:#fff;
background:#3f51b5;
font-family:"궁서";
cursor:pointer;
}

/*태블릿용 CSS*/
@media all and (min-width:768px){

/*태블릿 contact us 영역 css*/
.contact-section{
margin-top:176px;
}
.contact-section .sec-tit{
margin-bottom:76px;
}
.contact-section .form-box .form, 
.contact-section .form-box .textarea{
float:left;
width:48.69791666666667%;
/* 374px ÷ 768px*/
  }
.contact-section .form-box .form{
margin-right:2.604166666666667%;
/* 20px ÷ 768px*/
}
.contact-section .form-box .form input:last-child{
margin-bottom:0;
} }

/*PC용 contact us CSS*/
@media all and (min-width:1132px){

.contact-section .sec-tit{
float:left;
margin-bottom:0;
}
.contact-section .form-box{
float:right;/*타이틀이 가로이니 박스를 오른쪽에 둬서 한줄에*/
width:74.5583333333333%;
}
.contact-section .form-box .form, 
.contact-section .form-box .textarea{
width:48.8151658777777%;
}
.contact-section .form-box .form{
margin-right:2.3696688888888%;
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

	</div>
	<section class="contact-section">
                <div class="container">
                    <h2 class="sec-tit">CONTACT</h2>
                    <div class="form-box">
                        <form action="" method="">
                            <fieldset class="cfixed">
                                <legend class="blind">CONTACT US</legend>
                                <div class="form">
                                    <label for="name" class="blind">name</label>
                                    <input type="text" id="name" placeholder="Name">
                                    <label for="phone" class="blind">phone</label>
                                    <input type="tel" id="phone" placeholder="Phone">
                                    <label for="email" class="blind">email</label>
                                    <input type="email" id="email" placeholder="Email Address">
                                </div>
                                <div class="textarea">
                                    <label for="message" class="blind">message</label>
                                    <textarea name="message" id="message" placeholder="Message"></textarea>
                                </div>
                            </fieldset>
                            <div class="send-btn">
                                <button>메세지 보내기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        <footer class="footer">

			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3193.1908531424174!2d127.18028131558675!3d36.83790497994078!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b293c64087a5b%3A0x1873dee0e6399a00!2z67Cx7ISd66y47ZmU64yA7ZWZ6rWQ!5e0!3m2!1sko!2skr!4v1513569521608" width="600" height="450" frameborder="0" style="border:0" allowfullscreen=""></iframe>
			<p class="copyright">LOGO</p>
		</footer>
</body>
</html>

<!-- 구글지도넣기 참조:  -->