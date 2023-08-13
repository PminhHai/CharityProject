<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>>  

<!DOCTYPE html>
<html  lang="en">

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

<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Chi tiết đợt quyên góp</h1>
					<div class="card mb-4">

						<div class="card-body">
							<!--Detail-->
							<div class="row">
								<div class="col-6">
									<label for="addname" class="col-form-label">Mã đợt quyên góp:</label>
									<input type="text" class="form-control" id="addname" name="code" value="${donation.code}"
										readonly="readonly">
								</div>
								<div class="col-6">
									<label for="addcost" class="col-form-label">Tên đợt quyên góp:</label>
									<input type="text" class="form-control" id="addcost" name="name"
										value="${donation.name}" readonly="readonly">
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label for="addname" class="col-form-label">Ngày bắt đầu:</label>
									<input type="date" class="form-control" id="addname" name="startDate" value="${donation.startDate}"
										readonly="readonly">
								</div>
								<div class="col-6">
									<label for="addcost" class="col-form-label">Ngày kết thúc:</label>
									<input type="date" class="form-control" id="addcost" name="endDate" value="${donation.endDate}"
										readonly="readonly">
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label for="addname" class="col-form-label">Tổng tiền quyên góp:</label>
									<input type="text" class="form-control" id="addname" name="money" value="${donation.money} VND"
										readonly="readonly">
								</div>
								<div class="col-6">
									<label for="addcost" class="col-form-label">Trạng thái:</label>
									<c:choose>
									    <c:when test="${donation.status == 0}">
									        <input type="text" class="form-control" id="addcost" name="status" value="Mới tạo" readonly="readonly"/>
									    </c:when>
									    <c:when test="${donation.status == 1}">
									        <input type="text" class="form-control" id="addcost" name="status" value="Đang quyên góp" readonly="readonly"/>
									    </c:when>
									    <c:when test="${donation.status == 2}">
									        <input type="text" class="form-control" id="addcost" name="status" value="Kết thúc quyên góp" readonly="readonly"/>
									    </c:when>
									    <c:when test="${donation.status == 3}">
									        <input type="text" class="form-control" id="addcost" name="status" value="Đóng quyên góp" readonly="readonly"/>
									    </c:when>
									</c:choose>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label for="addname" class="col-form-label">Tổ chức:</label>
									<input type="text" class="form-control" id="addname" name="tochuc" value="${donation.organizationName}"
										readonly="readonly">
								</div>
								<div class="col-6">
									<label for="addcost" class="col-form-label">Số điện thoại:</label>
									<input type="number" class="form-control" id="addcost" name="phoneNumber"
										value="${donation.phoneNumber}" readonly="readonly">
								</div>
								<div class="col-12">
									<label for="ct_id" class="col-form-label">Nội dung: </label>
									<textarea name="description" class="form-control" cols="50"
										readonly="readonly">${donation.description}</textarea>
								</div>
							</div>
							<!--Detail-->
							<h3 class="mt-4">Danh sách những người quyên góp</h3>
							<table id="datatablesSimple">
								<thead>
									<tr style="background-color: gray !important;">
										<th>Họ Tên</th>
										<th>Tiền quyên góp</th>
										<th>Ngày quyên góp</th>
										<th>Nội dung</th>
										<th>Trạng thái</th>
										<th>Hành động</th>
									</tr>
								</thead>
								<tfoot>
									<tr>

									</tr>
								</tfoot>
								<tbody>
									<c:set var="dodai" value="${userDonations.size()}" />
			  						<input type="hidden" value="${dodai}" id="dodai" />
			  						<c:forEach var="userDonation" items="${userDonations}">
			  							
			  								<tr>
											<td>${userDonation.name}</td>
											<td>${userDonation.money}</td>
											<td>${userDonation.createdDate}</td>
											<td>${userDonation.text}</td>
											<c:choose>
												<c:when test="${userDonation.status == 0}">
													<td>Chờ xác nhận</td>
												</c:when>
												<c:when test="${userDonation.status ==1}">
													<td style="color: green;">Đã được xác nhận</td>
												</c:when>
												<c:otherwise>
													<td style="color: red;">Đã bị hủy</td>
												</c:otherwise>

											</c:choose>
											<c:choose>
												<c:when test="${userDonation.status==0 }">
													<td style="display: flex; justify-content: space-between">
														<form method="post" action="acceptStatusUserDonation">
															<input type="hidden" name="id" value="${userDonation.id}">
															<input type="hidden" name="donationId"
																value="${userDonation.donationId}">
															<input type="hidden" name="money"
																value="${userDonation.money}">
															<button id="confirmBtn" type="submit" style="width: 105px"
																class="btn btn-success">
																Xác nhận</button>
														</form>
														<form method="post" action="unacceptStatusUserDonation">
															<input type="hidden" name="id" value="${userDonation.id}">
															<input type="hidden" name="donationId"
																value="${userDonation.donationId}">
															<input type="hidden" name="money"
																value="${userDonation.money}">
															<button id="cancelBtn" type="submit" style="width: 150px"
																class="btn btn-danger">
																Hủy xác nhận</button>
														</form>
													</td>
												</c:when>
												<c:otherwise>
													<td></td>
												</c:otherwise>
											</c:choose>
										</tr>
			  							
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
				<div class="container-fluid px-4">

				</div>
			</footer>
		</div>
	</div>

	<script src="/admin1/assets/js/JQuery3.3.1.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="/admin1/assets/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="/admin1/assets/js/datatables-simple-demo.js"></script>
</body>

</html>