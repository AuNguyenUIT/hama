

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/resources/client/assets" var="url"/>

<!-- Start header section -->
<jsp:include page="./header/mainHeader.jsp" flush="true"/>
<!-- / header section -->

<!-- content -->
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
    <img src="${url}/images/banner-sp.jpg" alt="banner sản phẩm">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Chi tiết sản phẩm</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}">Trang chủ</a></li>
                    <li><a href="${pageContext.request.contextPath}/san-pham">Sản phẩm</a></li>
                    <li style="color:#fff">${product.title }</li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!-- / catg header banner section -->

<!-- product category -->
<section id="aa-product-details">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-product-details-area">
                    <div class="aa-product-details-content">
                        <div class="row">
                            <!-- Modal view slider -->

                            <div class="col-md-7 col-sm-7 col-xs-12">

                                <%--                                <div class="container-fluid px-sm-1 py-5 mx-auto">--%>
                                <div class="row justify-content-center">
                                    <div class="d-flex">
                                        <div class="card" style="margin-top:0 ">
                                            <div class="d-flex flex-column thumbnails">
                                                <c:choose>
                                                    <c:when test="${product.images!=null && !product.images.equals('')}">
                                                        <c:set var="images" value="${fn:split(product.images,';')}"/>
                                                        <c:forEach items="${images}" var="image" varStatus="loop">
                                                            <c:choose>
                                                                <c:when test="${loop.index==0}">
                                                                    <div id="${loop.index+1}" class="tb tb-active"><img
                                                                            class="thumbnail-img fit-image"
                                                                            src="${pageContext.request.contextPath}/resources/upload/product/${product.id}/${image}">
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div id="${loop.index+1}" class="tb"><img
                                                                            class="thumbnail-img fit-image"
                                                                            src="${pageContext.request.contextPath}/resources/upload/product/${product.id}/${image}">
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img width="150px"
                                                             src="${pageContext.request.contextPath}/resources/admin/assets/images/preview.jpg"
                                                             id="thumb_preview" alt="Hình đại diện"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <c:choose>
                                                <c:when test="${product.images!=null && !product.images.equals('')}">
                                                    <c:set var="images" value="${fn:split(product.images,';')}"/>
                                                    <c:forEach items="${images}" var="image" varStatus="loop">
                                                        <c:choose>
                                                            <c:when test="${loop.index==0}">
                                                                <fieldset id="${loop.index+1}1" class="active">
                                                                    <div class="product-pic"><img class="pic0"
                                                                                                  src="${pageContext.request.contextPath}/resources/upload/product/${product.id}/${image}">
                                                                    </div>
                                                                </fieldset>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <fieldset id="${loop.index+1}1">
                                                                    <div class="product-pic">
                                                                        <img class="pic0"
                                                                             src="${pageContext.request.contextPath}/resources/upload/product/${product.id}/${image}">
                                                                    </div>
                                                                </fieldset>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <img width="150px"
                                                         src="${pageContext.request.contextPath}/resources/admin/assets/images/preview.jpg"
                                                         id="thumb_preview" alt="Hình đại diện"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-5 push-bit">
                                <div class="clearfix">
                                    <div class="pull-right">
                                        <span class="h3"><strong>
                                            <fmt:setLocale value="vi_VN" scope="session"/>
                                            <fmt:formatNumber value="${product.price}" type="currency"/>
                                        </strong></span>
                                    </div>
                                    <span>
                                          <span class="h3">
                                            <strong class="text-success">${product.title}</strong>
                                        </span><br/>
                                           <small>
                                                <c:choose>
                                                    <c:when test="${product.status == true}">
                                                        <c:out value="Còn hàng"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:out value="Hết hàng"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </small>
                                    </span>
                                </div>
                                <hr/>
                                ${product.summary}
                                <hr/>
                                <form action="${pageContext.request.contextPath}/them-gio-hang" method="post"
                                      class="push-bit row">
                                    <input hidden value="/san-pham/${product.id}"
                                           name="current_path"/>
                                    <input type="hidden" placeholder="Số lượng" value="${product.id}"
                                           class="form-control quantity" style="width: 5em" min="1" name="product_id">
<%--                                    <div class="form-group col-md-3 col-sm-4 col-xs-12">--%>
<%--                                        <label>Số lượng</label>--%>
<%--                                        <input type="number" placeholder="Số lượng" value="1" name="quantity"--%>
<%--                                               class="form-control quantity" style="width: 5em" min="1">--%>
<%--                                    </div>--%>
                                    <div class="form-group col-md-4 col-sm-4 col-xs-12">
                                        <label>Kích thước</label>
                                        <select id="ecom-addcart-size" name="size" class="form-control"
                                                size="1">
                                            <option value="xs" selected>XS</option>
                                            <option value="s">S</option>
                                            <option value="m">M</option>
                                            <option value="l">L</option>
                                            <option value="xl">XL</option>
                                            <option value="xxl">XXL</option>
                                        </select>
                                    </div>

                                    <div class="form-group col-md-3 col-sm-3 col-xs-12">
                                        <label></label>
                                        <button type="submit" class="btn btn-info"   <c:choose>
                                            <c:when test="${product.status == true}">
                                                <c:out value=""/>
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="disabled"/>
                                            </c:otherwise>
                                        </c:choose>>Thêm giỏ hàng
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="aa-product-details-bottom">
                        <ul class="nav nav-tabs aa-products-tab" id="myTab2">
                            <li class="active"><a href="#description" data-toggle="tab" class="">Mô tả</a></li>
                            <li><a href="#review" data-toggle="tab">Đánh giá</a></li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="description">
                                ${product.description }
                            </div>
                            <div class="tab-pane fade " id="review">
                                <div class="aa-product-review-area">
                                    <ul class="aa-review-nav">
                                        <c:forEach items="${comments}" var="comment">
                                            <li>
                                                <div class="media">
                                                    <div class="media-body">
                                                        <h4 class="media-heading"><strong>${comment.name}</strong> -
                                                            <span><fmt:formatDate value="${comment.created}"
                                                                                  pattern="yyyy-MM-dd HH:mm"/>
                                                          </span>
                                                        </h4>
                                                        <div class="aa-product-rating">
                                                            <span class="fa fa-star"></span>
                                                            <span class="fa fa-star"></span>
                                                            <span class="fa fa-star"></span>
                                                            <span class="fa fa-star"></span>
                                                            <span class="fa fa-star"></span>
                                                        </div>
                                                        <p>${comment.body}</p>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                    <h4>Thêm đánh giá</h4>

                                    <!-- review form -->
                                    <form action="${pageContext.request.contextPath}/san-pham/danh-gia?san-pham=${product_id}"
                                          method="post" class="aa-review-form">
                                        <div class="form-group">
                                            <label for="name">Tên</label>
                                            <input type="text" class="form-control" id="name" placeholder="Tên của bạn"
                                                   value="<c:if test="${sessionScope.uid != null}"><c:out value="${sessionScope.firstname} ${sessionScope.lastname}"></c:out></c:if>"
                                                   name="name">
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="email" class="form-control" id="email"
                                                   value="<c:if test="${sessionScope.uid != null}"><c:out value="${sessionScope.email}"></c:out></c:if>"
                                                   placeholder="example@gmail.com" name="email">
                                        </div>
                                        <div class="form-group">
                                            <label for="message">Đánh giá của bạn</label>
                                            <textarea class="form-control" rows="2" id="message"
                                                      name="message"></textarea>
                                        </div>

                                        <button type="submit" class="btn btn-default aa-review-submit">Gửi</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Related product -->
                    <div class="aa-product-related-item">
                        <h3>SẢN PHẨM LIÊN QUAN</h3>
                        <div class="row product-list">
                            <c:forEach items="${product.category.productList}" var="product" end="4">
                                <c:if test="${product.id != product_id}">
                                    <div class="col-md-3">
                                        <section class="panel offer offer-radius offer-danger ">
                                            <div class="pro-img-box">
                                                <c:if test="${product.sale != 0}">
                                                    <div class="shape">
                                                        <div class="shape-text">
                                                            - ${product.sale} %
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <a class=""
                                                   href="${pageContext.request.contextPath}/san-pham/${product.id}"><img
                                                        src="${pageContext.request.contextPath}/resources/upload/product/${product.id}/${product.thumb}"
                                                        alt="${product.title}"></a>

                                                <form class=""
                                                      action="${pageContext.request.contextPath}/them-gio-hang"
                                                      method="post">
                                                    <input hidden value="${product.id}" name="product_id"/>
                                                    <input hidden value="/san-pham/${product.id}"
                                                           name="current_path"/>
                                                    <button type="submit" class="adtocart"   <c:choose>
                                                        <c:when test="${product.status == true}">
                                                            <c:out value=""/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="disabled"/>
                                                        </c:otherwise>
                                                    </c:choose>><i
                                                            class="fa fa-shopping-cart"></i>
                                                    </button>
                                                </form>
                                            </div>

                                            <div class="panel-body text-center">
                                                <h4>
                                                    <a href="${pageContext.request.contextPath}/san-pham/${product.id}"
                                                       class="pro-title"> ${product.title}</a>
                                                </h4>
                                                <c:choose>
                                                    <c:when test="${product.sale == 0}">
                                                        <p class="price">
                                                            <fmt:setLocale value="vi_VN" scope="session"/>
                                                            <fmt:formatNumber value="${product.price}"
                                                                              type="currency"/></p>
                                                        <p class="price"></p>
                                                    </c:when>
                                                    <c:otherwise>
                                                    <span class="price">
                                                           <fmt:setLocale value="vi_VN" scope="session"/>
                                                            <fmt:formatNumber
                                                                    value="${product.price - product.price*(product.sale/100)}"
                                                                    type="currency"/>
                                                    </span>
                                                        <span class=""><del>
                                                        <fmt:setLocale value="vi_VN" scope="session"/>
                                                        <fmt:formatNumber value="${product.price}" type="currency"/>
                                                        </del>
                                                    </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </section>
                                    </div>
                                </c:if>

                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / product category -->
<!-- end content-->

<!-- footer-->
<jsp:include page="./footer/footer.jsp" flush="true"/>

<script type="application/javascript">
    $(document).ready(function () {

        $(".tb").hover(function () {

            $(".tb").removeClass("tb-active");
            $(this).addClass("tb-active");
            console.log(this);
            current_fs = $(".active");

            next_fs = $(this).attr('id');
            next_fs = "#" + next_fs + "1";

            $("fieldset").removeClass("active");
            $(next_fs).addClass("active");

            current_fs.animate({}, {
                step: function () {
                    current_fs.css({
                        'display': 'none',
                        'position': 'relative'
                    });
                    next_fs.css({
                        'display': 'block'
                    });
                }
            });
        });

    });
</script>

<!-- end footer-->
 
  
