<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/css?family=Pacifico);

.logo {
	font-family: 'Pacifico', cursive;
}
</style>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand logo" href="${pageContext.request.contextPath}/card/card" style="color: white;">HighLighter<i
			class="fas fa-highlighter" style="color: white;"></i></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<c:choose>
					<c:when test="${sessionScope.userId == null}">
						<li class="nav-item"><a class="nav-link" 
						href="<c:url value='/card/signup'/>">Login/Register</a></li>
					</c:when>
					<c:when test="${sessionScope.userId != null}">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/card/logout">Logout</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/card/getUserInfo">Account</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> My Card </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="${pageContext.request.contextPath}/card/showAll">전체보기</a> 
								<form:form method="post" name="form" id="form" 
								role="form" modelAttribute="cardVO"
								action="${pageContext.request.contextPath}/card/createNewTable">
								<form:input path="uid" type="hidden" class="form-control" id="uid"	
								value="${sessionScope.userId}" />
								<button type="submit" class="btn dropdown-item" style="background-color:white; color:black;">카드만들기</button>
								</form:form>
								 <a
									class="dropdown-item" href="${pageContext.request.contextPath}/card/bookMarkList">북마크 리스트 보기</a>
							</div></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
	</nav>
</body>
</html>