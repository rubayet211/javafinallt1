<%@ page contentType="text/html" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>Create Student</title>
</head>
<body>

<h2>Create Student</h2>

<form:form modelAttribute="student" method="post" action="/students/create">
    <label for="id">ID:</label>
    <form:input path="id" type="number" required="true" />

    <br/><br/>

    <label for="name">Name:</label>
    <form:input path="name" required="true" />

    <br/><br/>

    <label for="email">Email:</label>
    <form:input path="email" type="email" required="true" />

    <br/><br/>

    <label for="dateOfBirth">Date of Birth:</label>
    <form:input path="dateOfBirth" type="date" required="true" />

    <br/><br/>

    <label for="gender">Gender:</label>
    <form:select path="gender" required="true">
        <form:option value="MALE" label="Male" />
        <form:option value="FEMALE" label="Female" />
    </form:select>

    <br/><br/>

    <label for="quota">Quota:</label>
    <form:input path="quota" required="true" />

    <br/><br/>

    <label for="country">Country:</label>
    <form:input path="country" required="true" />

    <br/><br/>

    <input type="submit" value="Create Student" />
</form:form>

</body>
</html>