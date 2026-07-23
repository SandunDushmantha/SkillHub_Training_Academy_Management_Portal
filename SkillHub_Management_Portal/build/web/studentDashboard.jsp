<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Dashboard - SkillHub</title>
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
    <div class="eyebrow">Student Dashboard</div>
    <h2>Welcome, ${sessionScope.user.fullName}</h2>
    <p>Here's an overview of your enrolled courses and quick actions.</p>
</div>

<div class="container pb-5">

    <div class="row g-3 mb-4">
        <div class="col-md-6">
            <div class="stat-card">
                <div class="stat-icon tint-amber"><i class="bi bi-journal-bookmark-fill"></i></div>
                <div>
                    <div class="stat-value">${fn:length(sessionScope.user.enrolledCourseCodes)}</div>
                    <div class="stat-label">Enrolled Courses</div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="stat-card">
                <div class="stat-icon tint-slate"><i class="bi bi-person-badge-fill"></i></div>
                <div>
                    <div class="stat-value">${sessionScope.user.username}</div>
                    <div class="stat-label">Your Username</div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="content-card">
                <div class="card-header"><i class="bi bi-journal-bookmark-fill"></i>Your Enrolled Courses</div>
                <div class="card-body p-0">
                    <c:choose>
                        <c:when test="${empty sessionScope.user.enrolledCourseCodes}">
                            <div class="empty-state">
                                <i class="bi bi-inbox"></i>
                                You haven't enrolled in any courses yet.
                            </div>
                        </c:when>
                        <c:otherwise>
                            <table class="table table-hover">
                                <thead>
                                    <tr><th>Code</th><th>Course Name</th></tr>
                                </thead>
                                <tbody>
                                <c:forEach var="code" items="${sessionScope.user.enrolledCourseCodes}">
                                    <c:set var="enrolledCourse" value="${applicationScope.dataStore.getCourse(code)}"/>
                                    <tr>
                                        <td><span class="code-chip">${code}</span></td>
                                        <td>${enrolledCourse.title}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="content-card">
                <div class="card-header"><i class="bi bi-lightning-charge-fill"></i>Quick Actions</div>
                <div class="card-body">
                    <a href="${pageContext.request.contextPath}/enroll" class="action-tile">
                        <div class="tile-icon"><i class="bi bi-plus-circle-fill"></i></div>
                        <div class="tile-text"><strong>Enroll in a Course</strong><span>Browse the catalogue</span></div>
                    </a>
                    <a href="${pageContext.request.contextPath}/attendance" class="action-tile">
                        <div class="tile-icon"><i class="bi bi-calendar-check-fill"></i></div>
                        <div class="tile-text"><strong>View Attendance</strong><span>Check your history</span></div>
                    </a>
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
