<%@ page contentType="text/html" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
<style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    color: #333;
    margin: 0;
    padding: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
}

h3 {
    text-align: center;
    color: #4285f4;
    margin-bottom: 20px;
}

form {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 400px;
    margin-top: 20px;
}

label {
    display: block;
    margin-bottom: 8px;
    color: #555;
}

input[type="text"],
input[type="date"],
input[type="email"],
select {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="radio"] {
    display: inline-block;
    margin-right: 5px;
}

div.checkbox-group {
    margin-bottom: 15px;
}

input[type="submit"] {
    text-decoration: none;
    display: inline-block;
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
}

input[type="submit"]:hover {
    background-color: #4285f4;
    color: #fff;
}

a {
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
            border: 2px solid #4CAF50;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
        }

        a:hover {
            background-color: #4CAF50;
            color: #fff;
        }
</style>
</head>
<body>

    <form:form method="post" action="store" modelAttribute="student">
    <h3>Registration Page</h3>
        <label>Id</label>
        <form:input path="id" id="id"/>

        <label>Full Name</label>
        <form:input path="name" id="name"/>
        <form:errors path="name"/>

        <br><br>

        <label>Date Of Birth</label>
        <form:input type="date" path="dateOfBirth" id="dateOfBirth"/>
        <form:errors path="dateOfBirth"/>

        <br><br>

        <label>Email</label>
        <form:input path="email" id="email"/>
        <form:errors path="email"/>

        <br><br>

        <label>Gender</label><br>
        <form:radiobutton path="gender" value="MALE" label="Male"/>
        <form:radiobutton path="gender" value="FEMALE" label="Female"/>
        <form:errors path="gender"/>

        <br>

        <label for="quota">Quota:</label>
            <div>
                <form:checkbox path="quota" value="Scholarship" /> Scholarship
                <form:checkbox path="quota" value="Aid" /> Aid
                <form:checkbox path="quota" value="Tribal" /> Tribal
                <form:checkbox path="quota" value="N/A" checked="true" /> N/A
            </div>
          <br>

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

        <br><br>

        <input type="submit" value="Register" />
        <br><br><br><br>
    <a href="${pageContext.request.contextPath}">Home</a>
    </form:form>


</body>
</html>
