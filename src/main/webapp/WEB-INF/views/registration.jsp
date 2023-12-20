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

.gender-container {
    display: flex;
    margin-bottom: 15px;
}


label {
    display: block;
    color: #555;
}

input[type="radio"] {
    margin-right: 5px;
}

.error {
    color: red;
    font-size: 14px;
    margin-top: 2px;
    margin-left: 10px;

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
    background-color: #4285f4;
    color: #fff;
    transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
}

input[type="submit"]:hover {
    background-color: #4444FF;
    color: #E2DED0;
}

a {
            cursor: pointer;
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
            border: 2px solid #4CAF50;
            padding: 10px 15px;
            border-radius: 5px;
            text-align: center;
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
         <label for="gender">Gender</label>
         <br>
        <div class="gender-container">

            <input type="radio" id="male" name="gender" value="Male"/>
            <label for="male">Male</label>
            <input type="radio" id="female" name="gender" value="Female"/>
            <label for="female">Female</label>
            <div class="error">
                <form:errors path="gender"/>
            </div>
        </div>

        <br>

        <label for="quota">Quota:</label>
        <div id="quotaOptions">
            <input type="checkbox" name="quota" value="Scholarship" /> Scholarship
            <input type="checkbox" name="quota" value="Aid" /> Aid
            <input type="checkbox" name="quota" value="Tribal" /> Tribal
            <input type="checkbox" name="quota" value="N/A" checked="true" /> N/A
        </div>

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
