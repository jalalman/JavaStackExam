
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
    <title>${student.name} profile</title>
</head>
<body>
    <div class="col-md-6">
        <h2>Add New Student</h2>
        <form:form action="/student/${student.id}/update" method="post" modelAttribute="student">
            <div class="mb-3">
                <form:label path="name" class="form-label"> Name:</form:label>
                <form:input path="name" class="form-control"/>
                <form:errors path="name" class="text-danger"/>
            </div>
            <div class="mb-3">
                <form:label path="age" class="form-label">age:</form:label>
                <form:input path="age" class="form-control" type="Number"/>
                <form:errors path="age" class="text-danger"/>
            </div>
            <div class="mb-3">
                <form:label path="grade" class="form-label">Grade:</form:label>
                <form:select path="grade" class="form-select">
                    <form:option value="1">1st Grade</form:option>
                    <form:option value="2">2nd Grade</form:option>
                    <form:option value="3">3rd Grade</form:option>
                    <form:option value="4">4th Grade</form:option>
                    <form:option value="5">5th Grade</form:option>
                    <form:option value="6">6th Grade</form:option>
                </form:select>
                <div class="mb-3"></div>

                    <form:label path="stuClass" class="form-label">Class:</form:label>
                    <form:select path="stuClass" class="form-select">
                        <c:forEach var="classItem" items="${classes}">
                            <form:option value="${classItem.id}">${classItem.id} ${classItem.className}</form:option>
                        </c:forEach>
                    </form:select>
                    <form:errors path="class" class="text-danger"/>
                </div>
                <form:errors path="grade" class="text-danger"/>
                <input type="submit" value="edit" class="btn btn-primary"/>
               <a href="/student/${student.id}/delete"  class="btn btn-danger">Delete</a>
            </div>

        </form:form>
    </div>
</body>
</html>