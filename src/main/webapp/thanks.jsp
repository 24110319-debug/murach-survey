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

    <dl class="survey-results">
        <dt>Email:</dt>
        <dd><c:out value="${user.email}"/></dd>
        <dt>First Name:</dt>
        <dd><c:out value="${user.firstName}"/></dd>
        <dt>Last Name:</dt>
        <dd><c:out value="${user.lastName}"/></dd>
        <dt>Date of Birth:</dt>
        <dd>
            <c:choose>
                <c:when test="${not empty user.formattedDateOfBirth}">
                    <c:out value="${user.formattedDateOfBirth}"/>
                </c:when>
                <c:otherwise>Not provided</c:otherwise>
            </c:choose>
        </dd>
        <dt>How did you hear about us?</dt>
        <dd><c:out value="${user.heardFrom}"/></dd>
        <dt>Receive announcements and special offers?</dt>
        <dd><c:out value="${user.wantsUpdates ? 'Yes' : 'No'}"/></dd>
        <dt>Receive email announcements?</dt>
        <dd><c:out value="${user.emailOK ? 'Yes' : 'No'}"/></dd>
        <dt>Preferred contact method:</dt>
        <dd><c:out value="${user.contactMethod}"/></dd>
    </dl>

<p>To enter another email address, click on the Back 
    button in your browser or the Return button shown 
    below.</p>

    <form action="emailList" method="get">
        <input type="hidden" name="action" value="join">
        <input type="submit" value="Return">
    </form>

</body>
</html>
