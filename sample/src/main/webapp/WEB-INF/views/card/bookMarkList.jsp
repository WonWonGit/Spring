<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script type="text/javascript">
function cardMouseOver(card_class){
	if (document.getElementById(card_class).classList.contains("bg-light") == true){
		document.getElementById(card_class).classList.remove("bg-light");
		document.getElementById(card_class).classList.add("bg-info");
		document.getElementById(card_class).classList.remove("text-dark");
		document.getElementById(card_class).classList.add("text-white");
		
		
		
	} 
}
function cardMouseOut(card_class){
	if (document.getElementById(card_class).classList.contains("bg-info") == true){
		document.getElementById(card_class).classList.remove("bg-info");
		document.getElementById(card_class).classList.add("bg-light");
		document.getElementById(card_class).classList.remove("text-white");
		document.getElementById(card_class).classList.add("text-dark");
	} 
}
function link(bookMarkNum){
	var bookMarkSplit = bookMarkNum.split(",");
	var uid = bookMarkSplit[0];
	var list_name = bookMarkSplit[1];
	
	location.href='${pageContext.request.contextPath}/card/showCard?list_name='+list_name+'&uid='+uid;
}
</script>
<body>
	<jsp:include page="../main/header.jsp" />
	<div class="container text-center"
		style="font-size: 2em; font-weight: 500; color: #008B8B;">
		<c:out value="${sessionScope.userId}" />
		님의 북마크 목록
	</div>
	<div class="container">
		<c:choose>
			<c:when test="${empty bookMarkList }">
					데이터가 없습니다.
			</c:when>
			<c:when test="${!empty bookMarkList}">
				<c:forEach var="list" items="${bookMarkList}">
					<div class="card bg-light" id="${ list.no }" onmouseover="cardMouseOver(${ list.no })" onmouseout="cardMouseOut(${ list.no })" onClick="link('<c:out value="${list.bookmark}"/>')" style=" margin:0 auto; margin-top:5%; cursor:pointer;">
						<div class="card-header">
						<c:set var="bookmark" value="${fn:split(list.bookmark,',')}" />
						<c:forEach var="bookMarkNum" items="${ bookmark}" varStatus="b">
							<c:if test="${b.count==1}">${bookMarkNum}님의</c:if>
							<c:if test="${b.count==2}">${bookMarkNum}셋트</c:if>
						</c:forEach>
						</div>
						<div class="card-body">
							<h5 class="card-title"><c:out value="${list.list_explain}" /></h5>
						</div>
					</div>
					<div class="col text-right" style="padding-top:3%;">
						<form:form method="get" name="form" id="${list.no }" class="form-card"
							role="form" modelAttribute="cardVO"
							action="${pageContext.request.contextPath}/card/deleteBookMark">
								<form:input path="no" value="${list.no }" style="display:none;"/>
								<button type="submit" class="btn btn-outline-dark">북마크 삭제</button>
						</form:form>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>
	




</body>
</html>