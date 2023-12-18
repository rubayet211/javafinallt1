<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Student Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }

        h2 {
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 50%;
            margin-top: 20px;
        }

        td, th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
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

<h2>Student Details</h2>

<c:if test="${not empty student}">
    <table>
        <tr>
            <td>ID:</td>
            <td>${student.id}</td>
        </tr>
        <tr>
            <td>Name:</td>
            <td>${student.name}</td>
        </tr>
        <tr>
            <td>Email:</td>
            <td>${student.email}</td>
        </tr>
        <tr>
            <td>Date of Birth:</td>
            <td>${student.dateOfBirth}</td>
        </tr>
        <tr>
            <td>Gender:</td>
            <td>${student.gender}</td>
        </tr>
        <tr>
            <td>Quota:</td>
            <td>${student.quota}</td>
        </tr>
        <tr>
            <td>Country:</td>
            <td>${student.country}</td>
        </tr>
    </table>

    <br><br><br>

    <a href="${pageContext.request.contextPath}">Home</a>
</c:if>

</body>
</html>
