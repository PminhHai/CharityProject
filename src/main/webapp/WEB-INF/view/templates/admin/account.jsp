<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>>
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
        <h1 class="mt-4">Danh sách người dùng</h1>
        <div class="card mb-4">
          <div class="card-header">
            <button type="button" class="btn btn-success" data-bs-toggle="modal"
                    data-bs-target="#exampleModalAdd">
              Thêm mới
            </button>
            <!-- Modal Add-->
            <div class="modal fade" id="exampleModalAdd" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabelll">Thêm mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <form:form method="post" modelAttribute="user2" action="add-new-account">
                    	<%-- <form:hidden path="id"/> --%>
                      <div class="row">
                        <div class="col-6">
                          <label for="addname"
                                 class="col-form-label">Name:</label>
                          <form:input type="text" class="form-control" id="addname" path="fullName" required="required"/>
                        </div>
                        <div class="col-6">
                          <label for="addcost"
                                 class="col-form-label">Email:</label>
                          <form:input type="email" class="form-control"
                                 id="addcost" path="email" required="required"/>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6">
                          <label for="addname"
                                 class="col-form-label">Số điện thoại:</label>
                          <form:input type="number" class="form-control"
                                 id="addname" path="phoneNumber" required="required"/>
                        </div>
                        <div class="col-6">
                          <label for="addcost"
                                 class="col-form-label">Địa chỉ:</label>
                          <form:input type="text" class="form-control"
                                 id="addcost" path="address" required="required"/>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6">
                          <label for="addname"
                                 class="col-form-label">Tài khoản:</label>
                          <form:input type="text" class="form-control"
                                 id="addname" path="userName" required="required"/>
                        </div>
                        <div class="col-6">
                          <label for="addcost"
                                 class="col-form-label">Mật khẩu:</label>
                          <form:input type="password" class="form-control"
                                 id="addcost" path="password" required="required"/>
                        </div>
                        <c:set var="roleId" value="${user.role.id}"/>
							<div class="col-6">
							  <label for="ct_id" class="col-form-label">Vai trò:</label>
							  <form:select class="form-control" id="ct_id" path="roleId" required="required">
							    <form:option value="" disabled="true">--Chọn loại vai trò--</form:option>
							    <c:forEach var="role" items="${roles}">
							      <c:choose>
							        <c:when test="${role.id eq roleId}">
							          <form:option value="${role.id}" selected="true"><c:out value="${role.roleName}"/></form:option>
							        </c:when>
							        <c:otherwise>
							          <form:option value="${role.id}"><c:out value="${role.roleName}"/></form:option>
							        </c:otherwise>
							      </c:choose>
							    </c:forEach>
							  </form:select>
							</div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <input type="submit" class="btn btn-primary" value="Thêm"/>
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
                <th>Họ tên</th>
                <th>Email</th>
                <th>Số điện thoại</th>
<!--                <th>Địa chỉ</th>-->
                <th>Tài khoản</th>
                <th>Vai trò</th>
                <th >Trạng thái</th>
                <th >Hành động</th>
              </tr>
              </thead>
              <tfoot>
              <tr>

              </tr>
              </tfoot>
              <tbody>
              <c:set var="dodai" value="${users.size()}" />
			  <input type="hidden" value="${dodai}" id="dodai" />
              <c:forEach var="user" items="${users}">
                <tr>
                    <td><c:out value="${user.fullName}"/></td>
					<td><c:out value="${user.email}"/></td>
					<td><c:out value="${user.phoneNumber}"/></td>
					<td><c:out value="${user.userName}"/></td>
					<td><c:out value="${user.role.roleName}"/></td>
                  <c:choose>
				    <c:when test="${user.status == 1}">
				        <td style="color: #1c7430; font-weight: bold">Hoạt động</td>
				    </c:when>
				    <c:when test="${user.status == 0}">
				        <td style="color: red; font-weight: bold">Đã khóa</td>
				    </c:when>
				  </c:choose>
                  <td style="width : 270px">
                    <button type="button" style="width: 80px" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#exampleModal${user.id}">
                      Sửa
                    </button>
                    <button type="button" style="width: 80px" class="btn btn-warning" data-bs-toggle="modal"
                            data-bs-target="#exampleModal${user.id}">
                      Chi tiết
                    </button>
                    <button type="button" style="width: 80px" class="btn btn-danger mt-1" data-bs-toggle="modal"
                            data-bs-target="#idModelDel${user.id}" >
                      Xóa
                    </button>
                    <c:choose>
					    <c:when test="${user.status == 1}">
					      <form:form modelAttribute="user2" action="lock-user" method="post" style="margin-left: 85px; margin-top: -38px">
					        <form:input type="hidden" path="id" value="${user.id}"/>
					        <button type="submit" style="width: 80px" class="btn btn-danger">Khóa</button>
					      </form:form>
					    </c:when>
					    <c:when test="${user.status == 0}">
					      <form:form modelAttribute="user2" action="lock-user" method="post">
					        <form:input type="hidden" path="id" value="${user.id}"/>
					        <button type="submit" style="width: 80px" class="btn btn-success">Mở</button>
					      </form:form>
					    </c:when>
				  </c:choose>
                    <div class="modal fade" id="idModelDel${user.id}" tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Bạn chắc chắn muốn xóa ?</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            Người dùng : <span><c:out value="${user.userName}" /></span>
                            <form:form action="delete-user" modelAttribute="user2" method="post">
                              <form:input type="hidden" class="form-control" id="id" name="id" path="id" value="${user.id}" />
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
                    <div class="modal fade" id="exampleModal${user.id}" tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Gửi đến: <span><c:out value="${user.email}"/></span></h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            <form th:action="@{/ql-user/send-mail}" method="post">
                              <input type="hidden" class="form-control" id="id" name="idUser" value="${user.id}">
                              <label for="addname"
                                     class="col-form-label">Nội dung:</label>
                              <textarea rows="10"  class="form-control"
                                        id="addname" name="note" ></textarea>
                              <div class="modal-footer" style="margin-top: 20px">
                                <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">
                                  Đóng
                                </button>
                                <button type="submit" class="btn btn-success">Gửi</button>

                              </div>
                            </form>

                          </div>

                        </div>
                      </div>
                    </div>
                    <div class="modal fade" id="exampleModal${user.id}" tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Chi tiết : <span><c:out value="${user.fullName}"/></span></h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            <div class="row">
                              <div class="col-6"> <h5>Họ tên :</h5> <p><c:out value="${user.fullName}"/></p>
                                <h5>Email:</h5> <p><c:out value="${user.email}"/></p>
                                <h5>Số điện thoại:</h5> <p><c:out value="${user.phoneNumber}"/></p>
                                <h5>Tài khoản:</h5> <p><c:out value="${user.userName}"/></p></div>
                              <div class="col-6">   <h5>Địa chỉ :</h5> <p><c:out value="${user.address}"/></p>
                                <h5>Vai trò:</h5> <p><c:out value="${user.role.roleName}"/>
                                <h5>Lần đăng nhập gần nhất:</h5> <p><c:out value="${user.createdAt}"/></p>
                                <h5>Note:</h5> <p><c:out value="${user.note}"/></p></div>

                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </td>
                </tr>
                <!-- Modal Update-->
                <div class="modal fade" id="exampleModal${user.id}" tabindex="-1"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg ">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabell">Cập nhật</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <form:form modelAttribute="user2" action="update-account" method="post">
                          <form:input type="hidden" path="id" value="${user.id}"/>
                          <div class="row">
                            <div class="col-6">
                              <label for="addname"
                                     class="col-form-label">Họ và tên:</label>
                              <form:input type="text" class="form-control"
                                     id="addname" path="fullName" value="${user.fullName}" required="required"/>
                            </div>
                            <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">Email:</label>
                              <form:input type="email" class="form-control"
                                     id="addcost" path="email" value="${user.email}" required="required"/>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-6">
                              <label for="addname"
                                     class="col-form-label">Số điện thoại:</label>
                              <form:input type="number" class="form-control"
                                     id="addname" path="phoneNumber" value="${user.phoneNumber}" required="required"/>
                            </div>
                            <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">Địa chỉ:</label>
                              <form:input type="text" class="form-control"
                                     id="addcost" path="address" value="${user.address}" required="required"/>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-6">
                              <label for="addname"
                                     class="col-form-label">Tài khoản:</label>
                              <form:input type="text" class="form-control"
                                     id="addname" path="userName" value="${user.userName}" required="required"/>
                            </div>
                            <c:set var="roleId" value="${user.role.id}"/>
							<div class="col-6">
							  <label for="ct_id" class="col-form-label">Vai trò:</label>
							  <form:select class="form-control" id="ct_id" path="roleId" required="required">
							    <form:option value="" disabled="true">--Chọn loại vai trò--</form:option>
							    <c:forEach var="role" items="${roles}">
							      <c:choose>
							        <c:when test="${role.id == roleId}">
							          <form:option value="${role.id}" selected="true"><c:out value="${role.roleName}"/></form:option>
							        </c:when>
							        <c:otherwise>
							          <form:option value="${role.id}"><c:out value="${role.roleName}"/></form:option>
							        </c:otherwise>
							      </c:choose>
							    </c:forEach>
							  </form:select>
							</div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary">Lưu </button>
                          </div>
                        </form:form>
                      </div>

                    </div>
                  </div>
                </div>
                <!-- Modal Update-->

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
      for(var i = 1;i<=a+10;i++){
        var name = "#editor"  + i
        ClassicEditor.create(document.querySelector(name)).then(eidt => {
          console.log("da" + eidt);
        })
                .catch(error => {
                  console.error(error);
                });
      }


    </script>
    <footer th:replace="admin/fragments :: footer" class="py-4 bg-light mt-auto">

    </footer>
  </div>
</div>

<script src="js/JQuery3.3.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</body>

</html>