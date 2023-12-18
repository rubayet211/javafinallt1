<%@ page contentType="text/html" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }

        h3 {
            color: #4CAF50;
        }

        p {
            color: #333;
        }

        hr {
            border: 1px solid #ddd;
        }

        a {
            text-decoration: none;
            color: #4CAF50;
        }
    </style>
</head>
<body>

<h3>Registration Success</h3>

<p>Your registration is successful. Please visit the login page.</p>

<p>ID: ${student.id}</p>
<p>Full Name: ${student.name}</p>
<p>Email: ${student.email}</p>
<p>Date Of Birth: ${student.dateOfBirth}</p>

<hr>

<a href="${pageContext.request.contextPath}">Home</a>

</body>
</html>
