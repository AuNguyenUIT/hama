<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/resources/admin/assets" var="url"/>
    <div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">
      <div class="brand-logo">
        <a href="${pageContext.request.contextPath}/quan-tri">
          <img src="${url}/images/images/logo.png" class="logo-icon" alt="logo icon">
          <h5 class="logo-text">Admin Hama</h5>
        </a>
      </div>
      <ul class="sidebar-menu do-nicescrol">
        <li class="sidebar-header">MENU ADMIN</li>
        <li>
          <a href="${pageContext.request.contextPath}/quan-tri">
            <i class="zmdi zmdi-view-dashboard"></i> <span>Tổng quan</span>
          </a>
        </li>
        <li>
          <a href="${pageContext.request.contextPath}/quan-tri/nguoi-dung/danh-sach">
            <i class="zmdi zmdi-accounts"></i> <span>Quản lí người dùng</span>
          </a>
        </li>
        <li>
          <a href="${pageContext.request.contextPath}/quan-tri/danh-muc/danh-sach">
            <i class="zmdi zmdi-grid"></i> <span>Danh Mục</span>
          </a>  
        </li>
        <li>
          <a href="${pageContext.request.contextPath}/quan-tri/san-pham/danh-sach">
            <i class="zmdi zmdi-widgets"></i> <span>Danh Sách Sản Phẩm</span>
          </a>
        </li>
        <li>
          <a href="${pageContext.request.contextPath}/quan-tri/don-hang/danh-sach">
            <i class="zmdi zmdi-shopping-cart"></i> <span>Đơn Hàng</span>
          </a>
        </li>

<%--        <li>--%>
<%--          <a href="${pageContext.request.contextPath}/quan-tri/order/list-detail">--%>
<%--            <i class="zmdi zmdi-shopping-cart"></i> <span>Chi Tiết Đơn Hàng</span>--%>
<%--          </a>--%>
<%--        </li>--%>
        <li>
          <a href="${pageContext.request.contextPath}/quan-tri/danh-gia/danh-sach">
            <i class="zmdi zmdi-calendar-check"></i> <span>Đánh giá</span>
          </a>
        </li>
<%--        <li>--%>
        <%--          <a href="${pageContext.request.contextPath}/quan-tri/new/list">--%>
        <%--            <i class="icon-envelope-open"></i> <span>Tin tức</span>--%>
        <%--          </a>--%>
        <%--        </li>--%>
        <li> <a href="${pageContext.request.contextPath}/quan-tri/bai-viet/danh-sach">
            <i class="icon-notebook"></i> <span>Bài viết</span>
          </a>
        </li>
      </ul>
    </div>