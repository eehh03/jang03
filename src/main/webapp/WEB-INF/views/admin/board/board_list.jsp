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
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">DashBoard Management</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Starter Page</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
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
     <input type="text" name="search_keyword" placeholder="">
<div class="button" style="display:inline">
     <button name="btn_search">검색</button>
</div>
<div class="button" style="display:inline">
     <button>새글쓰기</button>
     </div>
                        </div>
    
</div>
        <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">LIST ALL PAGE</h3>

                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      <th>BNO</th>
                      <th>TITLE</th>
                      <th>WRITE</th>
                      <th>REGDATE</th>
                      <th>VIEWCNT</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${boardList}" var="boardVO" varStatus="status">
                    <tr>
                      <td>${boardVO.bno}</td>
                      <td><a href="/admin/board/view?bno=${boardVO.bno}&page=${pageVO.page}">${boardVO.title}</a></td>
                      <td>${boardVO.writer}</td>
                      <td><span class="tag tag-success">${boardVO.regdate}</span></td>
                      <td><span class="badge badge-danger right">${boardVO.view_count}</span></td>
                    </tr>
                    </c:forEach>
                  </tbody>
            <td> <a href="/admin/board/write" class="btn btn-primary">CREATE</a>
               </td>
           <td>
          <nav aria-label="Contacts Page Navigation">
          	<ul class="pagination" style="position:relative;left:40%;">
          	<c:if test="${pageVO.prev}">
       		<li class="page-item">
          		<a class="page-link" href="/admin/board/list?page=${pageVO.startPage-1}">이전</a>
       		</li>
          	</c:if>
          	<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="idx">
          		<li class='page-item <c:out value="${idx==pageVO.page?'active':''}"/>'><a href="/admin/board/list?page=${idx}" class="page-link">${idx}</a></li>
          	</c:forEach>
          	<c:if test="${pageVO.next}">
       		<li class="page-item">
          		<a class="page-link" href="/admin/board/list?page=${pageVO.endPage+1}">다음</a>
       		</li>
          	</c:if>
            </ul>  
          </nav>
               </td>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
 
    
    </div>
    <!-- ./Content Wrapper. Contains page content -->
<%@ include file="../include/footer.jsp" %> 