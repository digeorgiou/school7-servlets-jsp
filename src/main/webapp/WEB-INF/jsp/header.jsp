<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
</head>
<body>

<header class="sticky-top d-flex justify-content-between height-70 bg-opa-red align-items-center">

        <div class="h-100 w-25">
            <a href=""><img class= "h-100 w-25" src="${pageContext.request
            .contextPath}/img/auebimg.jpg" alt=""></a>
        </div>

        <div class="w-50 text-center ms-4">
            <h2 class="text-white"> Coding Factory - Education Reinvented </h2>
        </div>

        <div class="d-flex justify-content-center w-25">
<%--            <span>${sessionScope.firstname}</span>--%>
<%--            <span>${sessionScope.lastname</span>--%>
            <h4 class="text-white"><span>${sessionScope.username}</span></h4>
            <c:if test="${sessionScope.username != null}">
               <h3> <a class="ms-2 me-2 bg-yellow text-decoration-none
               text-black ps-2 pe-2"
               href="${pageContext.request
                .contextPath}/logout">Έξοδος</a> </h3>
            </c:if>
        </div>
    </div>
    <div class="line">


</header>
</body>
</html>