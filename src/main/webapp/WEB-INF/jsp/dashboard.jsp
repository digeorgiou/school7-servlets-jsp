<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css"
</head>
<body class="bg-light-orange d-flex flex-column min-vh-100">
<%@ include file="header.jsp"%>


    <main class="container-fluid flex-grow-1 p-0">
        <div class="row g-0 h-100">
                <div class="col-md-6 h-100">
                    <div class="left-section" style="background-image: url('${pageContext.request.contextPath}/img/prof.jpg');">
                        <div class="color-overlay"></div>
                    </div>
                    <div class="left-btn-container">
                        <a href="<c:url value='${pageContext.request.contextPath}/school-app/teachers/view' />"
                        class="btn btn-success btn-lg rounded-3 ps-4 pe-4
                        pt-4 pb-4">Προβολή
                        Καθηγητών
                        </a>
                    </div>
                </div>
                <div class="col-md-6 h-100">
                    <div class="right-section" style="background-image: url('${pageContext.request.contextPath}/img/students.jpg');">
                        <div class="color-overlay"></div>
                    </div>
                    <div class="right-btn-container">
                        <a href="<c:url value='${pageContext.request.contextPath}/school-app/teachers/view' />"
                         class="btn btn-success btn-lg rounded-3 ps-4 pe-4
                         pt-4 pb-4">Προβολή Μαθητων
                         </a>
                    </div>
                </div>
        </div>
    </main>

<%@ include file="footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
</body>
</html>
