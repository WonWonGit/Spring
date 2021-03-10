<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.javalec.web.sample.model.CardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
</head>
<body>
	<div class="container">
		<c:choose>
			<c:when test="${empty bookMarkList}">
			</c:when>
			<c:when test="${!empty bookMarkList}">
			<c:forEach var="bookmark" items="${bookMarkList}" >
				<c:set var="bm" value="${fn:split(bookmark.bookmark,',')}" />
				<c:forEach var="bookMarkNum" items="${bm}" varStatus="b">
					<c:if test="${b.count==1}">${bookMarkNum}님의</c:if>
					<c:if test="${b.count==2}">${bookMarkNum}셋트</c:if>
				</c:forEach>
			</c:forEach>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${empty selectSet}">
			</c:when>
			<c:when test="${!empty selectSet}">
				<c:forEach var="selectSet" items="${selectSet}">
					<c:out value="${selectSet.list_name}"></c:out>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>
</body>
</html>