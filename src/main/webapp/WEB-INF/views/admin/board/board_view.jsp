<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-12">
							<h1 class="m-0 text-dark">DashBoard Management</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-12">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Starter Page</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
				<div class="col-md-12">
					<!-- general form elements disabled -->
					<div class="card card-warning">
						<div class="card-header">
							<h3 class="card-title">READ BOARD</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<form role="form" action="/admin/board/delete" method="post">
								<div class="row">
									<div class="col-sm-12">
										<!-- text input -->
										<div class="form-group">
											<label>Title</label> <br> ${boardVO.title}
										</div>
									</div>

									<div class="col-sm-12">
										<!-- text input -->
										<div class="form-group">
											<label>Content</label>
											 <br>
											 <textarea name="content" class="form-control" rows="3"
												placeholder="Enter Writer">${boardVO.content}</textarea>
										</div>
									</div>

									<div class="col-sm-12">
										<!-- text input -->
										<div class="form-group">
											<label>Writer</label> <br> ${boardVO.writer}
										</div>
									</div>
									
									<div class="col-sm-12">
										<!-- text input -->
										<div class="form-group">
											<label>FileDownload</label> <br> 
											<a href="/download?filename=${boardVO.files[0]}">${boardVO.files[0]}</a>
											
										</div>
									</div>
									
									<div class="buttons">
										<a href="/admin/board/update?bno=${boardVO.bno}&page=${pageVO.page}" class="btn btn-warning">UPDATE</a>
										<button type="submit" class="btn btn-danger">DELETE</button>
										<a href="/admin/board/list?page=${pageVO.page}" class="btn btn-primary">LIST ALL</a>
									</div>
								</div>
							<input type="hidden" name="bno" value="${boardVO.bno}">
							</form>
						</div>
						<!-- /.content-header -->


						<div class="col-md-12">
							<!-- general form elements disabled -->
							<div class="card card-default">
								<div class="card-header">
									<h3 class="card-title">ADD NEW REPLY</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<form role="form">
										<div class="row">
											<div class="col-sm-12">
												<!-- text input -->
												<div class="form-group">
													<label>Writer</label> <input id="replyerInput" type="text"
														class="form-control" placeholder="USER ID">
												</div>
											</div>

											<div class="col-sm-12">
												<!-- text input -->
												<div class="form-group">
													<label>Reply Text</label> <input id="replytextInput" type="text"
														class="form-control" placeholder="REPLY TEXT">
												</div>
											</div>
											<a href="javascript:;" id="insertApplyBtn" class="btn btn-info">ADD REPLY</a>
										</div>

									</form>
								</div>


								<div class="col-md-12">
									<!-- general form elements disabled -->
									<div class="timeline">
										<!-- timeline time label -->
										<div class="time-label" id="replyDiv">
											<span class="bg-green">Replies List[1]</span>
										</div>
										<!-- /.timeline-label -->
										<!-- 댓글 리스트 반복문용  JQuery라이브러리 ==jstl의  forEach와 같은 역활 -->
										<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
										<script id="template" type="text/x-handlebars-template"> 

										{{#each .}}
											<div class="replyLi" data-rno={{rno}}>
											<i class="fas fa-comments bg-blue"></i>
											<div class="timeline-item">
												<h3 class="timeline-header">
													<a href="#">{{rno}}-{{replyer}}</a> 												</h3>
												<div class="timeline-body">{{replytext}}</div>
												<div class="timeline-footer">
													<a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modifyModal">Modify</a>
												</div>
											</div>
										</div>
										{{/each}}
										</script>
										<script>
										//댓글 변수+함수 초기화
										var bno =${boardVO.bno}; //댓글이 물려있기에 bno가 필요
										//replyArr=JSON 배열데이터, target=출력위치, templateObject=반복구문
										var printData = function(replyArr, target, templateObject) {
											var template = Handlebars.compile(templateObject.html()); //변수인데 함수가 있는 변수임. 
											var html = template(replyArr);
											$(".replyLi").remove();
											target.after(html);//출력위치 다음장소에 저장.	
										}
										function getPage(pageInfo) {
											$.getJSON(pageInfo, function(data){
												printData(data, $("#replyDiv"), $("#template"));
												//$("#modifyModal").modal('hide');
											});//pageInfo JSON값 받아와-> date-> printData ->replyLi로. 
										}
										//여기까지는 번수/함수 정의하고. 실제 사용은 아래부터 실행
										//댓글 리스트 실행
										$(document).ready(function(){
											getPage("/reply/select/" + bno);
										});
										
										</script>

										<!-- timeline item -->
										<!-- <div>
											<i class="fas fa-comments bg-blue"></i>
											<div class="timeline-item">
												<h3 class="timeline-header">
													<a href="#">26-test</a> 												</h3>
												<div class="timeline-body">댓글 테스트입니다.</div>
												<div class="timeline-footer">
													<a class="btn btn-primary btn-sm">Modify</a>
												</div>
											</div>
										</div> -->
										<!-- END timeline item -->
									</div>
								</div>
								
							</div>
								<script>
								$(document).ready(function(){
									$("#insertApplyBtn").bind("click",function(){
										var replyer = $("#replyerInput").val();
										var replytext =$("#replytextInput").val();
										$.ajax({
											type:'post', 
											url:'/reply/insert',
											headers: {
												"Content-Type": "application/json",
												"X-HTTP-Method-Override": "POST"
												},
												dataType:'text',
												data: JSON.stringify({
													bno:bno,
													replyer:replyer,
													replytext:replytext
												}),
												success:function(result){
													if(result == 'SUCCESS'){
														alert("등록 되었습니다.");
														getPage("/reply/select/" + bno);
														$("#replyerInput").val("");
														$("#replytextInput").val("");
													}
											}	
										});
										
									});
								});
								
								</script>
								
								<div id="modifyModal" class="modal modal-primary fade" role="dialog">
									  <div class="modal-dialog">
									    <!-- Modal content-->
									    <div class="modal-content">
									      <div class="modal-header" style="display:block;">
									   <button type="button" class="close" data-dismiss="modal">&times;</button>
									   <h4 class="modal-title"></h4>
									      </div>
									      <div class="modal-body" data-rno>
									   <p><input type="text" id="replytext" class="form-control"></p>
									      </div>
									      <div class="modal-footer">
									   <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
									   <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
									   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									      </div>
									    </div>
									  </div>
									</div>
							<script>
								
								$(document).ready(function(){
									//선택한 댓글에 대한 모달창에 데이터 바인딩하는 코드(수정,삭제들어가기 전단계)
									$(".timeline").on("click",".replyLi", function(event){ 
										var reply = $(this); 
										$("#replytext").val(reply.find('.timeline-body').text()); 
										$(".modal-title").html(reply.attr("data-rno"));
										
									});
								});
								</script>
								
								
							<td>
								<nav aria-label="Contacts Page Navigation">
									<ul class="pagination justify-content-center m-0">
										<li class="page-item active"><a class="page-link"
											href="#">1</a></li>
									</ul>
								</nav>
							</td>
							<!-- Main content -->
							<div class="content"></div>
							<!-- .content  -->
						</div>
						
					</div>
				</div>
			</div>
			</div>
			<!-- //Content Wrapper -->
<%@ include file="../include/footer.jsp" %> 