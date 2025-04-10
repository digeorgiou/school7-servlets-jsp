<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Εγγραφή Χρήστη</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .bg-light-orange {
            background-color: #F4BC84;
        }
        .min-height-form {
            min-height: 35px;
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100 bg-light-orange">
<%@ include file="header.jsp"%>

<main class="flex-grow-1 d-flex align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow">
                    <div class="card-body p-4">
                        <h2 class="card-title text-center mb-4">Εγγραφή Χρήστη</h2>

                        <form method="POST" action="">
                            <!-- Username Field -->
                            <div class="mb-3">
                                <label for="username" class="form-label fw-bold">Username</label>
                                <input class="form-control" type="email" id="username" name="username"
                                    value="${requestScope.userRegisterDTO.username}" required placeholder="Username">
                                <div class="mt-1 min-height-form">
                                    <small class="text-danger">${requestScope.usernameMessage}</small>
                                </div>
                            </div>

                            <!-- Password Field -->
                            <div class="mb-3">
                                <label for="password" class="form-label fw-bold">Password</label>
                                <input class="form-control" type="password" id="password" name="password"
                                    value="${requestScope.userRegisterDTO.password}" required placeholder="Password">
                                <div class="mt-1 min-height-form">
                                    <small class="text-danger">${requestScope.passwordMessage}</small>
                                </div>
                            </div>

                            <!-- Confirm Password Field -->
                            <div class="mb-3">
                                <label for="confirmPassword" class="form-label fw-bold">Confirm Password</label>
                                <input class="form-control" type="password" id="confirmPassword" name="confirmPassword"
                                    value="${requestScope.userRegisterDTO.confirmPassword}" required placeholder="Confirm Password">
                                <div class="mt-1 min-height-form">
                                    <small class="text-danger">${requestScope.confirmPasswordMessage}</small>
                                </div>
                            </div>

                            <!-- Role Selection -->
                            <div class="mb-4">
                                <label class="form-label fw-bold">Ρόλος</label>
                                <select class="form-select" name="role">
                                    <option value="ADMIN">Διαχειριστής</option>
                                    <option value="LIGHT_ADMIN">Βοηθός Διαχειριστή</option>
                                </select>
                                <div class="mt-1 min-height-form">
                                    <small class="text-danger">${requestScope.roleMessage}</small>
                                </div>
                            </div>

                            <!-- Buttons -->
                            <div class="d-flex justify-content-center gap-3 mt-4">
                                <button class="btn btn-success btn-lg px-5" type="submit">Εγγραφή</button>
                                <a class="btn btn-secondary btn-lg px-5" href="${pageContext.request.contextPath}/login">Επιστροφή</a>
                            </div>

                            <!-- Error Message -->
                            <div class="text-center mt-3">
                                <span class="text-danger">${requestScope.errorMessage}</span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
