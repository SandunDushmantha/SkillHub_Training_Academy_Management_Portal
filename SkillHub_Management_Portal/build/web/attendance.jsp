<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Attendance - SkillHub</title>
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
            <span class="role-chip"><i class="bi bi-person-fill"></i> ${sessionScope.user.role}</span>
            <a class="logout-btn" href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right me-1"></i>Logout</a>
        </div>
    </div>
</nav>

<div class="container page-hero">
    <div class="eyebrow">Attendance</div>
    <h2>
        <c:choose>
            <c:when test="${sessionScope.user.role == 'TRAINER'}">Mark Attendance</c:when>
            <c:otherwise>My Attendance History</c:otherwise>
        </c:choose>
    </h2>
    <p>
        <c:choose>
            <c:when test="${sessionScope.user.role == 'TRAINER'}">Record attendance for students in your courses.</c:when>
            <c:otherwise>Your attendance history across all enrolled courses.</c:otherwise>
        </c:choose>
    </p>
</div>

<div class="container pb-5">

    <c:if test="${sessionScope.user.role == 'TRAINER'}">
        <div class="content-card">
            <div class="card-header"><i class="bi bi-calendar-check-fill"></i>Mark Attendance</div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/attendance" method="post">
                    <div class="row g-3 align-items-end">
                        <div class="col-md-4">
                            <label class="form-label">Student</label>
                            <select class="form-select" name="studentUsername" required>
                                <option value="" disabled selected>Select a student</option>
                                <c:forEach var="student" items="${students}">
                                    <option value="${student.username}">${student.fullName} (${student.username})</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Course</label>
                            <select class="form-select" name="courseCode">
                                <c:forEach var="course" items="${courses}">
                                    <option value="${course.code}">${course.code} - ${course.title}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <div class="form-check mt-2">
                                <input class="form-check-input" type="checkbox" name="present" id="presentCheck"/>
                                <label class="form-check-label" for="presentCheck">Present</label>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <button type="submit" class="btn btn-accent w-100">
                                <i class="bi bi-check2-circle me-1"></i>Save
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </c:if>

    <c:if test="${sessionScope.user.role == 'STUDENT'}">
        <div class="content-card">
            <div class="card-header"><i class="bi bi-clock-history"></i>My Attendance History</div>
            <div class="card-body p-0">
                <c:choose>
                    <c:when test="${empty records}">
                        <div class="empty-state">
                            <i class="bi bi-inbox"></i>
                            No attendance records yet.
                        </div>
                    </c:when>
                    <c:otherwise>
                        <table class="table table-hover">
                            <thead>
                                <tr><th>Course</th><th>Date</th><th>Status</th></tr>
                            </thead>
                            <tbody>
                            <c:forEach var="rec" items="${records}">
                                <tr>
                                    <td><span class="code-chip">${rec.courseCode}</span></td>
                                    <td>${rec.date}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${rec.present}">
                                                <span class="status-badge present"><i class="bi bi-check-lg"></i> Present</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-badge absent"><i class="bi bi-x-lg"></i> Absent</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </c:if>

</div>

<div id="flash-data" data-success="${fn:escapeXml(successMessage)}" data-error="${fn:escapeXml(errorMessage)}" style="display:none;"></div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/toast.js"></script>

</body>
</html>
