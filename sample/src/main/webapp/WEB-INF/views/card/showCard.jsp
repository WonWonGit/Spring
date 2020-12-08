<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.javalec.web.sample.model.CardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.carousel').carousel('pause');
	});

	$(document).ready(function() {
		$('.carousel').find('.item').first().addClass('active');
	});

	function show(card_num) {

		if ($("div[id$=" + card_num + "]").css("display") == "none") {
			$("div[id^=" + card_num + "]").hide();
			$("div[id$=" + card_num + "]").show();
		} else {
			$("div[id^=" + card_num + "]").show();
			$("div[id$=" + card_num + "]").hide();
		}

	}
</script>
<style>
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="list_name" style="padding-top: 10%; padding-bottom: 5%;">
		<div class=" text-center" style="margin-bottom: 10%; color: #008B8B;">
			<h3>
				<c:out value="${param.list_name}" />
			</h3>
		</div>
		<!-- 카드 뒤집기 -->
		<div id="carouselExampleFade" class="carousel slide carousel-fade"
			data-ride="carousel">
			<div class="carousel-inner text-center"
				style="width: 50%; position: relative; margin: 0 auto;">
				<c:choose>
					<c:when test="${empty cardList }">
					데이터가 없습니다.
				</c:when>
					<c:when test="${!empty cardList}">
						<c:forEach var="list" items="${cardList}">
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

		<!-- 카드 뒤집기 -->
		<!-- 카드 추가 -->
		<div class="col" style="margin-bottom: 3%;">
			<form:form method="get" name="form" id="form2" class="form-card"
				role="form" modelAttribute="cardVO"
				action="${pageContext.request.contextPath}/card/insertCard">
				<div class="form-group text-left">
					<label for="formGroupExampleInput2">단어</label>
					<form:input path="word" class="form-control" id="word"
						placeholder="단어" />
				</div>
				<div class="form-group text-left">
					<label for="formGroupExampleInput3">뜻</label>
					<form:textarea path="meaning" class="form-control" id="meaning"
						placeholder="뜻(350글자)" />
				</div>
				<div class="form-group">
					<form:input path="list_name" type="hidden" class="form-control"
						id="list_name" value="${param.list_name}" />
				</div>
				<div class="form-group">
					<form:input path="uid" type="hidden" class="form-control" id="uid"
						value="${sessionScope.userId}" />
				</div>
				<div class="text-right">
					<button type="submit" class="btn btn-secondary" id="submit"
						form="form2">추가하기</button>
				</div>
			</form:form>
		</div>
	</div>
	<!-- 카드 추가 -->
	<!-- 수정 또는 삭제기능 -->
	<div class="card-table bg-light col" style="padding-top: 5%;">
		<div class="w-75" style="margin: 0 auto; margin-bottom: 5%;">
			<h3>이 세트의 단어(${cnt})</h3>
		</div>
		<!-- 카드 네비바 -->
		<div class="w-75" style="margin: 0 auto;">
			<ul class="nav nav-pills mb-3 justify-content-end" id="pills-tab" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab"
				aria-controls="pills-home" aria-selected="true">전체보기</a></li>
			<li class="nav-item"><a class="nav-link" id="pills-profile-tab"
				data-toggle="pill" href="#pills-profile" role="tab"
				aria-controls="pills-profile" aria-selected="false">중요표시( ${impCnt} )</a></li>
			</ul>
		</div>
		<div class="tab-content" id="pills-tabContent">
			<!-- 전체보기 -->
			<div class="tab-pane fade show active" id="pills-home"
				role="tabpanel" aria-labelledby="pills-home-tab">
			<c:choose>
			<c:when test="${empty tableList }">
					데이터가 없습니다.
					</c:when>
			<c:when test="${!empty tableList}">
				<%
					String color = "gray";
				%>
				<c:forEach var="list" items="${tableList}">
					<div class="card w-75" style="margin: 0 auto; margin-bottom: 5%;">
						<div class="card-title text-right"
							style="padding-right: 2%; margin-bottom: 0;">
							<!-- 버튼 클릭시 폼태그 보이도록 -->
							<button type="button" class="btn icon icon-edit"
								onclick="show('<c:out value="${list.card_num}"/>')">
								<i class="fas fa-edit"></i>
							</button>
							<c:choose>
								<c:when test="${list.important == 'y'}">
									<!-- 버튼 클릭시 중요 표시 없애도록 y >> n-->
									<form:form method="get" name="form" id="form_n_importan_${list.card_num}"
										role="form" modelAttribute="cardVO"
										action="${pageContext.request.contextPath}/card/updateImportant"
										style="display:none;">
										<form:input path="important" type="hidden" value="n" />
										<form:input path="card_num" type="hidden"
											value="${list.card_num}" />
										<form:input path="list_name" type="hidden"
											value="${param.list_name}" />
										<form:input path="uid" type="hidden"
											value="${sessionScope.userId}" />
									</form:form>
									<button type="submit" form="form_n_importan_${list.card_num}"
										class="btn icon icon-stary">
										<i class="fas fa-star"></i>
									</button>
								</c:when>
								<c:when test="${list.important == 'n'}">
									<!-- 버튼 클릭시 중요 표시 n >> y -->
									<form:form method="get" name="form" id="form_y_importan_${list.card_num}"
										role="form" modelAttribute="cardVO"
										action="${pageContext.request.contextPath}/card/updateImportant"
										style="display:none;">
										<form:input path="important" type="hidden" value="y" />
										<form:input path="card_num" type="hidden"
											value="${list.card_num}" />
										<form:input path="list_name" type="hidden"
											value="${param.list_name}" />
										<form:input path="uid" type="hidden"
											value="${sessionScope.userId}" />
									</form:form>
									<button type="submit" form="form_y_importan_${list.card_num}"
										class="btn icon icon-starn">
										<i class="fas fa-star"></i>
									</button>
								</c:when>
							</c:choose>
							<!-- 지우기 버튼 -->
							<form:form method="get" name="form" id="${list.card_num}"
										role="form" modelAttribute="cardVO"
										action="${pageContext.request.contextPath}/card/deleteCard"
										style="display:none;">
							<form:input path="card_num" 
											value="${list.card_num}" />
							<form:input path="list_name" type="hidden"
											value="${param.list_name}" />				
							<form:input path="uid"
											value="${sessionScope.userId}" />											
							</form:form>
							<button type="submit" form="${list.card_num}" class="btn icon icon-bin">
								<i class="fas fa-trash-alt"></i>
							</button>
						</div>
						<div class="card-body row"
							id="<c:out value="${list.card_num}_card" />">
							<div class="col-4 text-center"
								style="border-right: 1px solid #ccc;">
								<c:out value="${list.word}" />
							</div>
							<div class="col-8">
								<c:out value="${list.meaning}" />
							</div>
						</div>
						<!-- 단어 및 뜻 수정 -->
						<div class="col" id="<c:out value="form_${list.card_num}"/>"
							style="display: none;">
							<form:form method="get" name="form" role="form"
								modelAttribute="cardVO"
								action="${pageContext.request.contextPath}/card/updateCard">
								<div class="form-row">
									<div class="col-md-4">
										<form:input path="word" class="form-control"
											value="${list.word}" />
									</div>
									<div class="col-md-8">
										<form:input path="meaning" class="form-control"
											value="${list.meaning }"></form:input>
									</div>
									<form:input path="list_name" type="hidden"
										value="${param.list_name}" />
									<form:input path="card_num" type="hidden"
										value="${list.card_num}" />
									<form:input path="uid" type="hidden"
										value="${sessionScope.userId}" />
								</div>
								<div class="col text-right">
									<button type="submit" class="btn btn-sm btn-light">수정하기</button>
								</div>
							</form:form>
						</div>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>
		<!-- pagination{s} -->
		<div id="paginationBox" class="text-center">
			<ul class="pagination justify-content-center">
				<c:if test="${pagination.prev}">
					<c:set var="page"
						value="${((pagination.range-2)*pagination.rangeSize)+1} " />
					<c:set var="range" value="${pagination.range -1 }" />
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath}/card/showCard?list_name=<c:out value="${param.list_name}"/>&page=<c:out value="${page}"/>&range=<c:out value="${range}"/>">
							Previous</a></li>

				</c:if>
				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="idx">
					<li
						class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
						class="page-link"
						href="${pageContext.request.contextPath}/card/showCard?list_name=<c:out value="${param.list_name}"/>&page=<c:out value="${idx}"/>&range=<c:out value="${pagination.range}"/>">
							${idx} </a></li>
				</c:forEach>
				<c:if test="${pagination.next==true}">
					<fmt:parseNumber var="page" integerOnly="true"
						value="${(pagination.range*pagination.rangeSize)+1}" />
					<fmt:parseNumber var="range" integerOnly="true"
						value="${pagination.range+1}" />
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath}/card/showCard?list_name=<c:out value="${param.list_name}"/>&page=<c:out value="${page}"/>&range=<c:out value="${pagination.range}"/>">
							Next</a></li>
					<!-- list_name 오류 해결 하기 ok -->
				</c:if>
			</ul>
		</div>
		<!-- pagination{e} -->
		</div>
		<!-- 별표보기 -->	
		<div class="tab-pane fade" id="pills-profile" role="tabpanel"
				aria-labelledby="pills-profile-tab">
			<c:choose>
			<c:when test="${empty tableList }">
					데이터가 없습니다.
					</c:when>
			<c:when test="${!empty tableList}">
				<%
					String color = "gray";
				%>
				<c:forEach var="list" items="${importantList}">
					<div class="card w-75" style="margin: 0 auto; margin-bottom: 5%;">
						<div class="card-title text-right"
							style="padding-right: 2%; margin-bottom: 0;">
							<!-- 버튼 클릭시 폼태그 보이도록 -->
							<button type="button" class="btn icon icon-edit"
								onclick="show('<c:out value="${list.card_num}"/>')">
								<i class="fas fa-edit"></i>
							</button>
							<c:choose>
								<c:when test="${list.important == 'y'}">
									<!-- 버튼 클릭시 중요 표시 없애도록 y >> n-->
									<form:form method="get" name="form" id="form_n_importan_${list.card_num}"
										role="form" modelAttribute="cardVO"
										action="${pageContext.request.contextPath}/card/updateImportant"
										style="display:none;">
										<form:input path="important" type="hidden" value="n" />
										<form:input path="card_num" type="hidden"
											value="${list.card_num}" />
										<form:input path="list_name" type="hidden"
											value="${param.list_name}" />
										<form:input path="uid" type="hidden"
											value="${sessionScope.userId}" />
									</form:form>
									<button type="submit" form="form_n_importan_${list.card_num}"
										class="btn icon icon-stary">
										<i class="fas fa-star"></i>
									</button>
								</c:when>
								<c:when test="${list.important == 'n'}">
									<!-- 버튼 클릭시 중요 표시 n >> y -->
									<form:form method="get" name="form" id="form_y_important_${list.card_num}"
										role="form" modelAttribute="cardVO"
										action="${pageContext.request.contextPath}/card/updateImportant"
										style="display:none;">
										<form:input path="important" type="hidden" value="y" />
										<form:input path="card_num" type="hidden"
											value="${list.card_num}" />
										<form:input path="list_name" type="hidden"
											value="${param.list_name}" />
										<form:input path="uid" type="hidden"
											value="${sessionScope.userId}" />
									</form:form>
									<button type="submit" form="form_y_important_${list.card_num}"
										class="btn icon icon-starn">
										<i class="fas fa-star"></i>
									</button>
								</c:when>
							</c:choose>
							<!-- 삭제 -->
							<form:form method="get" name="form" id="${list.card_num}"
										role="form" modelAttribute="cardVO"
										action="${pageContext.request.contextPath}/card/deleteCard"
										style="display:none;">
							<form:input path="card_num" 
											value="${list.card_num}" />
							<form:input path="uid"
											value="${sessionScope.userId}" />
							<form:input path="list_name" type="hidden"
											value="${param.list_name}" />											
							</form:form>
							<button type="submit" form="${list.card_num}" class="btn icon icon-bin">
								<i class="fas fa-trash-alt"></i>
							</button>
						</div>
						<div class="card-body row"
							id="<c:out value="${list.card_num}_card" />">
							<div class="col-4 text-center"
								style="border-right: 1px solid #ccc;">
								<c:out value="${list.word}" />
							</div>
							<div class="col-8">
								<c:out value="${list.meaning}" />
							</div>
						</div>
						<!-- 단어 및 뜻 수정 -->
						<div class="col" id="<c:out value="form_${list.card_num}"/>"
							style="display: none;">
							<form:form method="get" name="form" role="form"
								modelAttribute="cardVO"
								action="${pageContext.request.contextPath}/card/updateCard">
								<div class="form-row">
									<div class="col-md-4">
										<form:input path="word" class="form-control"
											value="${list.word}" />
									</div>
									<div class="col-md-8">
										<form:input path="meaning" class="form-control"
											value="${list.meaning }"></form:input>
									</div>
									<form:input path="list_name" type="hidden"
										value="${param.list_name}" />
									<form:input path="card_num" type="hidden"
										value="${list.card_num}" />
									<form:input path="uid" type="hidden"
										value="${sessionScope.userId}" />
								</div>
								<div class="col text-right">
									<button type="submit" class="btn btn-sm btn-light">수정하기</button>
								</div>
							</form:form>
						</div>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>
		<!-- pagination{s} -->
		<div id="paginationBox" class="text-center">
			<ul class="pagination justify-content-center">
				<c:if test="${importantPagination.prev}">
					<c:set var="page"
						value="${((importantPagination.range-2)*importantPagination.rangeSize)+1} " />
					<c:set var="range" value="${importantPagination.range -1 }" />
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath}/card/showCard?list_name=<c:out value="${param.list_name}"/>&ipage=<c:out value="${page}"/>&irange=<c:out value="${range}"/>">
							Previous</a></li>

				</c:if>
				<c:forEach begin="${importantPagination.startPage}"
					end="${importantPagination.endPage}" var="idx">
					<li
						class="page-item <c:out value="${importantPagination.page == idx ? 'active' : ''}"/> "><a
						class="page-link"
						href="${pageContext.request.contextPath}/card/showCard?list_name=<c:out value="${param.list_name}"/>&ipage=<c:out value="${idx}"/>&irange=<c:out value="${importantPagination.range}"/>">
							${idx} </a></li>
				</c:forEach>
				<c:if test="${importantPagination.next==true}">
					<fmt:parseNumber var="page" integerOnly="true"
						value="${(importantPagination.range*pagination.rangeSize)+1}" />
					<fmt:parseNumber var="range" integerOnly="true"
						value="${importantPagination.range+1}" />
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath}/card/showCard?list_name=<c:out value="${param.list_name}"/>&ipage=<c:out value="${page}"/>&irange=<c:out value="${importantPagination.range}"/>">
							Next</a></li>
					<!-- list_name 오류 해결 하기 ok -->
				</c:if>
			</ul>
		</div>
		<!-- pagination{e} -->	
		</div>	
		</div>
		</div>
		
		
</body>
</html>