<%--
  Created by IntelliJ IDEA.
  User: ganzorigu
  Date: 11/9/20
  Time: 11:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Tracker app</title>
    <!-- <link type="text/css" rel="stylesheet" href="css/style.css">-->
</head>

<body>

<div id="wrapper">
    <div id="header">
        <h2>Foobar University</h2>
    </div>

    <div id="container">
        <div id="content">
            <input type="button" value="Add Student" onclick="window.location.href='add-student-form.jsp'"
                   class="add-student-button"/>
            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email Name</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="tempStudent" items="${STUDENT_LIST}">
                    <!-- set up a link for each student -->
                    <c:url var="tempLink" value="TestServlet">
                        <c:param name="command" value="LOAD"/>
                        <c:param name="studentId" value="${tempStudent.id}"/>

                    </c:url>
                    <tr>
                        <td> ${tempStudent.firstName} </td>
                        <td> ${tempStudent.lastName} </td>
                        <td> ${tempStudent.email} </td>
                        <td><a href="${tempLink}">Update</a></td>
                    </tr>
                </c:forEach>

            </table>

        </div>
    </div>

</div>

</body>
</html>
