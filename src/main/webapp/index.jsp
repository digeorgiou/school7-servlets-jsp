<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Central Service</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        body {
            display: grid;
            grid-template-rows: auto 1fr auto;
            background-color: #F4BC84;
        }
        .background-image {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url("../img/happystudents.jpg");
            background-size: cover;
            background-position: center;
            filter: grayscale(100%) opacity(25%);
            z-index: -1;
        }
        main {
            padding: 20px 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>

<div class="background-image"></div>

<%@ include file="/WEB-INF/jsp/header.jsp" %>

<main>
    <h1 class="mb-5">Κεντρική Υπηρεσία Coding Factory</h1>
    <a href="${pageContext.request.contextPath}/login"
       class="text-center ms-4 rounded-3 bg-green-color text-white px-5 py-3
       border-0 fs-6 text-decoration-none w-50">
       Συνέχεια
    </a>
</main>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>