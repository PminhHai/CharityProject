<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>Quản trị</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/static/admin1/assets/css/styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

	<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/datatables-simple-demo.js"></script>

	<script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<nav th:fragment="html_nav" class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
			<!-- Navbar Brand-->
			<a class="navbar-brand ps-3" href="${pageContext.request.contextPath}/admin/">QUẢN TRỊ</a>
			<!-- Sidebar Toggle-->
			<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
					class="fas fa-bars"></i></button>
			<!-- Navbar Search-->
			<form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

			</form>
			<!-- Navbar-->
			<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
				<li class="nav-item dropdown">
					 <c:if test="${sessionScope.username != null}">
					   <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/user/logout" role="button">
					      <i class="fas fa-user fa-fw"></i>
					      <span> Logout</span>
					   </a>
					</c:if>
					<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown1">
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="#">Activity Log</a></li>
						<li>
							<hr class="dropdown-divider" />
						</li>
						<li><a class="dropdown-item" href="/logout">Logout</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</nav>

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<div th:fragment="html_menu" id="layoutSidenav_nav">
				<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
					<div class="sb-sidenav-menu">
						<div class="nav">
							<a class="nav-link" href="<c:url value ="/admin/account"/>">
								<div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
								Quản lý người dùng
							</a>
							<a class="nav-link" href="<c:url value ="/admin/donation"/>">
								<div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
								Quản lý đợt quyên góp
							</a>
						</div>
					</div>

				</nav>
			</div>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Danh sách đợt quyên góp</h1>
					<div class="card mb-4">
						<div class="card-header">
							<button type="button" class="btn btn-success" data-bs-toggle="modal"
								data-bs-target="#exampleModalAdd">
								Thêm mới
							</button>
							<!-- Modal Add-->
							<div class="modal fade" id="exampleModalAdd" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabelll">Thêm mới</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal"
												aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form:form modelAttribute="donation2" action="add-new-donation" method="post">
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Mã đợt quyên
															góp:</label>
														<form:input type="text" class="form-control" id="addname" path="code"
															required="required"/>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Tên đợt quyên
															góp:</label>
														<form:input type="text" class="form-control" id="addcost" path="name"
															required="required"/>
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Ngày bắt
															đầu:</label>
														<form:input type="date" class="form-control" id="addname"
															path="startDate" required="required"/>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Ngày kết
															thúc:</label>
														<form:input type="date" class="form-control" id="addcost" path="endDate"
															required="required"/>
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Tổ chức:</label>
														<form:input type="text" class="form-control" id="addname"
															path="organizationName" required="required"/>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Số điện
															thoại:</label>
														<form:input type="number" class="form-control" id="addcost"
															path="phoneNumber" required="required"/>
													</div>
													<div class="col-12">
														<label for="ct_id" class="col-form-label">Nội dung:</label>
														<form:textarea path="description" class="form-control" cols="50"
															rows="5"/>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Đóng</button>
													<button type="submit" class="btn btn-primary">Thêm </button>
												</div>
											</form:form>
										</div>

									</div>
								</div>
							</div>
							<!-- Modal Add-->
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr style="background-color: gray !important;">
										<th>Mã</th>
										<th>Tên</th>
										<th>Ngày bắt đầu</th>
										<th>Ngày kết thúc</th>
										<th>Tổ chức</th>
										<th>Số điện thoại</th>
										<th>Tổng tiền</th>
										<th>Trạng thái</th>
										<th style="width: 220px ">Hành động</th>
									</tr>
								</thead>
								<tfoot>
									<tr>

									</tr>
								</tfoot>
								<tbody>
								<c:set var="dodai" value="${donations.size()}" />
			  					<input type="hidden" value="${dodai}" id="dodai" />
								<c:forEach var="donation" items="${donations}">
										<tr>
											<td><c:out value="${donation.code}"/></td>
											<td><c:out value="${donation.name}"/></td>
											<td><c:out value="${donation.startDate}"/></td>
											<td><c:out value="${donation.endDate}"/></td>
											<td><c:out value="${donation.organizationName}"/></td>
											<td><c:out value="${donation.phoneNumber}"/></td>
											<td><c:out value="${donation.money}"/></td>
											<!-- Kiểm tra trạng thái donation để hiển thị thông tin -->
											
											<c:choose>
												<c:when test="${donation.status == 0 }">
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
											 <td style="">
											 	<c:if test="${donation.status == 0 }">
											 		 <button type="button" style="width: 105px" class="btn btn-primary" data-bs-toggle="modal"
							                            data-bs-target="#exampleModal${donation.id}">
								                      	Cập nhật
								                     </button>
								                    <a style="width: 105px" class="btn btn-warning" href="detail/${donation.id}">
								                      Chi tiết
								                    </a>
								
								                    <button type="button" style="width: 105px" class="btn btn-danger mt-1" data-bs-toggle="modal"
								                            data-bs-target="#idModelDel${donation.id}" >
								                      Xóa
								                    </button>
								                    <form:form modelAttribute="donation2" action="donating-donation" method="post" style="margin-top: 5px">
									                      <form:input type="hidden" class="form-control" id="id" path="id" value="${donation.id}"/>
									                      
									                      <button type="submit" style="width: 105px" class="btn btn-success" >
									                       Quyên Góp
									                      </button>
							                    	</form:form>
											 	</c:if>
											 	
											 	<c:if test="${donation.status == 1 }">
											 		 <button type="button" style="width: 105px" class="btn btn-primary" data-bs-toggle="modal"
							                            data-bs-target="#exampleModal${donation.id}">
								                      	Cập nhật
								                     </button>
								                    <a style="width: 105px" class="btn btn-warning" href="detail/${donation.id}">
								                      Chi tiết
								                    </a>
								
								                      <form:form modelAttribute="donation2" action="ending-donation" method="post" style="margin-top: 5px">
									                      <form:input type="hidden" class="form-control" id="id" path="id" value="${donation.id}"/>
									                      
									                      <button type="submit" style="width: 105px" class="btn btn-success" >
									                        Kết thúc
									                      </button>
							                    	</form:form>
											 	</c:if>
											 
											 	<c:if test="${donation.status == 2 }">
											 		 <button type="button" style="width: 105px" class="btn btn-primary" data-bs-toggle="modal"
							                            data-bs-target="#exampleModal${donation.id}">
								                      	Cập nhật
								                     </button>
								                    <a style="width: 105px" class="btn btn-warning" href="detail/${donation.id}">
								                      Chi tiết
								                    </a>
								
								                     <form:form modelAttribute="donation2" action="closing-donation" method="post" style="margin-top: 5px">
									                      <form:input type="hidden" class="form-control" id="id" path="id" value="${donation.id}"/>
									                      
									                      <button type="submit" style="width: 105px" class="btn btn-success" >
									                        Đóng
									                      </button>
							                    	</form:form>
											 	</c:if>
											 	<c:if test="${donation.status == 3 }">
											 		 <button type="button" style="width: 105px" class="btn btn-primary" data-bs-toggle="modal"
							                            data-bs-target="#exampleModal${donation.id}">
								                      	Cập nhật
								                     </button>
								                    <a style="width: 105px" class="btn btn-warning" href="detail/${donation.id}">
								                      Chi tiết
								                    </a>
								
								                     
											 	</c:if>
							                    <!-- Modal Delete -->
							                    <div class="modal fade" id="idModelDel${donation.id}" tabindex="-1"
							                         aria-labelledby="exampleModalLabel" aria-hidden="true">
							                      <div class="modal-dialog">
							                        <div class="modal-content">
							                          <div class="modal-header">
							                            <h5 class="modal-title" id="exampleModalLabel">Bạn chắc chắn muốn xóa ?</h5>
							                            <button type="button" class="btn-close" data-bs-dismiss="modal"
							                                    aria-label="Close"></button>
							                          </div>
							                          <div class="modal-body">
							                            Đợt quyên góp : <span><c:out value="${donation.name}"/></span>
							                            <form:form modelAttribute="donation2" action="delete-donation" method="post">
							                            <form:input type="hidden" class="form-control" id="id" name="id" path="id" value="${donation.id}" />
							                              <div class="modal-footer" style="margin-top: 20px">
							                                <button type="button" class="btn btn-secondary"
							                                        data-bs-dismiss="modal">
							                                  Close
							                                </button>
							                                <button type="submit" class="btn btn-danger">Xóa</button>
							
							                              </div>
							                            </form:form>
							                          </div>
							
							                        </div>
							                      </div>
							                    </div>
							                    <!-- Modal Delete -->
							                 </td>
										</tr>
										<!-- Modal Update -->
										<div class="modal fade" id="exampleModal${donation.id}" tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog modal-lg ">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabell">Cập nhật</h5>
														<button type="button" class="btn-close" data-bs-dismiss="modal"
															aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<form:form modelAttribute="donation2" action="update-donation" method="post">
															<form:input type="hidden" path="id" value="${donation.id}"/>
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Mã đợt
																		quyên góp:</label>
																	<form:input type="text" class="form-control" id="addname"
																		path="code" value="${donation.code}"  required="required"/>
																</div>
																<div class="col-6">
																	<label for="addcost" class="col-form-label">Tên đợt
																		quyên góp:</label>
																	<form:input type="text" class="form-control" id="addcost"
																		path="name" value="${donation.name}"  required="required"/>
																</div>
															</div>
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Ngày bắt
																		đầu:</label>
																	<form:input type="date" class="form-control" id="addname"
																		path="startDate" value="${donation.startDate}"  required="required"/>
																</div>
																<div class="col-6">
																	<label for="addcost" class="col-form-label">Ngày kết
																		thúc:</label>
																	<form:input type="date" class="form-control" id="addcost"
																		path="endDate" value="${donation.endDate}"  required="required"/>
																</div>
															</div>
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Tổ
																		chức:</label>
																	<form:input type="text" class="form-control" id="addname"
																		path="organizationName" value="${donation.organizationName}"  required="required"/>
																</div>
																<div class="col-6">
																	<label for="addcost" class="col-form-label">Số điện
																		thoại:</label>
																	<form:input type="number" class="form-control"
																		id="addcost" path="phoneNumber" value="${donation.phoneNumber}"  required="required"/>
																</div>
																<div class="col-12">
																	<label for="ct_id" class="col-form-label">Nội
																		dung:</label>
																	<form:textarea name="noidung" class="form-control"
																		cols="50" rows="5" path="description" value="${donation.description}" />
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">Đóng</button>
																<button type="submit" class="btn btn-primary">Lưu
																</button>
															</div>
														</form:form>
													</div>

												</div>
											</div>
										</div>
										<!-- Modal Update -->
									</th>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

			</main>

			<script>

				ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
					console.log("da" + eidt);
				})
					.catch(error => {
						console.error(error);
					});

			</script>
			<script>

				var dodai = document.getElementById("dodai").value;
				var a = parseInt(dodai);
				for (var i = 1; i <= a + 10; i++) {
					var name = "#editor" + i
					ClassicEditor.create(document.querySelector(name)).then(eidt => {
						console.log("da" + eidt);
					})
						.catch(error => {
							console.error(error);
						});
				}


			</script>
			<footer class="py-4 bg-light mt-auto">

			</footer>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/JQuery3.3.1.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/datatables-simple-demo.js"></script>
</body>

</html>