<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%--
  Created by IntelliJ IDEA.
  User: Katay
  Date: 20.07.2019
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <style>
        <%@include file="../../../resources/index.css"%>
    </style>
    <title>Excursion</title>
    <link rel="stylesheet" href="../../../resources/index.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../menu.jsp"/>

<a href="/excursion/add" class="btn btn-primary" style="float: right; margin-top: 5px; margin-right: 5px">Add new
    excursion</a> <br><br>

<a href="/excursion/byPeriodForm" class="btn btn-primary" style="float: right; margin-top: 5px; margin-right: 5px">Find
    by period</a>

<div class="w3-container w3-content w3-center w3-padding-64 w3-card-8"
     style="max-width: 800px; margin: 30px">
    <h2 class="w3-wide">Excursions in given time period:</h2>
    <c:choose>
        <c:when test="${not empty excursions}">
            <button type="button" id="openModal" class="btn btn-primary">Show statistic</button>
            <div id="modal">
                <h5>Count of excursions in given period: ${excursionsStatistic}</h5>
            </div>

            <div class="list-group">
                <div class="col-6">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Begin</th>
                            <th scope="col">End</th>
                            <th scope="col">Price, UAH</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${excursions}" var="item">
                            <tr>
                                <th scope="row">${item.id}</th>
                                <td>${item.begin.format(DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm"))}</td>
                                <td>${item.end.format(DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm"))}</td>
                                <td>${item.price}</td>
                                <td>
                                    <form action="/excursion/delete" style="margin-block-end: 0em;" method="post">
                                        <input type="hidden" name="id" value="${item.id}">
                                        <input type="submit" class="btn btn-outline-danger" value="Delete"/>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <h3 class="w3-wide">not found!</h3>
        </c:otherwise>
    </c:choose>
</div>
<script>
    getInfoAboutCount();

    function getInfoAboutCount() {

        var modal = document.getElementById("modal");

        var btn = document.getElementById("openModal");

        btn.onclick = function () {
            $(modal).slideToggle();
            modal.style.display = "block";
        };
    }
</script>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</html>
