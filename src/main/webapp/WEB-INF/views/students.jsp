<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>All Students</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }

        h2 {
            color: #333;
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

        .delete {
            text-decoration: none;
            color: red;
            font-weight: bold;
            padding: 5px 7px;
            border: 2px solid red;
            transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
        }

        .delete:hover {
            background-color: red;
            color: #fff;
        }

        .view {
            text-decoration: none;
            color: #1E90FF;
            font-weight: bold;
            padding: 5px 7px;
            border: 2px solid #1E90FF;
            transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
        }

        .view:hover {
            background-color: #1E90FF;
            color: #fff;
        }

        .edit {
                    text-decoration: none;
                    color: #4CAF50;
                    font-weight: bold;
                    padding: 5px 7px;
                    border: 2px solid #4CAF50;
                    transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
                }

       .edit:hover {
          background-color: #4CAF50;
          color: #fff;
       }

        table {
            border-collapse: collapse;
            width: 70%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>

<h2>All Students</h2>

<c:if test="${not empty students}">
    <table border="1">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Date of Birth</th>
            <th>Gender</th>
            <th>Quota</th>
            <th>Country</th>
            <th>Edit</th>
            <th>Delete</th>
            <th>View</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="student" items="${students}">
            <tr>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.email}</td>
                <td>${student.dateOfBirth}</td>
                <td>${student.gender}</td>
                <td>${student.quota}</td>
                <td>${student.country}</td>
                <td><a href="${pageContext.request.contextPath}/students/${student.id}" class="view">View</a></td>
                <td><a href="${pageContext.request.contextPath}/students/${student.id}/edit" class="edit">Edit</a></td>
                <td><a href="${pageContext.request.contextPath}/students/${student.id}/delete" class="delete">Delete</a></td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
<br><br>
<a href="${pageContext.request.contextPath}">Home</a>

</body>
</html>
