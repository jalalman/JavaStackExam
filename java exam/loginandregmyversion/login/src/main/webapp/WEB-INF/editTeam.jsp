<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <title>${team.teamName} profile</title>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">Edit ${team.teamName}</h4>
                    </div>
                    <div class="card-body">
                        <form:form action="/teams/${team.id}/edit" method="post" modelAttribute="team">
                            <div class="mb-3">
                                <form:label path="teamName" class="form-label">Team Name:</form:label>
                                <form:input path="teamName" class="form-control"/>
                                <form:errors path="teamName" class="text-danger small"/>
                            </div>
                            <form:hidden path="addedBy" value="${loggedUser.username}"/>
                            <form:hidden path="id" value="${team.id}"/>
                            <div class="mb-3">
                                <form:label path="skillLevel" class="form-label">Skill Level:</form:label>
                                <form:input path="skillLevel" class="form-control" type="number"/>
                                <form:errors path="skillLevel" class="text-danger small"/>
                            </div>
                            <div class="mb-3">
                                <form:label path="gameDay" class="form-label">Game Day:</form:label>
                                <form:input path="gameDay" class="form-control"/>
                                <form:errors path="gameDay" class="text-danger small"/>
                            </div>
                            <div class="d-flex justify-content-between">
                                <input type="submit" value="Submit" class="btn btn-primary"/>
                                <a href="/dashboard" class="btn btn-secondary">Dashboard</a>
                                <form:form action="/teams/${team.id}/delete" method="post" style="display: inline;">
                                    <input type="hidden" name="_method" value="delete">
                                    <button type="submit" class="btn btn-danger">
                                        <i class="bi bi-trash me-1"></i> Delete
                                    </button>
                                </form:form>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>