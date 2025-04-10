<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Ενημέρωση Μαθητή</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="${pageContext.request
    .contextPath}/css/student-insert.css">
</head>
<body class="d-flex flex-column min-vh-100 bg-light-orange">
    <%@ include file="header.jsp"%>

    <main class="flex-grow-1 d-flex align-items-center py-4">
        <div class="container" style="max-width: 1000px;">
            <form method="POST" action="${pageContext.request.contextPath}/school-app/students/update">
                <div class="row g-5">
                <!-- Column 1 -->
                    <div class="col-md-6">
                        <input type="hidden"
                        name="id"
                        value="${requestScope.updateDTO.id}" >

                        <div class="form-floating mb-1">
                            <input class="form-control" type="text"
                            name="firstname" value="${requestScope.updateDTO
                            .firstname}" placeholder="Όνομα">
                            <label for="firstname" class="fw-bold">Όνομα</label>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${sessionScope
                                .firstnameMessage}</small>
                            </div>
                        </div>

                        <div class="form-floating mb-1">
                            <input class="form-control" type="text"
                            name="email" value="${requestScope.updateDTO.email}"
                            placeholder="E-mail">
                            <label for="email" class="fw-bold">E-mail</label>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${sessionScope.emailMessage}</small>
                                <c:if test="${not empty sessionScope.emailMessage}">
                                      <c:remove var="emailMessage" scope="session"/>
                                </c:if>
                            </div>
                        </div>

                        <div class="form-floating mb-1">
                            <input class="form-control" type="text"
                            name="phoneNum" value="${requestScope.updateDTO.phoneNum}"
                            placeholder="Αριθμός Τηλεφώνου">
                            <label for="phoneNum" class="fw-bold">Αριθμός Τηλεφώνου</label>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${sessionScope.phoneNumMessage}</small>
                            </div>
                        </div>

                        <div class="form-floating mb-1">
                            <input class="form-control" type="text"
                            name="registrationYear" value="${requestScope.updateDTO.registrationYear}"
                            placeholder="Έτος Εγγραφής">
                            <label for="registrationYear" class="fw-bold">Έτος εγγραφής</label>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${sessionScope.registrationYearMessage}</small>
                            </div>
                        </div>

                        <div class="form-floating mb-1">
                            <select class="form-control" name="studyDirection">
                                <option value="" disabled ${empty updateDTO.studyDirection ? 'selected' : ''}>
                                    Επιλογή Κατεύθυνσης
                                </option>
                                <c:forEach items="${requestScope.studyDirections}" var="direction">
                                    <option value="${direction}"
                                            ${direction eq updateDTO.studyDirection ? 'selected' : ''}>
                                        ${direction}
                                    </option>
                                </c:forEach>
                            </select>
                            <label for="studyDirection" class="fw-bold">Κατεύθυνση σπουδών</label>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${sessionScope.studyDirectionMessage}</small>
                            </div>
                        </div>
                    </div>

                <!--  Column 2 -->
                    <div class="col-md-6">
                        <div class="form-floating mb-1">
                            <input class="form-control" type="text"
                            name="lastname" value="${requestScope.updateDTO.lastname}"
                             placeholder="Επώνυμο">
                            <label for="lastname"
                            class="fw-bold">Επώνυμο</label>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${sessionScope.lastnameMessage}</small>
                            </div>
                        </div>

                        <div class="form-floating mb-1">
                            <input class="form-control" type="text"
                            name="fathername" value="${requestScope.updateDTO.fatherName}"
                            placeholder="Όνομα Πατρός">
                            <label for="fathername" class="fw-bold">Όνομα
                            Πατρός</label>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${sessionScope
                                .fathernameMessage}</small>
                            </div>
                        </div>

                        <div class="form-floating mb-1">
                            <input class="form-control datepicker" type="text"
                                   name="birthDate" value="${requestScope
                                   .updateDTO.formattedBirthDate}"
                                   placeholder="Ημερομηνία Γέννησης" autocomplete="off">
                            <label for="birthDate" class="fw-bold">Ημερομηνία Γέννησης</label>
                            <div class="mt-1 min-height-form">
                                <small class="text-danger">${sessionScope
                                .birthDateMessage}</small>
                            </div>
                        </div>


                        <div class="mb-1">
                            <div class="form-floating">
                            <!-- City Dropdown -->
                                <select class="form-control" name="cityId">
                            <%-- The Select City option appears in the dropdown but cannot be chosen after a real selection is made --%>
                                    <option value="" disabled ${empty updateDTO.cityId ? 'selected' : ''}>
                                    Επιλογή Πόλης
                                    </option>
                                <c:forEach items="${requestScope.cities}" var="city">
                                    <option value="${city.id}"
                                    ${city.id eq updateDTO.cityId ? 'selected' : ''}>
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
                    <a href="${pageContext.request.contextPath}/school-app/students/view"
                    class="btn btn-secondary btn-lg px-5 py-3 ms-3">Επιστροφή</a>
                </div>
                <c:if test="${not empty sessionScope.emailMessage}">
                    <c:remove var="emailMessage" scope="session"/>
                        <div class="col-12 text-center">
                            ${sessionScope.errorMessage}
                        </div>
                </c:if>
            </div>
        </form>
    </div>
    </main>

    <%@ include file="footer.jsp"%>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.el.min.js"></script>

    <script>
        $(document).ready(function(){
            $('.datepicker').datepicker({
                format: 'dd/mm/yyyy',
                language: 'el',
                autoclose: true,
                todayHighlight: true,
                orientation: "bottom auto" /* Makes calendar appear below input */
            });
        });
    </script>
</body>
</html>