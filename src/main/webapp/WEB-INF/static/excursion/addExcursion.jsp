<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Katay
  Date: 29.07.2019
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Excursion</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        <%@include file="../../../resources/index.css"%>
    </style>
    <title>Title</title>
</head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-4"></div>
        <form action="/excursion/save" method="post" class="excursionForm col-4">
            <input type="text" name="description" class="form-control" placeholder="Description"
                   style="margin: 6% 0" aria-label="Description" aria-describedby="basic-addon2" required pattern="[a-zA-Z0-9 ]{6,30}">
            <label for="startTime">Start:</label>
            <input id="startTime" type="datetime-local" name="begin" class="form-control" aria-label="Begin" aria-describedby="basic-addon2" required><br>
            <label for="endTime">End:</label>
            <input id="endTime" type="datetime-local" name="end" class="form-control" aria-label="End" aria-describedby="basic-addon2" required><br>
            <label for="price">Price</label>
            <input type="number" value="100" min="0" step="0.1"
                   data-number-to-fixed="2" aria-describedby="basic-addon2" data-number-stepfactor="100" id="price"
                   name="price" aria-label="Price" class="form-control" required/>
            <select name="workerId" required class="custom-select" style="margin-top: 10%">
                <option selected value="0">Select worker</option>
                <c:forEach var="worker" items="${workers}">
                    <option value="${worker.id}">${worker.firstName} ${worker.secondName}</option>
                </c:forEach>
            </select>
            <br><br>
            <input type="submit" class="btn btn-primary" value="Save"/>
        </form>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</html>
