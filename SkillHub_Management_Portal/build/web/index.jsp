<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SkillHub Training Academy - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>

<div class="auth-shell">
    <div class="auth-brand-panel">
        <div class="auth-brand-logo">
            <span class="logo-badge"><i class="bi bi-mortarboard-fill"></i></span>
            SkillHub Training Academy
        </div>

        <div class="auth-brand-copy">
            <h1>SkillHub Training Academy</h1>
            <p>Training Management Portal</p>
        </div>

        <div class="auth-brand-footer">&copy; 2026 SkillHub Training Academy</div>
    </div>

    <div class="auth-form-panel">
        <div class="auth-form-inner">
            <h3>Welcome back</h3>
            <div class="subtitle">Log in to access your dashboard</div>

            <form action="${pageContext.request.contextPath}/login" method="post" id="loginForm" novalidate>
                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text" class="form-control" name="username" placeholder="Enter your username" required autofocus/>
                </div>
                <div class="mb-4">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" placeholder="Enter your password" required/>
                </div>
                <button type="submit" class="btn btn-accent w-100">
                    <i class="bi bi-box-arrow-in-right me-1"></i> Login
                </button>
            </form>

            <div class="auth-switch-link">
                New student? <a href="register.jsp">Create an account</a>
            </div>
        </div>
    </div>
</div>

<div id="flash-data" data-success="${fn:escapeXml(successMessage)}" data-error="${fn:escapeXml(errorMessage)}" style="display:none;"></div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/toast.js"></script>
<script>
document.getElementById('loginForm').addEventListener('submit', function (e) {
    var username = this.username.value.trim();
    var password = this.password.value.trim();

    if (!username) {
        e.preventDefault();
        window.shToast('Please enter your username.', 'error');
        return;
    }
    if (!password) {
        e.preventDefault();
        window.shToast('Please enter your password.', 'error');
        return;
    }
});
</script>

</body>
</html>