<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard - SkillHub</title>
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
            <span class="role-chip"><i class="bi bi-shield-lock-fill"></i> Administrator</span>
            <a class="logout-btn" href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right me-1"></i>Logout</a>
        </div>
    </div>
</nav>

<div class="container page-hero">
    <div class="eyebrow">Admin Dashboard</div>
    <h2>Administrator Overview</h2>
    <p>Manage courses and trainer assignments across the academy.</p>
</div>

<div class="container pb-5">

    <div class="row g-3 mb-4">
        <div class="col-md-4">
            <div class="stat-card">
                <div class="stat-icon tint-amber"><i class="bi bi-collection-fill"></i></div>
                <div>
                    <div class="stat-value">${fn:length(courses)}</div>
                    <div class="stat-label">Total Courses</div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="stat-card">
                <div class="stat-icon tint-slate"><i class="bi bi-person-workspace"></i></div>
                <div>
                    <div class="stat-value">${fn:length(trainers)}</div>
                    <div class="stat-label">Total Trainers</div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="stat-card">
                <div class="stat-icon tint-green"><i class="bi bi-shield-check"></i></div>
                <div>
                    <div class="stat-value">Active</div>
                    <div class="stat-label">System Status</div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-7">
            <div class="content-card">
                <div class="card-header"><i class="bi bi-collection-fill"></i>All Courses</div>
                <div class="card-body p-0">
                    <c:choose>
                        <c:when test="${empty courses}">
                            <div class="empty-state">
                                <i class="bi bi-inbox"></i>
                                No courses added yet.
                            </div>
                        </c:when>
                        <c:otherwise>
                            <table class="table table-hover">
                                <thead>
                                    <tr><th>Code</th><th>Title</th><th>Trainer</th></tr>
                                </thead>
                                <tbody>
                                <c:forEach var="course" items="${courses}">
                                    <tr>
                                        <td><span class="code-chip">${course.code}</span></td>
                                        <td>${course.title}</td>
                                        <td>${course.trainerUsername}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div class="col-lg-5">
            <div class="content-card">
                <div class="card-header"><i class="bi bi-plus-square-fill"></i>Add New Course</div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/course" method="post">
                        <div class="mb-3">
                            <label class="form-label">Course Code</label>
                            <input type="text" class="form-control" name="courseCode" placeholder="e.g. SAD" required/>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Course Title</label>
                            <input type="text" class="form-control" name="courseTitle" placeholder="e.g. Software Application Development" required/>
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Trainer</label>
                            <select class="form-select" name="trainerUsername">
                                <c:forEach var="trainer" items="${trainers}">
                                    <option value="${trainer.username}">${trainer.fullName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-accent w-100">
                            <i class="bi bi-check2-circle me-1"></i> Add Course
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="flash-data" data-success="${fn:escapeXml(successMessage)}" data-error="${fn:escapeXml(errorMessage)}" style="display:none;"></div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/toast.js"></script>

</body>
</html>
