<%--
  Created by IntelliJ IDEA.
  User: VănÂuNguyễn
  Date: 30/05/2021
  Time: 4:36 CH
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%--%>
<%--    response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");--%>
<%--    response.setHeader("Pragma", "no-cache");--%>
<%--    response.setHeader("Expires", "0");--%>


<%--    if (session.getAttribute("admin-username") == null) {--%>
<%--        response.sendRedirect(request.getContextPath() + "/admin/login");--%>
<%--    }--%>
<%--%>--%>
<!-- Start header section -->
<jsp:include page="./header/header.jsp" flush="true"/>
<div class="content-wrapper">
    <div class="container-fluid">
        <!--End Row-->
        <div class="row">
            <div class="col-lg-12">
                <button class="add-catalog"><a href="${pageContext.request.contextPath}/quan-tri/danh-muc/them">Thêm
                    chuyên
                    mục</a></button>
            </div>
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Danh sách danh mục</h5>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Hình đại diện</th>
                                    <th scope="col">Tên danh mục</th>
                                    <th scope="col">Danh mục cha</th>
                                    <th scope="col">Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${categories}" var="cate" varStatus="loop">
                                    <tr>
                                        <td scope="row">${loop.index+1}</td>
                                        <td scope="row">
                                            <c:if test="${cate.thumb !=null && cate.thumb!=''}">
                                                <img width="150px"
                                                     src="${pageContext.request.contextPath}/resources/upload/category/${cate.thumb}">
                                            </c:if>
                                        </td>
                                        <td>${cate.title}</td>
                                        <td>${cate.category.title}</td>
                                        <td>
                                            <a class="btn btn-danger"
                                               href="${pageContext.request.contextPath}/quan-tri/danh-muc/xoa?id=${cate.id}">Xóa</a>
                                            <a class="btn btn-success"
                                               href="${pageContext.request.contextPath}/quan-tri/danh-muc/chinh-sua?id=${cate.id}">Sửa</a>
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
    </div>
</div>

<jsp:include page="./footer/footer.jsp" flush="true"/>