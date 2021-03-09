<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.javalec.web.sample.model.CardVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/9db93bd103.js"
	crossorigin="anonymous"></script>
<!-- 부트스트랩 END -->
<link href="<c:url value="/resources/css/create_style.css" />"
	rel="stylesheet">
</head>
<body>
<c:choose>
		<c:when test="${empty selectSet }">
		<div class="set_list text-center">
		<h4>나의 학습세트</h4>
		데이터가 없습니다.
		</div>
		</c:when>
		<c:when test="${!empty selectSet}">
		<div class="set_list text-center">
		<h4>나의 학습세트</h4>
		<div class="container set_list">
		<div class="row" style="margin:0 auto;">
			<c:forEach var="list" items="${selectSet}">
			<div class="col-6 col-md-4 text-center book">
				<div class="book_title">
					<a href="${pageContext.request.contextPath}/card/showCard?list_name=<c:out value="${list.list_name}"/>&uid=<c:out value="${sessionScope.userId}"/>&page=1&range=1">
					<c:out value="${list.list_name}" />
					</a>	
				</div>
				<img class="book_img"
				src="${pageContext.request.contextPath}/resources/img/book.png"
				alt="First slide" style="width: 60%; margin: 0 auto; 
				-webkit-filter: opacity(.5) drop-shadow(0 0 0 gray);
				filter:opacity(.5) drop-shadow(0 0 0 gray);">
				<div class="book_explain">
					<c:out value="${list.list_explain}" />
				</div>
			</div>
		</c:forEach>
		</div>
		</div>
		</div>
		</c:when>
	</c:choose>
</body>
</html>