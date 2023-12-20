<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Update Student</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        h2 {
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

        .gender-container {
            display: flex;
            margin-bottom: 15px;
        }

        .gender-container label {

            display: block;
            color: #555;
            margin-top: 10px;
        }


        input[type="radio"] {
            margin-right: 5px;
            margin-left: 10px;
        }

        input[type="number"],
        input[type="text"],
        input[type="email"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="checkbox"] {
            margin-right: 5px;
        }

        input[type="submit"] {
            text-decoration: none;
            display: inline-block;
            width: 100%;
            padding: 10px;
            background-color: #4285f4;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #357ae8;
        }

        a {
            font-weight: bold;
            display: inline-block;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
            margin-top: 10px;
            text-align: center;
            border: 2px solid #4CAF50;
            border-radius: 5px;
        }

        a:hover {
            background-color: #4CAF50;
            color: #fff;
        }

        .error {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body>

<h2>Update Student</h2>

<form:form method="post" action="${pageContext.request.contextPath}/students/${student.id}/edit" modelAttribute="student">

    <label for="id">ID:</label>
    <form:input path="id" type="number" readonly="true" />

    <br/><br/>

    <label for="name">Name:</label>
    <form:input path="name" required="true" />
    <form:errors path="name" cssClass="error" />

    <br/><br/>

    <label for="email">Email:</label>
    <form:input path="email" type="email" required="true" />
    <form:errors path="email" cssClass="error" />

    <br/><br/>

    <label for="dateOfBirth">Date of Birth:</label>
    <form:input path="dateOfBirth" type="date" required="true" />
    <form:errors path="dateOfBirth" cssClass="error" />

    <br/><br/>

    <div class="gender-container">
        <label>Gender:</label>

        <input type="radio" id="male" name="gender" value="Male" <c:if test="${student.gender == 'Male'}">checked</c:if> />
        <label for="male">Male</label>

        <input type="radio" id="female" name="gender" value="Female" <c:if test="${student.gender == 'Female'}">checked</c:if> />
        <label for="female">Female</label>

        <div class="error">
            <form:errors path="gender"/>
        </div>
    </div>


    <label for="quota">Quota:</label>
     <form:checkbox path="quota" value="Scholarship" /> Scholarship
     <form:checkbox path="quota" value="Aid" /> Aid
     <form:checkbox path="quota" value="Tribal" /> Tribal
     <form:checkbox path="quota" value="N/A" /> N/A

     <script>
         var checkboxes = document.querySelectorAll('input[name="quota"]');

         checkboxes.forEach(function (checkbox) {
             checkbox.addEventListener('change', function () {
                 checkboxes.forEach(function (otherCheckbox) {
                     if (otherCheckbox !== checkbox) {
                         otherCheckbox.checked = false;
                     }
                 });
             });
         });
     </script>


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

<a href="${pageContext.request.contextPath}">Home</a>

</body>
</html>