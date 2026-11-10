<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>

<body>
    <h1>Thanks for joining our email list</h1>

    <p>Here is the information that you entered:</p>

    <table class="survey-results">
        <tbody>
            <tr>
                <th scope="row">Email:</th>
                <td><c:out value="${user.email}"/></td>
            </tr>
            <tr>
                <th scope="row">First Name:</th>
                <td><c:out value="${user.firstName}"/></td>
            </tr>
            <tr>
                <th scope="row">Last Name:</th>
                <td><c:out value="${user.lastName}"/></td>
            </tr>
            <tr>
                <th scope="row">Date of Birth:</th>
                <td>
            <c:choose>
                <c:when test="${not empty user.formattedDateOfBirth}">
                    <c:out value="${user.formattedDateOfBirth}"/>
                </c:when>
                <c:otherwise>Not provided</c:otherwise>
            </c:choose>
                </td>
            </tr>
            <tr>
                <th scope="row">How did you hear about us?</th>
                <td><c:out value="${user.heardFrom}"/></td>
            </tr>
            <tr>
                <th scope="row">Receive announcements and special offers?</th>
                <td><c:out value="${user.wantsUpdates ? 'Yes' : 'No'}"/></td>
            </tr>
            <tr>
                <th scope="row">Receive email announcements?</th>
                <td><c:out value="${user.emailOK ? 'Yes' : 'No'}"/></td>
            </tr>
            <tr>
                <th scope="row">Preferred contact method:</th>
                <td><c:out value="${user.contactMethod}"/></td>
            </tr>
        </tbody>
    </table>

<p>To enter another email address, click on the Back 
    button in your browser or the Return button shown 
    below.</p>

    <form action="emailList" method="get">
        <input type="hidden" name="action" value="join">
        <input type="submit" value="Return">
    </form>

</body>
</html>
