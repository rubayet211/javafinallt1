<%@ page isELIgnored="false" %>
<html>
<head>
<style>
/* styles.css */

body {
    font-family: 'Arial', sans-serif;
    background-color: #f7f7f7;
    color: #333;
    margin: 0;
    padding: 20px;
    text-align: center;
}

h2 {
    color: #4285f4;
}

hr {
    border: 1px solid #ccc;
    margin: 20px 0;
}

a {
    text-decoration: none;
    display: inline-block;
    padding: 10px 20px;
    margin: 10px;
    background-color: #4285f4;
    color: #fff;
    border-radius: 5px;
    transition: background-color 0.3s ease-in-out;
}

a:hover {
    background-color: #357ae8;
}

</style>
</head>
<body>
<h2>Hello Students!</h2>

<hr>

<a href="${pageContext.request.contextPath}/create">Add Student</a>
<a href="${pageContext.request.contextPath}/students">Show Students</a>

</body>
</html>
