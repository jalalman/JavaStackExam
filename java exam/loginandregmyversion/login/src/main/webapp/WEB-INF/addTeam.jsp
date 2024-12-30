<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create a new Team</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                        <h4 class="mb-0">Add New Team</h4>
                        <a href="/dashboard" class="btn btn-light btn-sm">Dashboard</a>
                    </div>
                    <div class="card-body">
                        <form:form action="/teams/news" method="post" modelAttribute="team">
                            <div class="mb-3">
                                <form:label path="teamName" class="form-label">Team Name:</form:label>
                                <form:input path="teamName" class="form-control"/>
                                <form:errors path="teamName" class="text-danger small"/>
                            </div>

                            <div class="mb-3">
                                <form:label path="skillLevel" class="form-label">Skill Level:</form:label>
                                <form:input path="skillLevel" class="form-control" type="number" min="1" max="10"/>
                                <form:errors path="skillLevel" class="text-danger small"/>
                                <div class="form-text">Enter a value between 1 and 10</div>
                            </div>

                            <div class="mb-3">
                                <form:label path="gameDay" class="form-label">Game Day:</form:label>
                                <form:input path="gameDay" class="form-control"/>
                                <form:errors path="gameDay" class="text-danger small"/>
                            </div>

                            <form:hidden path="addedBy" value="${loggedUser.username}"/>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">Add Team</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>