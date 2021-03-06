<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/resources/client/assets" var="url"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Start header section -->
<jsp:include page="./header/mainHeader.jsp" flush="true"/>
<!-- / header section -->

<!-- Start slider -->
<jsp:include page="./banner-slider/slider.jsp" flush="true"/>
<!-- / slider -->

<!-- Start Promo section -->
<section id="aa-promo">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-promo-area">
                    <div class="row">
                        <!-- promo left -->
                        <div class="col-md-4 no-padding">
                            <div class="aa-promo-left">
                                <div class="aa-promo-banner">
                                    <img src="${url}/images/images/sub1.jpg" alt="dâu tây Đà Lạt">
                                    <div class="aa-prom-content">

                                    </div>
                                </div>
                            </div>
                            <div class="aa-promo-left">
                                <div class="aa-promo-banner">
                                    <img src="${url}/images/images/sub2.jpg" alt="dâu tây Đà Lạt">
                                    <div class="aa-prom-content">

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- promo right -->
                        <div class="col-md-4 no-padding">
                            <div class="aa-promo-middle">
                                <div class="aa-single-promo-left">
                                    <div class="aa-promo-banner">
                                        <img src="${url}/images/images/sub3.gif" alt="hạt tiêu daklak">
                                        <div class="aa-prom-content">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 no-padding">
                            <div class="aa-promo-right">

                                <div class="aa-promo-banner">
                                    <img src="${url}/images/images/sub4.jpg" alt="img">
                                    <div class="aa-prom-content">

                                    </div>
                                </div>


                                <div class="aa-promo-banner">
                                    <img src="${url}/images/images/sub5.jpg" alt="img">
                                    <div class="aa-prom-content">

                                    </div>
                                </div>
                            </div>


                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Promo section -->
<!-- Products section -->
<section id="aa-product">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="aa-product-area">
                        <div class="aa-product-inner">
                            <!-- start prduct navigation -->
                            <ul class="nav nav-tabs aa-products-tab">
                                <c:forEach items="${categories}" var="category" end="4" varStatus="loop">
                                    <%--                                    <li class="active"><a href="#${category.id}" data-toggle="tab">${category.title}</a></li>--%>
                                    <c:choose>
                                        <c:when test="${loop.index == 0}">
                                            <li class="active"><a href="#${category.id}"
                                                                  data-toggle="tab">${category.title}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li><a href="#${category.id}" data-toggle="tab">${category.title} </a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <!-- Start men product category -->
                                <c:forEach items="${categories}" var="category" end="4" varStatus="loop">
                                    <c:choose>
                                        <c:when test="${loop.index == 0}">
                                            <div class="tab-pane fade in active" id="${category.id}">
                                                <div class="row product-list">
                                                    <c:forEach items="${category.productList}" var="product" end="8">
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
                                                                        <input hidden value="${product.id}"
                                                                               name="product_id"/>
                                                                        <input hidden value="/"
                                                                               name="current_path"/>
                                                                        <button type="submit" class="adtocart"><i
                                                                                class="fa fa-shopping-cart"></i>
                                                                        </button>
                                                                    </form>
                                                                </div>

                                                                <div class="panel-body text-center">
                                                                    <h3>
                                                                        <a href="${pageContext.request.contextPath}/san-pham/${product.id}"
                                                                           class="pro-title"> ${product.title}</a>
                                                                    </h3>
                                                                    <c:choose>
                                                                        <c:when test="${product.sale == 0}">
                                                                            <span class="price">
                                                                                <fmt:setLocale value="vi_VN"
                                                                                               scope="session"/>
                                                                                <fmt:formatNumber
                                                                                        value="${product.price}"
                                                                                        type="currency"/></span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span class="price">
                                                                                   <fmt:setLocale value="vi_VN"
                                                                                                  scope="session"/>
                                                                                    <fmt:formatNumber
                                                                                            value="${product.price - product.price*(product.sale/100)}"
                                                                                            type="currency"/>
                                                                            </span>
                                                                            <span class=""><del>
                                                                                <fmt:setLocale value="vi_VN"
                                                                                               scope="session"/>
                                                                                <fmt:formatNumber
                                                                                        value="${product.price}"
                                                                                        type="currency"/>
                                                                                </del>
                                                                            </span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>
                                                            </section>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="tab-pane fade in" id="${category.id}">
                                                <div class="row product-list">
                                                    <c:forEach items="${category.productList}" var="product" end="8">
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
                                                                        <input hidden value="${product.id}"
                                                                               name="product_id"/>
                                                                        <input hidden value="/"
                                                                               name="current_path"/>
                                                                        <button type="submit" class="adtocart"><i
                                                                                class="fa fa-shopping-cart"></i>
                                                                        </button>
                                                                    </form>
                                                                </div>

                                                                <div class="panel-body text-center">
                                                                    <h3>
                                                                        <a href="${pageContext.request.contextPath}/san-pham/${product.id}"
                                                                           class="pro-title"> ${product.title}</a>
                                                                    </h3>
                                                                    <c:choose>
                                                                        <c:when test="${product.sale == 0}">
                                                                            <span class="price">
                                                                                <fmt:setLocale value="vi_VN"
                                                                                               scope="session"/>
                                                                                <fmt:formatNumber
                                                                                        value="${product.price}"
                                                                                        type="currency"/></span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span class="price">
                                                                                   <fmt:setLocale value="vi_VN"
                                                                                                  scope="session"/>
                                                                                    <fmt:formatNumber
                                                                                            value="${product.price - product.price*(product.sale/100)}"
                                                                                            type="currency"/>
                                                                            </span>
                                                                            <span class=""><del>
                                                                                <fmt:setLocale value="vi_VN"
                                                                                               scope="session"/>
                                                                                <fmt:formatNumber
                                                                                        value="${product.price}"
                                                                                        type="currency"/>
                                                                                </del>
                                                                            </span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>
                                                            </section>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="more-product">
                            <a class="aa-browse-btn" href="${pageContext.request.contextPath}/san-pham">Xem
                                Tất Cả Sản Phẩm <span class="fa fa-long-arrow-right"></span></a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Products section -->
<!-- banner section -->
<section id="aa-banner">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="aa-banner-area">
                        <a href="#"><img src="${url}/images/images/sub6.png" alt="banner trang chủ"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- popular section -->
<section id="aa-popular-category">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="aa-popular-category-area">
                        <!-- start prduct navigation -->
                        <ul class="nav nav-tabs aa-products-tab">
                            <li class="active"><a href="#sanphammoi" data-toggle="tab">Sản Phẩm Mới</a></li>
                            <li><a href="#sanphambanchay" data-toggle="tab">Sản Phẩm Bán Chạy</a></li>
                            <li><a href="#sanphamgiamgia" data-toggle="tab">Sản Phẩm Giảm Giá</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <!-- Start men popular category -->
                            <div class="tab-pane fade in active" id="sanphammoi">
                                <div class="row product-list">
                                    <c:forEach items="${productsNew}" var="product" end="8">
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
                                                        <input hidden value="${product.id}"
                                                               name="product_id"/>
                                                        <input hidden value="/"
                                                               name="current_path"/>
                                                        <button type="submit" class="adtocart"><i
                                                                class="fa fa-shopping-cart"></i>
                                                        </button>
                                                    </form>
                                                </div>

                                                <div class="panel-body text-center">
                                                    <h3>
                                                        <a href="${pageContext.request.contextPath}/san-pham/${product.id}"
                                                           class="pro-title"> ${product.title}</a>
                                                    </h3>
                                                    <c:choose>
                                                        <c:when test="${product.sale == 0}">
                                                            <span class="price">
                                                                <fmt:setLocale value="vi_VN" scope="session"/>
<<<<<<< HEAD
                                                                <fmt:formatNumber value="${product.price}"
                                                                                  type="currency"/></p>
                                                            <p class="price"></p>
=======
                                                                <fmt:formatNumber   value="${product.price}" type="currency"/></span>
>>>>>>> e878598924e0b7cdfeef93710f55a789a237aa44
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
                                                                <fmt:formatNumber value="${product.price}"
                                                                                  type="currency"/>
                                                                </del>
                                                            </span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </section>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <!-- / popular product category -->

                            <!-- start featured product category -->
                            <div class="tab-pane fade" id="sanphambanchay">
                                <ul class="aa-product-catg aa-popular-slider">
                                    <!-- start single product item -->
                                    <c:forEach items="${product_banchay}" var="product">
                                        <li>
                                            <figure>
                                                <a class="aa-product-img"
                                                   href="${pageContext.request.contextPath}/san-pham/${product.id}"><img
                                                        src="${pageContext.request.contextPath}/resources/client/assetsimages/products/img-test/${product.image_link}"
                                                        alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn"
                                                   href="${pageContext.request.contextPath}/view/client/add-cart?product-id=${product.id}"><span
                                                        class="fa fa-shopping-cart"></span>Thêm vào giỏ hàng</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a
                                                            href="${pageContext.request.contextPath}/san-pham/${product.id}">${product.name }</a>
                                                    </h4>
                                                    <c:choose>
                                                        <c:when test="${product.discount == 0}">
                                                            <span class="aa-product-price">${product.price} VNĐ</span><span
                                                                class="aa-product-price"></span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach items="${productlist1}" var="product1">
                                                                <c:if test="${product1.id == product.id}">
                                                                    <span class="aa-product-price">${product1.price} VNĐ</span>
                                                                    <span class="aa-product-price"><del>${product.price} VNĐ</del></span>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </figcaption>
                                            </figure>

                                            <c:if test="${product.discount != 0}">
                                                <!-- product badge -->
                                                <span class="aa-badge aa-sale">- ${product.discount}%</span>
                                            </c:if>
                                        </li>
                                    </c:forEach>
                                    <!-- start single product item -->
                                    <!-- start single product item -->

                                </ul>

                            </div>
                            <!-- / featured product category -->

                            <!-- start latest product category -->
                            <div class="tab-pane fade" id="sanphamgiamgia">


                                <div class="row product-list">
                                    <c:forEach items="${productsSale}" var="product" end="8">
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
                                                        <input hidden value="${product.id}"
                                                               name="product_id"/>
                                                        <input hidden value="/"
                                                               name="current_path"/>
                                                        <button type="submit" class="adtocart"  <c:choose>
                                                            <c:when test="${product.status == true}">
                                                                <c:out value=""/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="disabled"/>
                                                            </c:otherwise>
                                                        </c:choose> ><i
                                                                class="fa fa-shopping-cart"></i>
                                                        </button>
                                                    </form>
                                                </div>

                                                <div class="panel-body text-center">
                                                    <h3>
                                                        <a href="${pageContext.request.contextPath}/san-pham/${product.id}"
                                                           class="pro-title"> ${product.title}</a>
                                                    </h3>
                                                    <c:choose>
                                                        <c:when test="${product.sale == 0}">
                                                            <span class="price">
                                                                <fmt:setLocale value="vi_VN" scope="session"/>
<<<<<<< HEAD
                                                                <fmt:formatNumber value="${product.price}"
                                                                                  type="currency"/></p>
                                                            <p class="price"></p>
=======
                                                                <fmt:formatNumber   value="${product.price}" type="currency"/></span>
>>>>>>> e878598924e0b7cdfeef93710f55a789a237aa44
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
                                                                <fmt:formatNumber value="${product.price}"
                                                                                  type="currency"/>
                                                                </del>
                                                            </span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </section>
                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- / latest product category -->
                            </div>
                            <div class="more-product">
                                <a class="aa-browse-btn" href="${pageContext.request.contextPath}/san-pham">Xem
                                    Tất Cả Sản Phẩm <span class="fa fa-long-arrow-right"></span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / popular section -->
<!-- Support section -->
<section id="aa-support">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-support-area">
                    <!-- single support -->
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="aa-support-single">
                            <span class="fa fa-truck"></span>
                            <h4>MIỄN PHÍ VẬN CHUYỂN</h4>
                            <P>Chúng tôi đã áp dụng gói miễn phí vận chuyển cho đơn hàng trên 280.000VNĐ.</P>
                        </div>
                    </div>
                    <!-- single support -->
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="aa-support-single">
                            <span class="fa fa-clock-o"></span>
                            <h4>GIAO HÀNG NHANH</h4>
                            <P>Chúng tôi đảm bảo hàng đến tay khách hàng nhanh và đảm bảo sản phẩm an toàn.</P>
                        </div>
                    </div>
                    <!-- single support -->
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="aa-support-single">
                            <span class="fa fa-phone"></span>
                            <h4>HỖ TRỢ 24/7</h4>
                            <P>Hỗ trợ tư vấn và đặt hàng mọi lúc mọi nơi, đảm bảo thời gian cho khách hàng.</P>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Support section -->
<!-- Testimonial -->
<section id="aa-testimonial">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-testimonial-area">
                    <ul class="aa-testimonial-slider">
                        <!-- single slide -->
                        <li>
                            <div class="aa-testimonial-single">
                                <img class="aa-testimonial-img" src="${url}/images/avatar.jpg" alt="avatar 1">
                                <span class="fa fa-quote-left aa-testimonial-quote"></span>
                                <p>Tôi đã mua hàng ở cửa hàng khá nhiều lần rồi, và tôi cảm thấy sản phẩm của cửa hàng
                                    được giao khá nhanh và sản phẩm thì tốt.</p>
                                <div class="aa-testimonial-info">
                                    <p>Ngọc Huy</p>
                                    <span>Nhân viên kinh doanh</span>
                                </div>
                            </div>
                        </li>
                        <!-- single slide -->
                        <li>
                            <div class="aa-testimonial-single">
                                <img class="aa-testimonial-img" src="${url}/images/avater-2.jpg" alt="avatar 2">
                                <span class="fa fa-quote-left aa-testimonial-quote"></span>
                                <p> Về chất lượng của sản phẩm thì khỏi phải bàn, sản phẩm được làm tỉ mỉ nhìn rất thích.
                                    Tôi sẽ mua hàng ở đây thường xuyên
                                <p>
                                <div class="aa-testimonial-info">
                                    <p>Mỹ Tân</p>
                                    <span>Diễn Viên</span>
                                </div>
                            </div>
                        </li>
                        <!-- single slide -->
                        <li>
                            <div class="aa-testimonial-single">
                                <img class="aa-testimonial-img" src="${url}/images/avatar-1.jpg" alt="avatar 3">
                                <span class="fa fa-quote-left aa-testimonial-quote"></span>
                                <p>Nhiều lần đi làm bận rộn, không có thời gian mua quà cho người thân nên tôi thường mua hàng
                                    online ở đây. Chất lượng sản phẩm và dịch vụ ở đây rất là tốt!</p>
                                <div class="aa-testimonial-info">
                                    <p>Oanh Oanh</p>
                                    <span>Sinh viên</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Testimonial -->

<!-- Latest Blog -->
<section id="aa-latest-blog">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-latest-blog-area">
                    <h2>BÀI VIẾT</h2>
                    <div class="row">
                        <!-- single latest blog -->
                        <c:forEach items="${posts}" var="post" end="4">
                            <div class="col-md-4 col-sm-4">
                                <div class="aa-latest-blog-single">
                                    <figure class="aa-blog-img">
<<<<<<< HEAD
                                        <a href="${pageContext.request.contextPath}/bai-viet/${post.id}"><img
                                                src="${pageContext.request.contextPath}/resources/upload/post/${post.thumb}"
                                                alt="Tin tức ${post.title}"></a>
=======
                                        <a href="${pageContext.request.contextPath}/view/client/news-list-detail?id=${boardnew.id}"><img
                                                src="${pageContext.request.contextPath}/resources/client/assets/images/images/post/${boardnew.thumb}"
                                                alt="Bài viết ${boardnew.title}"></a>
>>>>>>> e878598924e0b7cdfeef93710f55a789a237aa44
                                        <figcaption class="aa-blog-img-caption">
                                            <span href="#"><i class="fa fa-clock-o"></i><fmt:formatDate value="${post.created}"
                                                                                                        pattern="yyyy-MM-dd HH:mm"/></span>
                                        </figcaption>
                                    </figure>
                                    <div class="aa-blog-info">
                                        <h3 class="aa-blog-title"><a
                                                href="${pageContext.request.contextPath}/bai-viet/${post.id}">${post.title}</a>
                                        </h3>
<<<<<<< HEAD
<%--                                        <div class="desc-posts">${post.body}</div>--%>
                                        <a href="${pageContext.request.contextPath}/bai-viet/${post.id}"
=======
                                        <a href="${pageContext.request.contextPath}/view/client/news-list-detail?id=${boardnew.id}"
>>>>>>> e878598924e0b7cdfeef93710f55a789a237aa44
                                           class="aa-read-mor-btn">Xem thêm<span class="fa fa-long-arrow-right"></span></a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Latest Blog -->

<!-- Client Brand -->

<!-- / Client Brand -->
<!-- footer-->
<jsp:include page="./footer/footer.jsp" flush="true"/>
<!-- end footer-->

