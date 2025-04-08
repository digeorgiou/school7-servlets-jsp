<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Προβολή Καθηγητών</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/teachers.css">
</head>
<body class="bg-light-orange d-flex flex-column min-vh-100">
<%@ include file="header.jsp"%>
<div class="flex-grow-1 d-flex flex-column justify-content-center gap-4">

    <div class="d-flex justify-content-center pt-3 pb-3">
        <form id="filterForm" method="GET" action="${pageContext.request.contextPath}/school-app/teachers/view">
            <%--        <input type="text" name="filterId" placeholder="Enter ID" />--%>
            <input class="rounded-3 border-0 px-5 py-2"type="text"
            name="firstname"
            placeholder="Όνομα" />
            <input class="rounded-3 border-0 px-5 py-2" type="text"
            name="lastname" placeholder="Επώνυμο" />
            <input class="ms-4 rounded-3 bg-strong-orange text-white px-5 py-2 border-0 fs-6 text-decoration-none" id="submitBtn" type="submit" value="Αναζήτηση" />
            <button class="ms-1 rounded-3 bg-gray-blue text-white px-5 py-2 border-0 fs-6 text-decoration-none" id="resetBtn" type="button" onclick="reset()">Επαναφορά</button>
        </form>
    </div>
    <div class="d-flex justify-content-center table-responsive">
        <table class="table table-striped table-warning">
            <thead class="sticky-top">
                <tr class="text-center">
                    <th>Κωδικός</th>
                    <th>Όνομα</th>
                    <th>Επώνυμο</th>
                    <th>Πράξεις</th>
                </tr>
            </thead>
    <%--        <p>${requestScope.message}</p>--%>
            <c:forEach var = "teacher" items = "${requestScope.teachers}">
                <tr>
                    <td>${teacher.id}</td>
                    <td>${teacher.firstname}</td>
                    <td>${teacher.lastname}</td>
                    <td>
                    <div class="d-flex justify-content-center gap-3">
                    <a href="${pageContext.request.contextPath}/school-app/teachers/view?id=${teacher.id}">
                    <svg width = "20" height="20" xmlns="http://www.w3
                    .org/2000/svg" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                    <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                                                                                                                                                           <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                                                                                                                                                       </svg></a>
                                                                                                                                                       <a href="${pageContext.request.contextPath}/school-app/teachers/update?id=${teacher.id}"><svg width = "20" height="20" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                                                                                                                                                                                                                                                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                                                                                                                                                                                                                                                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                                                                                                                                                                                                                                                                        </svg></a><a href="${pageContext.request.contextPath}/school-app/teachers/delete?id=${teacher.id}"
                           onclick="return confirm('Are you sure you want to delete the teacher?')"><svg width = "20" height="20" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                                                                                                                                <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"/>
                                                                                                                                            </svg></a>
                    </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <c:if test="${sessionScope.role == 'ADMIN'}">
        <div class="d-flex justify-content-center">
            <a class="ms-4 rounded-3 bg-green-color text-white px-5 py-3 border-0 fs-6 text-decoration-none"
            href="${pageContext.request.contextPath}/school-app/teachers/insert">Εισαγωγή Καθηγητή</a>
        </div>
     </c:if>
</div>

<div>
<%--    <c:if test="${requestScope.deleteAPIError}">--%>
        <p>${requestScope.message}</p>
<%--    </c:if>--%>
</div>

<div>
    <c:if test="${requestScope.updateAPIError}">
        <p>Something went wrong in Update</p>
    </c:if>
</div>

<%@ include file="footer.jsp"%>

<script src="${pageContext.request.contextPath}/js/teachers.js">

</script>
</body>
</html>
