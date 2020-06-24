<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
  
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">DashBoard Management</h1> 
          </div><!-- /.col -->
          
          <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item active"><a href="#">forms</a></li>
          <li class="breadcrumb-item active">General Element</li>
          </ol>
          </div><!-- /.col -->
<!-- 200622 -->

                <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">게시판 검색</h3>
                </div>
                </div>
                </div>
                <div class="col-1" style="display:inline-block" >
                        <select class="form-control">
                          <option>--</option>
                        </select>
                        </div>
                        <div class="search" style="display:inline">
     <input type="text" placeholder="">
<div class="button" style="display:inline">
     <button>검색</button>
</div>
<div class="button" style="display:inline">
     <button>새글쓰기</button>
     </div>
 </div>
</div>
			
           
        <!--  여기부터 -->
        
         <div class="row">
          <div class="col-12">
           
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">LIST ALL PAGE</h3>
                <div class="input-group-append"> 
               </div>
              </div>
             
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      <th>BNO</th>
                      <th>TITLE</th>
                      <th>VIEWCNT</th>
                      <th>REGDATE</th>
                      <th>VIEWCNT</th>
                    </tr>
                  </thead>
                 
                  <tbody>
                    <tr>
                      <td>183</td>
                       <td>홈페이지 오픈 테스트</td>
                      <td>John Doe</td>
                      <td>11-7-2014</td>
                      <td><span data-toggle="tooltip" title="" class="badge bg-yellow" data-original-title="3 New Messages">0</span></td>
                      
                      
                    </tr>
                    <tr>
                      <td>219</td>
                       <td>새로운 글을 넣습니다</td>
                      <td>Alexander Pierce</td>
                      <td>11-7-2014</td>
                      <td><span data-toggle="tooltip" title="" class="badge bg-yellow" data-original-title="3 New Messages">3</span></td>
                    </tr>
                    <tr>
                      <td>657</td>
                      <td>새로운 글을 넣습니다</td>
                      <td>Bob Doe</td>
                      <td>11-7-2014</td>
                      <td><span data-toggle="tooltip" title="" class="badge bg-yellow" data-original-title="3 New Messages">0</span></td>
                    </tr>
                    <tr>
                      <td>175</td>
                      <td>새로운 글을 넣습니다</td>
                      <td>Mike Doe</td>
                      <td>11-7-2014</td>
                      <td><span data-toggle="tooltip" title="" class="badge bg-yellow" data-original-title="3 New Messages">1</span></td>
                    </tr>
                  </tbody>
                </table>
              </div> <!-- /.card-body -->
              
            </div>
            <!-- /.card -->
          </div>
    <!-- /.content-header -->
 <%@ include file="../include/footer.jsp" %>