<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table>
		<tr>
			<td>단어</td>
			<td>뜻</td>
			<td>중요</td>
		</tr>
		<c:choose>
			<c:when test="${empty member }">
				<tr>
					<td colspan="5" align="center">데이터가 없습니다.</td>
				</tr>
			</c:when>

			<c:when test="${!empty member}">
				<c:forEach var="list" items="${member}">
					<tr>
						<td><c:out value="${list.uid}" /></td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<form:form method="post" name="form" id="form" class="form-card" 
			role="form" modelAttribute="cardVO"
			action="${pageContext.request.contextPath}/card/insertCard">
				<div class="form-group">
					<label for="formGroupExampleInput2">단어</label> <form:input path="word"
						class="form-control" id="word" placeholder="단어"/>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput3">뜻</label> <form:textarea path="meaning"
					 class="form-control" id="meaning"
						placeholder="뜻(350글자)"/>
				</div>
				<div class="form-group">
					<form:input path="list_name" type="hidden"
						class="form-control" id="list_name" value="fff"/>
				</div>
				<div class="form-group">
					<form:input path="uid" type="hidden"
						class="form-control" id="uid" value="ddd"/>
				</div>
				<br>
				<button type="submit" class="btn btn-primary" id="submit" form="form">추가하기</button>
		</form:form>
</body>
</html>