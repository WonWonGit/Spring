<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	.form-group{
		margin:0 auto;
	}
</style>
<article>
<div class="container col-md-6" role="main">
	<div class="card">
	<div class="card-header">
	<ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
		<li class="nav-item"><a class="nav-link active" id="login"
			data-toggle="tab" href="#login-form" role="tab"
			aria-controls="login-form" aria-selected="true">Login</a></li>
		<li class="nav-item"><a class="nav-link" id="signup"
			data-toggle="tab" href="#signup-form" role="tab"
			aria-controls="signup-form" aria-selected="false">Sign up</a></li>
	</ul>
	</div>
	<div class="card-body">
	<div class="tab-content" id="myTabContent">
		<!-- 로그인 폼 -->
		<div class="tab-pane fade show active" id="login-form" role="tabpanel"
			aria-labelledby="login">
			<form:form method="post" name="form" id="form" class="form-signup" 
			role="form" modelAttribute="userVO"
			action="${pageContext.request.contextPath}/card/getLogin">
				<div class="form-group">
					<i class="fas fa-portrait"></i>
					<label for="formGroupExampleInput2">ID</label> <form:input path="uid"
						class="form-control" id="uid" placeholder="id"/>
				</div>
				<br>
				<div class="form-group">
					<i class="fas fa-lock"></i>
					<label for="formGroupExampleInput3">Password</label> <form:password path="pwd"
					 class="form-control" id="pwdp"
						placeholder="password"/>
				</div>
				<br>
				<button type="submit" class="btn btn-sm btn-secondary" id="submit2">로그인</button>
			</form:form>
		</div>
		<!-- 회원가입폼 -->	
		<div class="tab-pane fade" id="signup-form" role="tabpanel"
			aria-labelledby="signup">
			
			<form:form method="post" name="form" id="form" class="form-signup" 
			role="form" modelAttribute="userVO"
			action="${pageContext.request.contextPath}/card/insertUser">
				<div class="form-group">
					<i class="fas fa-user-tag"></i>
					<label for="formGroupExampleInput">Name</label> 
					<form:input path="name" 
						class="form-control" id="name" placeholder="name"/>
				</div>
				<br>
				<div class="form-group">
					<i class="fas fa-portrait"></i>
					<label for="formGroupExampleInput2">ID</label> <form:input path="uid"
						class="form-control" id="uid" placeholder="id"/>
				</div>
				<br>
				<div class="form-group">
					<i class="fas fa-lock"></i>
					<label for="formGroupExampleInput3">Password</label> <form:password path="pwd"
					 class="form-control" id="pwd"
						placeholder="password"/>
				</div>
				<br>
				<div class="form-group">
					<i class="fas fa-check"></i>
					<label for="formGroupExampleInput3">Password Check</label> <input
						type="password" class="form-control" id="pwd2"
						placeholder="password">
				</div>
				<br>
				<div class="alert alert-success" id="alert-success" role="alert">A simple success
					alert—check it out!</div>
				<div class="alert alert-danger" id="alert-danger" role="alert">A simple danger
					alert—check it out!</div>
				<div class="form-group">
					<i class="fas fa-envelope"></i>
					<label for="formGroupExampleInput4">E-mail</label> <form:input path="email"
						 class="form-control" id="email"
						placeholder="email@XXX.XXX"/>
				</div>
				<br>
				<div class="form-group">
					<i class="fas fa-envelope"></i>
					<label for="formGroupExampleInput5"></label>subject<form:input path="part"
						 class="form-control" id="part"
						placeholder="관심분야 ex)#언어#경제#사회 (최대 5개)"/>
				</div>			
					<br>	
					<button type="submit" class="btn btn-sm btn-secondary" id="submit" onclick="check()">회원가입</button>
					<button type="button" class="btn btn-sm btn-dark" id="cancle">취소하기</button>
			</form:form>
		</div>
		</div>
	</div>
	</div>
</div>	
</article>