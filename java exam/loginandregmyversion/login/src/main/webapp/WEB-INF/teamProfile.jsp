
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
    <title>${team.teamName} Profile</title>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                        <h2 class="mb-0">${team.teamName} Team</h2>
                        <a href="/dashboard" class="btn btn-light btn-sm">Dashboard</a>
                    </div>
                    
                    <div class="card-body">
                        <div class="mb-4">
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-person-fill me-2"></i>
                                <h5 class="mb-0">Team Manager: ${team.addedBy}</h5>
                            </div>
                            
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-star-fill me-2"></i>
                                <h5 class="mb-0">Skill Level: ${team.skillLevel}</h5>
                            </div>
                            
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-calendar-event me-2"></i>
                                <h5 class="mb-0">Game Day: ${team.gameDay}</h5>
                            </div>
                        </div>
                        
                        <div class="d-flex gap-2 mt-4">
                            <c:if test="${team.addedBy eq loggedUser.username}">
                                <a href="/teams/${team.id}/edit" class="btn btn-primary">
                                    <i class="bi bi-pencil-square me-1"></i> Edit
                                </a>
                                <form action="/teams/${team.id}/delete" method="post" style="display: inline;">
                                    <input type="hidden" name="_method" value="delete">
                                    <button type="submit" class="btn btn-danger">
                                        <i class="bi bi-trash me-1"></i> Delete
                                    </button>
                                </form>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>