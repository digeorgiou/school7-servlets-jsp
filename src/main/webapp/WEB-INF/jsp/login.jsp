<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css?v=<%=System.currentTimeMillis()%>">
</head>
<body class="bg-light-orange d-flex flex-column min-vh-100">
	<%@ include file="header.jsp"%>

    <main class="flex-grow-1 container my-4">
        <div class="row  justify-content-center">
            <div class="col-md-6 col-lg-4">
                <div class="card shadow mt-5 bg-light">
                    <div class="card-body p-4 text-center">
                       <h1 class="text-grey mb-4">Log in</h1>
                       <div style="color: red;">${error}</div>
                        <c:if test="${requestScope.isError == 'true'}">
                            <p style="color: red">Login Error</p>
                        </c:if>

                        <form method="POST" action="${pageContext.request.contextPath}/login">
                            <div class="mb-3">
                               <input class="form-control py-2 w-100"
                                type="email" name="username" required placeholder="E-mail">
                            </div>
                            <div class="mb-3">
                                <input class="form-control py-2 w-100"
                                type="password"
                                 name="password" required placeholder="Password">
                            </div>
                            <div  class="d-grid mb-3">
                                <button class="btn bg-green-color
                                text-white py-3 mt-4 rounded-3 shadow-none"
                                type="submit">Sign In</button>
                            </div>
                        </form>
                        <div class="mb-3 text-grey">
                            <a href="#">Lost your password?</a>
                        </div>
                        <div class="text-center text-grey">
                            <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Sign up here!</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <%@include file="footer.jsp"%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
</body>
</html>