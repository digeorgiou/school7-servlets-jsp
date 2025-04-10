<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
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
<title>Επιτυχής Ενημέρωση</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/success.css">
</head>
<body class= "d-flex flex-column min-vh-100 bg-light-orange">
    <%@ include file="header.jsp"%>

    <div class="flex-grow-1">
            <div class="container py-4">
                <div class="row justify-content-center align-items-center">
                    <div class="col-md-8 col-lg-6">
                        <div class="success-container text-center">
                            <!-- Success Icon -->
                            <div class="success-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384
                                    7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                                </svg>
                            </div>

                            <!-- Success Message -->
                            <h1 class="mb-4 text-success">Επιτυχής Ενημέρωση
                            Καθηγητή</h1>

                            <!-- Teacher Information -->
                            <div class="teacher-info text-start">
                                <h3 class="h5 mb-3">Στοιχεία Καθηγητή:</h3>
                                <div class="d-flex justify-content-between border-bottom pb-2 mb-2">
                                    <span class="fw-bold">Επώνυμο:</span>
                                    <span>${sessionScope.teacherInfo.lastname}</span>
                                </div>
                                <div class="d-flex justify-content-between border-bottom pb-2 mb-2">
                                    <span class="fw-bold">Όνομα:</span>
                                    <span>${sessionScope.teacherInfo.firstname}</span>
                                </div>
                                <c:if test="${not empty sessionScope.teacherInfo.email}">
                                <div class="d-flex justify-content-between">
                                    <span class="fw-bold">Email:</span>
                                    <span>${sessionScope.teacherInfo.email}</span>
                                </div>
                                </c:if>
                            </div>

                        <!-- Action Buttons -->
                            <div class="d-flex justify-content-center">
                                <a href="${pageContext.request.contextPath}/school-app/teachers/view"
                                   class="btn btn-primary btn-lg py-3 px-5
                                   return-btn">
                                    Επιστροφή
                                </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<%@ include file="footer.jsp"%>
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
