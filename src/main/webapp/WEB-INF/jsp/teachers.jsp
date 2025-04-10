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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/teachers.css">

    <style>
               .focus-blue:focus {
               outline: none !important;
               border: none !important;
               box-shadow: 0 0 0 0.25rem rgba(100, 200, 255, 0.5) !important;
           }
    </style>
</head>
<body class="bg-light-orange d-flex flex-column min-vh-100">
<%@ include file="header.jsp"%>
<div class="flex-grow-1 d-flex flex-column justify-content-center gap-4">

    <div class="d-flex justify-content-center pt-3 pb-3">
        <form id="filterForm" method="GET" action="${pageContext.request.contextPath}/school-app/teachers/view">
            <input class="focus-blue rounded-3 border-0 px-5 py-2" type="text"
            name="firstname"
            placeholder="Όνομα" />
            <input class="rounded-3 border-0 px-5 py-2 focus-blue" type="text"
            name="lastname" placeholder="Επώνυμο" />
            <input class="btn btn-primary btn-lg rounded-3 ps-5 pe-5 pt-1
                                              pb-1 me-4 ms-4" id="submitBtn" type="submit" value="Αναζήτηση" />
            <button class="btn btn-secondary btn-lg rounded-3 ps-5 pe-5
                                              pt-1 pb-1" id="resetBtn" type="button" onclick="reset()">Επαναφορά</button>
        </form>
    </div>
    <div class="d-flex justify-content-center table-responsive">
        <c:choose>
            <c:when test="${not empty requestScope.teachers}">
                <table class="table table-striped table-warning">
                    <thead class="sticky-top">
                        <tr class="text-center">
                            <th>Κωδικός</th>
                            <th>Όνομα</th>
                            <th>Επώνυμο</th>
                            <th>Πράξεις</th>
                        </tr>
                    </thead>

                    <c:forEach var = "teacher" items = "${requestScope
                    .teachers}">
                        <tr>
                            <td>${teacher.id}</td>
                            <td>${teacher.firstname}</td>
                            <td>${teacher.lastname}</td>
                            <td>
                                <div class="d-flex justify-content-center gap-3">
                                    <a href="${pageContext.request
                                    .contextPath}/school-app/teachers/details?id=${teacher.id}">
                                        <i class="bi bi-eye fs-5"></i>
                                    </a>
                                    <a href="${pageContext.request
                                    .contextPath}/school-app/teachers/update?id=${teacher.id}">
                                        <i class="bi bi-pencil-square fs-5"></i>
                                    </a>
                                    <a href="#" class="delete-btn"
                                    data-teacher-id="${teacher.id}"
                                    data-bs-toggle="modal"
                                    data-bs-target="#deleteModal"
                                    data-teacher-firstname="${teacher.firstname}"
                                    data-teacher-lastname="${teacher.lastname}">
                                    <i class="bi bi-trash-fill fs-5"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <div class="d-flex justify-content-center align-items-center"
                     style="min-height: 300px; width: 100%;">
                     <h3 class="fw-bold text-primary">${requestScope.message}</h3>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

        <div class="row mt-4">
         <div class="col-12 text-center">
            <c:if test="${sessionScope.role == 'ADMIN'}">
                    <a class="btn btn-success btn-lg px-3 py-3"
                    href="${pageContext.request
                    .contextPath}/school-app/teachers/insert">Εισαγωγή
                    Καθηγητή</a>
             </c:if>
             <a class="btn btn-secondary btn-lg px-5 py-3 ms-3"
                href="${pageContext.request.contextPath}/school-app/dashboard">
                Επιστροφή</a>
         </div>
    </div>
</div>

<div>
<%--    <c:if test="${requestScope.deleteAPIError}">--%>
<%--    </c:if>--%>
</div>

<div>
    <c:if test="${requestScope.updateAPIError}">
        <p>Something went wrong in Update</p>
    </c:if>
</div>

<%@ include file="footer.jsp"%>

<div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title">Επιβεβαίωση διαγραφής</h5>
                    <button type="button" class="btn-close btn-close-white"
                    data-bs-dismiss="modal" aria-label="Κλείσιμο"></button>
                </div>
                <div class="modal-body">
                    <p>Είστε σίγουροι ότι θέλετε να διαγράψετε τον καθηγητή:
                    </p>
                     <p><strong>ID: <span id="modalTeacherId"></span></strong></p>
                     <p><strong>Ονοματεπώνυμο: <span
                     id="modalTeacherLastname"></span>
                     <span id="modalTeacherFirstname"></span></strong></p>
                    <div class="alert alert-warning mt-3">
                     <i class="bi bi-exclamation-triangle-fill"></i> Η διαγραφή
                     είναι μη αναστρέψιμη
                     </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                    data-bs-dismiss="modal">Ακύρωση</button>
                    <a id="confirmDeleteBtn" href="#" class="btn btn-danger">Διαγραφή</a>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript at bottom -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const deleteModal = document.getElementById('deleteModal');

        deleteModal.addEventListener('show.bs.modal', function(event) {
            const button = event.relatedTarget;

            // Extract all data attributes
            const id = button.getAttribute('data-teacher-id');
            const firstname = button.getAttribute('data-teacher-firstname');
            const lastname = button.getAttribute('data-teacher-lastname');

            // Debugging - check values in console
            console.log('Teacher Data:', {id, firstname, lastname});

            // Update modal content
            document.getElementById('modalTeacherId').textContent = id;
            document.getElementById('modalTeacherLastname').textContent = lastname;
            document.getElementById('modalTeacherFirstname').textContent = firstname;

            // Set delete URL
            document.getElementById('confirmDeleteBtn').href =
                `${pageContext.request.contextPath}/school-app/teachers/delete?id=${id}`;
        });
    });
    </script>


<script src="${pageContext.request.contextPath}/js/teachers.js">

</script>
</body>
</html>
