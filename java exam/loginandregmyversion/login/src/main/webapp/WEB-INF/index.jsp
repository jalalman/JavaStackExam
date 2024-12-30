<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white text-center">
                        <h4 class="mb-0">Register</h4>
                    </div>
                    <div class="card-body">
                        <form:form action="/adduser" method="post" modelAttribute="newUser" class="needs-validation">
                            <div class="mb-3">
                                <form:label path="username" class="form-label">Username:</form:label>
                                <form:input path="username" class="form-control"/>
                                <form:errors path="username" class="text-danger small"/>
                            </div>
                            <div class="mb-3">
                                <form:label path="email" class="form-label">Email:</form:label>
                                <form:input path="email" type="email" class="form-control"/>
                                <form:errors path="email" class="text-danger small"/>
                            </div>
                            <div class="mb-3">
                                <form:label path="password" class="form-label">Password:</form:label>
                                <form:input path="password" type="password" class="form-control"/>
                                <form:errors path="password" class="text-danger small"/>
                            </div>
                            <div class="mb-3">
                                <form:label path="confirmPass" class="form-label">Confirm Password:</form:label>
                                <form:input path="confirmPass" type="password" class="form-control"/>
                                <form:errors path="confirmPass" class="text-danger small"/>
                            </div>
                            <div class="d-grid">
                                <input type="submit" value="Register" class="btn btn-primary"/>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-success text-white text-center">
                        <h4 class="mb-0">Login</h4>
                    </div>
                    <div class="card-body">
                        <form:form action="/login" method="post" modelAttribute="loginUser" class="needs-validation">
                            <div class="mb-3">
                                <form:label path="email" class="form-label">Email:</form:label>
                                <form:input path="email" class="form-control"/>
                                <form:errors path="email" class="text-danger small"/>
                            </div>
                            <div class="mb-3">
                                <form:label path="password" class="form-label">Password:</form:label>
                                <form:input path="password" type="password" class="form-control"/>
                                <form:errors path="password" class="text-danger small"/>
                            </div>
                            <div class="d-grid">
                                <input type="submit" value="Login" class="btn btn-success"/>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>