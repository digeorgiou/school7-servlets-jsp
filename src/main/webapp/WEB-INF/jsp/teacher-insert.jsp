<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Εισαγωγή Καθηγητή</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacher-insert.css">
</head>
<body class="d-flex flex-column min-vh-100 bg-light-orange">
    <%@ include file="header.jsp"%>

    <main class="flex-grow-1 d-flex align-items-center py-4">
        <div class="container" style="max-width: 1000px;">
            <form method="POST" action="${pageContext.request.contextPath}/school-app/teachers/insert">
                <div class="row g-5">
                <!-- Column 1 -->
                    <div class="col-md-6">
                        <div class="form-floating mb-1">
                            <input class="form-control" type="text"
                            name="firstname" value="${requestScope.insertDTO.firstname}" placeholder="Όνομα">
                            <label for="firstname" class="fw-bold">Όνομα</label>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${sessionScope
                                .firstnameMessage}</small>
                            </div>
                        </div>

                        <div class="form-floating mb-1">
                            <input class="form-control" type="text"
                            name="vat" value="${requestScope.insertDTO.vat}"
                            placeholder="ΑΦΜ">
                            <label for="vat" class="fw-bold">ΑΦΜ</label>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${sessionScope
                                .vatMessage}</small>
                            </div>
                        </div>

                        <div class="form-floating mb-1">
                            <input class="form-control" type="text"
                            name="phoneNum" value="${requestScope.insertDTO.phoneNum}"
                            placeholder="Αριθμός Τηλεφώνου">
                            <label for="phoneNum" class="fw-bold">Αριθμός Τηλεφώνου</label>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${sessionScope.phoneNumMessage}</small>
                            </div>
                        </div>

                        <div class="form-floating mb-1">
                            <input class="form-control" type="text"
                            name="street" value="${requestScope.insertDTO.street}"
                            placeholder="Οδός">
                            <label for="street" class="fw-bold">Οδός</label>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${sessionScope.streetMessage}</small>
                            </div>
                        </div>

                        <div class="form-floating mb-1">
                            <input class="form-control" type="text"
                            name="zipcode" value="${requestScope.insertDTO.zipCode}"
                            placeholder="ΤΚ">
                            <label for="zipcode" class="fw-bold">ΤΚ</label>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${sessionScope.zipcodeMessage}</small>
                            </div>
                        </div>
                    </div>

                <!--  Column 2 -->
                    <div class="col-md-6">
                        <div class="form-floating mb-1">
                            <input class="form-control" type="text"
                            name="lastname" value="${requestScope.insertDTO.lastname}"
                             placeholder="Επώνυμο">
                            <label for="lastname"
                            class="fw-bold">Επώνυμο</label>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${sessionScope.lastnameMessage}</small>
                            </div>
                        </div>

                        <div class="form-floating mb-1">
                            <input class="form-control" type="text"
                            name="fathername" value="${requestScope.insertDTO.fatherName}"
                            placeholder="Όνομα Πατρός">
                            <label for="fathername" class="fw-bold">Όνομα
                            Πατρός</label>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${requestScope.fathernameMessage}</small>
                            </div>
                        </div>

                        <div class="form-floating mb-1">
                            <input class="form-control" type="text"
                            name="email" value="${requestScope.insertDTO.email}"
                            placeholder="E-mail">
                            <label for="email" class="fw-bold">E-mail</label>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${requestScope.emailMessage}</small>
                            </div>
                        </div>

                        <div class="form-floating mb-1">
                            <input class="form-control" type="text"
                            name="streetNum" value="${requestScope.insertDTO.streetNum}"
                            placeholder="Αριθμός">
                            <label for="streetNum" class="fw-bold">Αριθμός</label>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${requestScope.streetNumMessage}</small>
                            </div>
                        </div>

                        <div class="mb-1">
                            <div class="form-floating">
                            <!-- City Dropdown -->
                                <select class="form-control" name="cityId">
                            <%-- The Select City option appears in the dropdown but cannot be chosen after a real selection is made --%>
                                    <option value="" disabled ${empty insertDTO.cityId ? 'selected' : ''}>
                                    Επιλογή Πόλης
                                    </option>
                                <c:forEach items="${requestScope.cities}" var="city">
                                    <option value="${city.id}"
                                    ${city.id eq insertDTO.cityId ? 'selected' : ''}>
                                    ${city.name}
                                    </option>
                                </c:forEach>
                                </select>
                                <label for="cityId" class="fw-bold">Πόλη</label>
                            </div>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${sessionScope
                                .cityIdMessage}</small>
                            </div>
                        </div>
                    </div>

                           <!-- Form Actions -->
                <div class="col-12 text-center mt-2">
                     <button type="submit" class="btn btn-success btn-lg px-5 py-3">Εισαγωγή</button>
                    <a href="${pageContext.request.contextPath}/school-app/teachers/view"
                    class="btn btn-secondary btn-lg px-5 py-3 ms-3">Επιστροφή</a>
                </div>

                <div class="col-12 text-center">
                    ${sessionScope.errorMessage}
                </div>
            </div>
        </form>
        </div>
    </main>

    <%@ include file="footer.jsp"%>
</body>
</html>
