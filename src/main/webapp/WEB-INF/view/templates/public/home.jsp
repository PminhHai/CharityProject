<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs/customTaglib.tld" prefix="tag"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html  lang="en">
    <head>
        <title>Donation website &mdash; Website Donation</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <meta name="author" content="Free-Template.co" />
        <link rel="shortcut icon" href="ftco-32x32.png">
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/user/assets/css/custom-bs.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/user/assets/css/jquery.fancybox.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/user/assets/css/bootstrap-select.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/user/assets/fonts/icomoon/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/user/assets/fonts/line-icons/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/user/assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/user/assets/css/animate.min.css">
      
        <!-- MAIN CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/user/assets/css/style.css">
        
        <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/isotope.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/stickyfill.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.fancybox.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.easing.1.3.js"></script>
    
        <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.animateNumber.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/bootstrap-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/custom.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/datatables-simple-demo.js"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      
    </head>
<body id="top">

<div id="overlayer"></div>
<div class="loader">
    <div class="spinner-border text-primary" role="status">
        <span class="sr-only">Loading...</span>
    </div>
</div>
<div th:if="${msg}" class="toast" data-delay="1000" style="position:fixed; top: 100PX; left: 40PX;z-index: 2000;width: 300px">

    <script>
        // swal({
        //     title: 'Donate Successfully!',
        //     /* text: 'Redirecting...', */
        //     icon: 'success',
        //     timer: 3000,
        //     buttons: true,
        //     type: 'success'
        // })
    </script>
</div>

<div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
            <div class="site-mobile-menu-close mt-3">
                <span class="icon-close2 js-menu-toggle"></span>
            </div>
        </div>
        <div class="site-mobile-menu-body"></div>
    </div> <!-- .site-mobile-menu -->


    <!-- NAVBAR -->
    <header class="site-navbar mt-3">
	    <div class="container-fluid">
	      <div class="row align-items-center">
	        <div class="site-logo col-6"><a href="/">Website Quyên Góp</a></div>
	
	        <div class="right-cta-menu text-right d-flex aligin-items-center col-6">
	          <div class="ml-auto">
				<a href="${pageContext.request.contextPath}/user/logout" class="btn btn-primary border-width-2 d-none d-lg-inline-block" <c:if test="${not empty sessionScope.username}"></c:if>>Log Out</a>
	          </div>
	          <a href="#" class="site-menu-toggle js-menu-toggle d-inline-block d-xl-none mt-lg-2 ml-3"><span class="icon-menu h3 m-0 p-0 mt-2"></span></a>
	        </div>
	
	      </div>
	    </div>
   </header>

   <!-- HOME -->
    <section class="section-hero overlay inner-page bg-image" style="background-image: url('/user/assets/images/hero_1.jpg');" id="home-section">
        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <h1 class="text-white font-weight-bold">Danh sách các đợt quyên góp</h1>

                </div>
            </div>
        </div>
    </section>
    <section class="site-section">
        <div class="container">

            <div class="row mb-5 justify-content-center">
                <div class="col-md-7 text-center">
                    <h2 class="section-title mb-2" >Các đợt quyên góp</h2>
                </div>
            </div>

            <ul class="job-listings mb-5" >
            	<th>
                	<c:forEach  var="donation" items="${donations}">
                		<li style="margin-bottom: 20px" class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center ">
                        <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
                            <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px;width: 250px">
                                <a href="${pageContext.request.contextPath}/user/detail-user/${donation.id}" style="position:relative;">
										<h2>${donation.name}</h2></a>
                                <strong >
                                <c:choose>
									<c:when test="${donation.status == 0}">
										<td>Mới tạo</td>
									</c:when>
									<c:when test="${donation.status == 1}">
									    <td>Đang quyên góp</td>
									 </c:when>
									<c:when test="${donation.status == 2}">
									    <td>Kết thúc quyên góp</td>
									</c:when>
									<c:when test="${donation.status == 3}">
									    <td>Đóng quyên góp</td>
									</c:when>
								</c:choose>
								</strong>
                            </div>
                            <div class="job-listing-location mb-3 mb-sm-0 custom-width w-10" style="padding: 10px;">
                                Ngày bắt đầu<br>
                                <strong><c:out value="${donation.startDate}"/></strong><br>
                            </div>
                            <div class="job-listing-location mb-3 mb-sm-0 custom-width w-10" style="padding: 10px;">
                                Ngày kết thúc<br>
                                <strong><c:out value="${donation.endDate}"/></strong><br>
                            </div>
                            <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25" style="padding: 10px;">
                                <span class="icon-room"></span> <span><c:out value="${donation.organizationName}"/></span><br>
                                <strong><c:out value="${donation.organizationName}"/></strong><br>
                            </div>
                            <div class="job-listing-meta custom-width w-20" >
	                            <c:if test="${donation.status ==1}">
	                            	<p style="margin-top: 20px" class="btn btn-primary py-2" data-toggle="modal" data-target="#exampleModal${donation.id}">Quyên góp</p>
	                                <p style="margin-top: 20px;background-color: white !important;" class="btn py-2"><span style="color: white">Quyên góp</span></p>
	                            </c:if>
                               	<c:if test="${donation.status !=1}">
											<div style="padding: 20px 107px"></div>
								</c:if>
                            </div>
                        </div>
                    </li>
                    <div class="modal fade" id="exampleModal${donation.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Quyên góp: <span></span></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form:form modelAttribute="userDonation" action="user/add-user-donation" method="post">
                                    <div class="modal-body">
                                        <div class="row">

                                            <div class="col-12">
                                                <label for="addname"
                                                       class="col-form-label">Họ tên:</label>
                                                <form:input type="text" class="form-control"
                                                       id="addname" path="name" required="required" />
                                                <label for="addname"
                                                       class="col-form-label">Số tiền quyên góp:</label>
                                                <form:input type="number" class="form-control"
                                                       id="addname" path="money" required="required" />
                                                <form:input type="hidden" class="form-control" value="0"
                                                       id="addname" path="status" required="required"  />
                                                <form:input type="hidden" class="form-control" value="${sessionScope.username}"
                                                       id="addname" path="username" required="required" />
                                                <form:input type="hidden" class="form-control" value="${donation.id}"
                                                       id="addname" path="donationId" required="required"  />

                                                <label for="addname"
                                                       class="col-form-label">Lời nhắn:</label>
                                                <form:textarea rows="10" cols="3" class="form-control" path="text" />
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                            <button type="submit" data-toggle="modal" data-target="#exampleModal" class="btn btn-primary">Quyên góp</button>
                                        </div>
                                    </div>
                                </form:form>


                            </div>
                        </div>
                    </div>
                	</c:forEach>
                	</th>
                    <!-- Modal -->
                <script>
                    function detail(id){
                        window.location = '/donation/detail/' + id;
                    }


                </script>
            </ul>
			<tag:paginate max="5" count="${count}" uri="${pageContext.request.contextPath}/user" offset="${offset}" next="&raquo;" previous="&laquo;"/>
			
  </div>
        </div>
    </section>

</div>

</body>
</html>