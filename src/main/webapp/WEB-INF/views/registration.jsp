<%@ page contentType="text/html" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head></head>
<body>
<h3>Registration Page</h3>

<form:form method="post" action="fifth" modelAttribute="user">

<label>Full Name</label>
<form:input path="fullname" id="fullname"/>
<form:errors path="fullname"/>

<br><br>

<label>Email</label>
<form:input path="email" id="email"/>
<form:errors path="email"/>

<br><br>

<label>Password</label>
<form:input path="password" id="password"/>
<form:errors path="password"/>

<br><br>

<input type="submit" value="Register" />

</form:form>

</body>
</html>