<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
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
<link href="<c:url value="/resources/css/showCard_style.css" />"
	rel="stylesheet">	
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$('.carousel').carousel('pause');
	});

	$(document).ready(function() {
		$('.carousel').find('.item').first().addClass('active');
	});
	function bookmark(){
		alert('로그인 후 이용부탁드립니다.');
		window.location.href="signup";
	}
</script>
<body>
	<jsp:include page="../main/header.jsp" />
	<div class="list_name" style="padding-bottom: 5%;">
		<div class=" text-center" style=" color: #008B8B; margin-top:3%;">
			<h3>
				<c:out value="${param.uid}"/>님의&nbsp;
				 <c:out value="${param.list_name}" />
			</h3>
		</div>
		<!-- 카드 뒤집기 -->
		<div id="carouselExampleFade" class="carousel slide carousel-fade"
			data-ride="carousel" >
			<div class="w-75 text-right" style="padding-top:3%;padding-bottom:3%;">
			<c:choose>
				<c:when test="${sessionScope.userId == null}">
					<button onclick="bookmark()" class="btn btn-warning">BookMark <i class="fas fa-bookmark"></i></button>
				</c:when>
				<c:when test="${sessionScope.userId != null}">
				<form:form method="get" name="form" id="form2" class="form-card"
				role="form" modelAttribute="cardVO" 
				action="${pageContext.request.contextPath}/card/bookMark">
				<form:input path="bookmark" value="${param.uid }" style="display:none;"/>
				<form:input path="bookmark" value="${param.list_name }" style="display:none;"/>
				<form:input path="uid" value="${sessionScope.userId}" style="display:none;"/>
				<button type="submit" class="btn btn-warning">BookMark <i class="fas fa-bookmark"></i></button>
			</form:form>
				</c:when>
			</c:choose>
			</div>
			<div class="carousel-inner text-center"
				style="width: 50%; position: relative; margin: 0 auto;">
				<c:choose>
					<c:when test="${empty visitCard }">
					데이터가 없습니다.
				</c:when>
					<c:when test="${!empty visitCard}">
						<c:forEach var="list" items="${visitCard}">
							<div class="card carousel-item item cardContainer bg-light"
								style="width: 100%; position: relative;">
								<div class="word">
									<c:out value="${list.word}" />
								</div>
								<div class="meaning">
									<c:out value="${list.meaning}" />
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleFade"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleFade"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<!-- 전체목록 -->
		<div class="card-table bg-light col" style="padding-top: 5%;"">
			<c:choose>
					<c:when test="${empty visitCard }">
					데이터가 없습니다.
				</c:when>
					<c:when test="${!empty visitCard}">
						<c:forEach var="list" items="${visitCard}">
						<div class="card w-75" style="position:relative; margin:0 auto; margin-bottom:5%;">
							<div class="card-body row " style="backgroud:#fff;">
								<div class="word col-4 text-center"
								style="border-right: 1px solid #ccc;">
									<c:out value="${list.word}" />
								</div>
								<div class="meaning col-8">
									<c:out value="${list.meaning}" />
								</div>		
							</div>
						</div>		
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
		</div> 
		
		
</body>
</html>