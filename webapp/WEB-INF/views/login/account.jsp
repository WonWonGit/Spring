<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.javalec.web.sample.model.CardVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script>

	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#pwd").val();
			var pwd2 = $("#pwd2").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});
	
	function check(){
		var form=document.form;
		if(form.name.value==""||form.uid.value==""||form.password.value==""){
			alert("필수값을 입력해주세요")
			$("#submit").attr("disabled", "disabled");
		}else{
			$("#submit").removeAttr("disabled");
			form.submit.focus();
		}
	}
</script>
<style>
html{ margin:0; padding:0; width:100%; height:100% }
.accout_info{
	position:relative;
	margin:0 auto;
	width:50%;
	margin-top:5%;
	border:1px solid gray;
	border-radius:3%;
	padding:5%;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
	<c:choose>
		<c:when test="${!empty userInfo}">
			<c:forEach var="list" items="${userInfo}">
				
			</c:forEach>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${!empty userInfo}">
			<c:forEach var="list" items="${userInfo}">
				<form:form method="GET" name="form" id="form" role="form" class="mb-3 accout_info"
					modelAttribute="UserVO"
					action="${pageContext.request.contextPath}/card/updateUser">
					<div class="form-group text-left">
						<label for="formGroupExampleInput2">아이디</label>
						<form:input path="uid" class="form-control" id="uid"
							value="${list.uid}" readonly="true" />
					</div>
					<div class="form-group text-left">
						<label for="formGroupExampleInput2">비밀번호</label>
						<form:input path="pwd" class="form-control" id="pwd" type="password" 
							placeholder="password" />
					</div>
					<div class="form-group text-left">
						<label for="formGroupExampleInput2">비밀번호 확인</label>
						<form:input path="" class="form-control" id="pwd2" type="password" 
							placeholder="password" />
					</div>
					<div class="alert alert-success" id="alert-success" role="alert">A
						simple success alert—check it out!</div>
					<div class="alert alert-danger" id="alert-danger" role="alert">A
						simple danger alert—check it out!</div>
					<div class="form-group text-left">
						<label for="formGroupExampleInput2">이메일</label>
						<form:input path="email" class="form-control" id="email"
							value="${list.email}" />
					</div>
					<div class="form-group text-left">
						<label for="formGroupExampleInput2">관심분야</label>
						<form:input path="part" class="form-control" id="part"
							value="${list.part}" />
					</div>
					<button type="submit" class="btn btn-sm btn-light">수정하기</button>
				</form:form>
			</c:forEach>
		</c:when>
	</c:choose>
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
</body>
</html>