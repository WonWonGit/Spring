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
<style>
html{ margin:0; padding:0; width:100%; height:100% }
.book{
		position:relative;
		margin-bottom:10%;
	}
.book_title{
	position:absolute; top:50%; left:50%; transform:translate(-50%,-50%); width: 50%;
	z-index:999;
}
p{
	vertical-align:middle;
}
.book:hover .book_img{
	-webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.2);
    transition:.7s;
}
.book_explain{
	margin-top:5%;
}
.book_title>a{
	color:#008487;
	text-decoration:none;
}
</style>
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
function setlink(list_name){
	var setlinkSplit = list_name.split(",");
	var list_name = setlinkSplit[0];
	var uid = setlinkSplit[1];
	location.href='${pageContext.request.contextPath}/card/showCard?list_name='+list_name+'&uid='+uid+'&page=1&range=1';
}
</script>
<body>
<jsp:include page="../main/header.jsp" />
	<div class="bookMarkList" style="background:#8eb8ad; padding-bottom:10%;">
	<div class="myBookMarkList text-center" style="color:white; font-family: 'Oswald', sans-serif; padding-top:5%; font-weight:bold;">
		MY BOOKMARK LIST
	</div>
		<c:choose>
			<c:when test="${empty bookMarkList}">
			</c:when>
			<c:when test="${!empty bookMarkList}">
			<div class="container set_list">
			<div class="row" style="margin:0 auto;">
			<c:forEach var="bookmark" items="${bookMarkList}" >
				<div class="col-6 col-md-4 text-center book" onClick="link('<c:out value="${bookmark.bookmark}"/>')" style=" margin:0 auto; margin-top:5%; cursor:pointer;">
				<div class="book_title" style="color:#08415d; font-weight:bold; line-height:60%">
				<c:set var="bm" value="${fn:split(bookmark.bookmark,',')}" />
				<c:forEach var="bookMarkNum" items="${bm}" varStatus="b">
				<!-- 온클릭 옵션 넣기 -->
					<c:if test="${b.count==1}">${bookMarkNum}님의</c:if><br>
					<c:if test="${b.count==2}">${bookMarkNum}</c:if>
				</c:forEach>
				</div>
				<img class="book_img"
				src="${pageContext.request.contextPath}/resources/img/book.png"
				alt="First slide" style="width: 60%; margin: 0 auto; 
				-webkit-filter: opacity(.5) drop-shadow(0 0 0 gray);
				filter:opacity(.5) drop-shadow(0 0 0 gray);">
				<div class="book_explain"><c:out value="${bookmark.list_explain}"></c:out></div>
				</div>
				</c:forEach>
				</div>
				</div>
			</c:when>
		</c:choose>
		</div>
		<div class="setList" style="background:#ffd4d7; padding-bottom:10%;">
		<div class="mySetList text-center" style="color:white; font-family: 'Oswald', sans-serif; padding-top:5%; font-weight:bold;">
			MY SET LIST
		</div>
		<c:choose>
			<c:when test="${empty selectSet}">
			</c:when>
			<c:when test="${!empty selectSet}">
			<div class="container set_list">
			<div class="row" style="margin:0 auto;">
				<c:forEach var="selectSet" items="${selectSet}">
					<div class="col-6 col-md-4 text-center book" onClick="setlink('<c:out value="${selectSet.list_name}"/>,<c:out value="${sessionScope.userId}"/>')" style=" margin:0 auto; margin-top:5%; cursor:pointer;">
				<div class="book_title" style="color:#08415d; font-weight:bold; line-height:60%">
					<c:out value="${selectSet.list_name}"></c:out>
					
					</div>
					<img class="book_img"
				src="${pageContext.request.contextPath}/resources/img/book.png"
				alt="First slide" style="width: 60%; margin: 0 auto; 
				-webkit-filter: opacity(.5) drop-shadow(0 0 0 gray);
				filter:opacity(.5) drop-shadow(0 0 0 gray);">
				<div class="book_explain"><c:out value="${selectSet.list_explain}"></c:out>
				</div>
					</div>
					
				</c:forEach>
				</div>
				</div>
			</c:when>
		</c:choose>
		</div>
		<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>	
</body>
</html>