<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/resources/admin/assets" var="url"/>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Quản trị Hama</title>

  <link href="${url}/css/pace.min.css" rel="stylesheet" />
  <script src="${url}/js/pace.min.js"></script>
  <script src="${url}/js/jquery.min.js"></script>

  <script src="${url}/js/show_message.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
  <link rel="stylesheet" href="${url}/plugins/summernote/dist/summernote-bs4.css"/>
  <link rel="icon" href="${url}/images/images/favicon.png" type="image/x-icon">
  <link href="${url}/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
  <link href="${url}/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
  <link href="${url}/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${url}/css/animate.css" rel="stylesheet" type="text/css" />
  <link href="${url}/css/icons.css" rel="stylesheet" type="text/css" />
  <link href="${url}/css/sidebar-menu.css" rel="stylesheet" />
  <link href="${url}/css/app-style.css" rel="stylesheet" />
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
  <!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" />
</head>

<body class="bg-theme bg-theme1">


  <!-- start loader -->
  <div id="pageloader-overlay" class="visible incoming">
    <div class="loader-wrapper-outer">
      <div class="loader-wrapper-inner">
        <div class="loader"></div>
      </div>
    </div>
  </div>


 <div id="wrapper">
  <jsp:include page = "./left-sidebar.jsp" flush = "true" />
    <header class="topbar-nav">
      <nav class="navbar navbar-expand fixed-top">
        <ul class="navbar-nav mr-auto align-items-center">
          <li class="nav-item">
            <a class="nav-link toggle-menu" href="javascript:void();">
              <i class="icon-menu menu-icon"></i>
            </a>
          </li>
        </ul>

        <ul class="navbar-nav align-items-center right-nav-link">
          <li class="nav-item">
            <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown" href="#">
              <span class="user-profile"><img src="${pageContext.request.contextPath}/resources/admin/assets/images/images/logo.png" class="img-circle"
                  alt="user avatar"></span>
            </a>
            <ul class="dropdown-menu dropdown-menu-right">
              <li class="dropdown-item user-details">
                <a href="javaScript:void();">
                  <div class="media">
                    <div class="avatar"><img class="align-self-start mr-3" src="${pageContext.request.contextPath}/resources/admin/assets/images/avatar-admin.png"
                        alt="user avatar"></div>
                    <div class="media-body">
                      <h6 class="mt-2 user-title">Hama</h6>
                	<b> Admin:  <%=session.getAttribute("username") %></b>
                    </div>
                  </div>
                </a>
              </li>

              <li class="dropdown-divider"></li>
			 <li class="dropdown-item"><i class="icon-power mr-2"></i><a href="${pageContext.request.contextPath}/dang-xuat"> Đăng xuất</a></li>
            </ul>
          </li>
        </ul>
      </nav>
    </header>
    <div class="clearfix"></div>
    