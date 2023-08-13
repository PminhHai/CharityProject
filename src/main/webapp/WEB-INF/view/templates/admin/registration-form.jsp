<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!doctype html>
<html lang="en">

<head>
	
	<title>Login Page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Reference Bootstrap files -->
	<link rel="stylesheet"
		 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">

			<div class="panel panel-primary">

				<div class="panel-heading">
					<div class="panel-title">Register New User</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<!-- Registration Form -->
					<form:form
						action="${pageContext.request.contextPath}/user/processSignUp"
						modelAttribute="user" class="form-horizontal">

						<!-- Place for messages: error, alert etc ... -->
						<div class="form-group">
							<div class="col-xs-15">
								<div>

									<!-- Check for registration error -->
									<c:if test="${registrationError != null}">

										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
											${registrationError}</div>

									</c:if>

								</div>
							</div>
						</div>

						<!-- User name -->
						<form:errors path="userName" cssClass="error" />
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span>
							<form:input path="userName" placeholder="username"
								class="form-control" />
						</div>

						<!-- Password -->
						<form:errors path="password" cssClass="error" />
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span>
							<form:password path="password" placeholder="password"
								class="form-control" />
						</div>

						<!-- Confirm Password -->
						<form:errors path="matchingPassword" cssClass="error" />
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span>
							<form:password path="matchingPassword"
								placeholder="confirm password (*)" class="form-control" />
						</div>


						<!-- Full name -->
						<form:errors path="fullName" cssClass="error" />
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span>
							<form:input path="fullName" placeholder="full name"
								class="form-control" />
						</div>

						<!-- Email -->
						<form:errors path="email" cssClass="error" />
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span>
							<form:input path="email" placeholder="email"
								class="form-control" />
						</div>

						<!-- Phone number -->
						<form:errors path="phoneNumber" cssClass="error" />
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span>
							<form:input path="phoneNumber" placeholder="phone number"
								class="form-control" />
						</div>
						
						<!-- Phone number -->
						<form:errors path="address" cssClass="error" />
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span>
							<form:input path="address" placeholder="Address"
								class="form-control" />
						</div>
						
						<!-- Phone number -->
						<form:errors path="note" cssClass="error" />
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span>
							<form:input path="note" placeholder="Address"
								class="form-control" />
						</div>

						<!-- Role dropdown -->
						<div style="margin-bottom: 25px" class="input-group" id="role-input">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <select
								class="form-control" id="roleId1" name="roleId">
								<!-- Populating role option -->
								<option value="1" selected="selected" label="Admin" />
								<option value="2" label="User" />
							</select>
						</div>

						
						<!-- Register Button -->
						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-6 controls">
								<button type="submit" class="btn btn-primary">Register</button>
							</div>
						</div>
					</form:form>

				</div>

			</div>

		</div>

	</div>
<script
	src="${pageContext.request.contextPath}/assets/js/script.js"></script>
</body>
</html>