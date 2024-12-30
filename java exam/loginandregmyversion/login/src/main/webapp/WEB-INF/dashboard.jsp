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
    <title>Team Dashboard</title>
</head>
<body class="bg-light">
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="/dashboard">Team Manager</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarContent">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <span class="nav-link text-light">
                            <i class="bi bi-person-circle me-1"></i>
                            Welcome, ${sessionScope.loggedUser.username}!
                        </span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">
                            <i class="bi bi-box-arrow-right me-1"></i>
                            Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <div class="card shadow">
            <div class="card-header bg-white d-flex justify-content-between align-items-center py-3">
                <h4 class="mb-0">Team List</h4>
                <a class="btn btn-primary" href="/teams/new">
                    <i class="bi bi-plus-circle me-1"></i>
                    Add Team
                </a>
            </div>
            
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>Team Name</th>
                                <th>Skill Level</th>
                                <th>Players</th>
                                <th>Game Day</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="team" items="${teams}">
                                <tr>
                                    <td>
                                        <a href="/teams/${team.id}" class="text-decoration-none">
                                            <i class="bi bi-people-fill me-2"></i>
                                            ${team.teamName}
                                        </a>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="progress flex-grow-1" style="height: 10px;">
                                                <div class="progress-bar" role="progressbar" 
                                                     style="width: ${team.skillLevel * 20}%"
                                                     aria-valuenow="${team.skillLevel}" 
                                                     aria-valuemin="0" 
                                                     aria-valuemax="5">
                                                </div>
                                            </div>
                                            <span class="ms-2">${team.skillLevel}/5</span>
                                        </div>
                                    </td>
                                    <td>${team.users.size()}</td>
                                    <td>
                                        <i class="bi bi-calendar-event me-1"></i>
                                        ${team.gameDay}
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>