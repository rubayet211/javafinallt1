<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Update Student</title>
</head>
<body>

<h2>Update Student</h2>

<form:form method="post" action="${pageContext.request.contextPath}/students/${student.id}/edit" modelAttribute="student">

    <label for="id">ID:</label>
    <form:input path="id" type="number" readonly="true" />

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
     <form:checkbox path="quota" value="Scholarship" /> Scholarship
     <form:checkbox path="quota" value="Aid" /> Aid
     <form:checkbox path="quota" value="Tribal" /> Tribal
     <form:checkbox path="quota" value="N/A" checked="true" /> N/A

    <br/><br/>

    <label for="country">Country:</label>
    <form:select path="country" required="true">
       <form:option value="Bangladesh" label="Bangladesh" />
           <form:option value="India" label="India" />
           <form:option value="Pakistan" label="Pakistan" />
           <form:option value="USA" label="USA" />
           <form:option value="Canada" label="Canada" />
           <form:option value="Australia" label="Australia" />
           <form:option value="Japan" label="Japan" />
           <form:option value="Korea" label="Korea" />
           <form:option value="Palestine" label="Palestine" />
    </form:select>

    <br/><br/>

    <input type="submit" value="Update Student" />
</form:form>

</body>
</html>
