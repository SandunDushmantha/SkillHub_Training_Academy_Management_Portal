<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Available Courses - SkillHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg app-navbar">
    <div class="container">
        <span class="navbar-brand">
            <span class="logo-badge"><i class="bi bi-mortarboard-fill"></i></span>
            SkillHub Training Academy
        </span>
        <div class="ms-auto d-flex align-items-center gap-3">
            <span class="role-chip"><i class="bi bi-person-fill"></i> Student</span>
            <a class="logout-btn" href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right me-1"></i>Logout</a>
        </div>
    </div>
</nav>

<div class="container page-hero">
    <div class="eyebrow">Course Catalogue</div>
    <h2>Available Courses</h2>
    <p>Browse and enroll in courses offered by the academy.</p>
</div>

<div class="container pb-5">

    <div class="content-card">
        <div class="card-header"><i class="bi bi-collection-fill"></i>Course Catalogue</div>
        <div class="card-body p-0">
            <c:choose>
                <c:when test="${empty courses}">
                    <div class="empty-state">
                        <i class="bi bi-inbox"></i>
                        No courses are available right now.
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="table table-hover">
                        <thead>
                            <tr><th>Code</th><th>Title</th><th class="text-end">Action</th></tr>
                        </thead>
                        <tbody>
                        <c:forEach var="course" items="${courses}">
                            <tr>
                                <td><span class="code-chip">${course.code}</span></td>
                                <td>${course.title}</td>
                                <td class="text-end">
                                    <form action="${pageContext.request.contextPath}/enroll" method="post" class="d-inline">
                                        <input type="hidden" name="courseCode" value="${course.code}"/>
                                        <button type="submit" class="btn btn-accent btn-sm">
                                            <i class="bi bi-plus-circle-fill me-1"></i>Enroll
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="mt-3">
        <a href="${pageContext.request.contextPath}/studentDashboard.jsp" class="btn btn-outline-ink btn-sm">
            <i class="bi bi-arrow-left me-1"></i> Back to dashboard
        </a>
    </div>
</div>

<div id="flash-data" data-success="${fn:escapeXml(successMessage)}" data-error="${fn:escapeXml(errorMessage)}" style="display:none;"></div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/toast.js"></script>

</body>
</html>
