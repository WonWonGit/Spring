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
<link href="<c:url value="/resources/css/index_style.css" />" rel="stylesheet">
</head>
<script>
function visit(bid){
	var url = "${pageContext.request.contextPath}/card/userCardList";
	url = url + "?uid="+uid;
	location.href = url;
}

function start(){
		alert('로그인 후 이용부탁드립니다.');
		window.location.href="signup";
}


</script>
<style> 
</style>
<body>
	<jsp:include page="header.jsp" />
	<c:if test="${sessionScope.userId != null}">
	<c:out value="${sessionScope.userId}"/>님 환영합니다!
</c:if>
<div id="carouselExampleControls" class="carousel slide main-slide" data-ride="carousel" >
  <div class="carousel-inner container" style="">
    <div class="carousel-item active">
    <div class="row">
    		<div class="col">
    		<img class="d-block" src="${pageContext.request.contextPath}/resources/img/mental.png" alt="First slide"
      		style="width:40%; margin:0 auto;">
      		</div>
    		<div class="col sub">
    		<h3>안녕하세요</h3>
			지금부터 <span>HighLighter</span>를 통해<br> 공부를 시작해 보세요!<br> 분명,
			공부가 즐거워 질 것입니다.
			</div>
	</div>				
    </div>
    <div class="carousel-item">
    <div class="row">
    		<div class="col">
    		<img class="d-block" src="${pageContext.request.contextPath}/resources/img/icon_book.png" alt="First slide"
      		style="width:40%; margin:0 auto;">
      		</div>
    		<div class="col sub">
    		<h3>이런분들께 추천드립니다,</h3>
			장시간 <span>집중력</span>이 떨어지시는 분<br> 
			<span>암기과목</span>에 어려움을 느끼시는 분<br>
			지하철, 버스 등 이동수단에서 활용 해 보세요.
			</div>
	</div>				
    </div>
    <div class="carousel-item">
    <div class="row">
    		<div class="col">
    		<img class="d-block" src="${pageContext.request.contextPath}/resources/img/icon_rainbow.png" alt="First slide"
      		style="width:40%; margin:0 auto;">
      		</div>
    		<div class="col sub">
    		<br>
    		<br>
    		<h3>포기하지 마세요.</h3>
			<span>성공</span>이 눈앞으로 다가왔습니다.<br> 
			</div>
	</div>				
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	<div class="text-center">
			<h3>다른사람들의 카드를 참고 해 보세요!</h3>
	</div>
	<c:choose>
		<c:when test="${empty member }">
			<div>
				<div>데이터가 없습니다.</div>
			</div>
		</c:when>
		<c:when test="${!empty member}">
		<div class="slide sl">
		<input type="radio" name="pos" id="pos1" checked>
    	<input type="radio" name="pos" id="pos2">
    	<input type="radio" name="pos" id="pos3">
    	<input type="radio" name="pos" id="pos4">
		<ul class="card-ul">
			<c:forEach var="list" items="${member}">
			<c:choose>
			<c:when test="${list.uid==sessionScope.userId}"></c:when>
			<c:when test="${list.uid!=sessionScope.userId}">
				<li class="card col-sm continer card-li text-center" style="border-radius:10px; box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); transition: 0.3s;">
				<div class="card-body">
				 <h5 class="card-title"><c:out value="${list.uid}" /></h5>
				 <div class="card-text">
				 <ul class="part-ul">
				 <c:choose>
				 <c:when test="${empty list.part}">
				 	<li class="part-li-none btn" style="color:#666;">
   					<c:out value="등록된 관심분야가 없습니다."/> 
   					</li>
				 </c:when>
				 <c:when test="${!empty list.part}">
				 <c:forTokens items="${list.part}" delims="#" var="part">  
   					<li class="part-li btn-sm">
   					<c:out value="#${part}"/> 
   					</li>
				</c:forTokens>
				</c:when>
				</c:choose>
				</ul>
				<br>
				<a href="${pageContext.request.contextPath}/card/visit?uid=<c:out value="${list.uid }"/>" class="btn btn-outline-dark" >방문하기</a>
				</div>
				</div>
			</li>
			</c:when>
			</c:choose>			
			</c:forEach>
		</ul>
		<p class="bullet">
      	<label for="pos1">1</label>
      	<label for="pos2">2</label>
      	<label for="pos3">3</label>
      	<label for="pos4">4</label>
    	</p>
		</div>
		</c:when>
	</c:choose>
	<div class="start">
		<div class="text text-center">
			<h2>자, 그럼 시작 해 볼까요?</h2>
			<!-- javascript가 안먹혀서 c 태그로 처리.. 원인 아직 발견 못함 ㅠㅠ -->
			<c:choose>
				<c:when test="${sessionScope.userId == null}">
					<p><button type="button" class="btn btn-light" onclick="start()">시작하기</button></p>
				</c:when>
				<c:when test="${sessionScope.userId != null}">
					<div>
					<form:form method="post" name="form" id="form" 
					role="form" modelAttribute="cardVO"
					action="${pageContext.request.contextPath}/card/createNewTable">
					<form:input path="uid" type="hidden" class="form-control" id="uid"
						value="${sessionScope.userId}" />
					<p><button type="submit" class="btn btn-light">시작하기</button></p>
					</form:form>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
</body>
</html>