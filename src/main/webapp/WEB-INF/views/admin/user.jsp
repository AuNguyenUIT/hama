<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- Start header section -->
  <jsp:include page = "./header/header.jsp" flush = "true" />
    <div class="content-wrapper">
      <div class="container-fluid">

        <div class="row mt-3">
          <div class="col-lg-12">
            <button class="add-catalog"><a href="${pageContext.request.contextPath}/quan-tri/user/add">Thêm User</a></button>
          </div>  
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Danh sách User</h5>
                <div class="table-responsive">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Họ</th>
                        <th scope="col">Tên</th>
                        <th scope="col">Email</th>
                        <th scope="col">Số điện thoại</th>
                        <th scope="col">Username</th>
                        <th scope="col">Ngày tạo</th>
                         <th scope="col">Hành động</th>
             
                      </tr>
                    </thead>
                    <tbody>
                  <c:forEach items="${userList}" var="user" varStatus="loop">
                      <tr>
                        <th scope="row">${loop.index+1 }</th>
                        <td>${user.lastName} </td>
                        <td>  ${user.firstName }</td>
        				<td>${user.mail }</td>
        				<td>${user.phoneNumber }</td>
        				<td>${user.userName }</td>
        				<td>${user.created }</td>
        				 <td>
                          <button class="btn btn-danger" onclick="myfunction4()"><a href="${pageContext.request.contextPath}/quan-tri/user/delete?id=${user.id}">Xóa</a></button>
                         
                          <button class="btn btn-success"><a href="${pageContext.request.contextPath}/quan-tri/user/update?id=${user.id}">Sửa</a></button>
                        </td>
                     </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="overlay toggle-menu"></div>
      </div>
    </div>
          <script>
              function myfunction4(){
                  var x = confirm("Bạn có chắc chắn muốn xóa không?");
  if (x){
      alert("Xóa thành công");
      return true;
  }
  else
    return false;
              }
          </script>
  
    <jsp:include page = "./footer/footer.jsp" flush = "true" />