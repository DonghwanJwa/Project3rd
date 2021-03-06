<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/statistics.js"></script>
<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/statistics.css" />
<title> </title>
</head>
<body>
 <div id="stat_title_name"><b>Statistics Chart</b></div>
 <div id="stat_wrap" style="min-height:calc(100vh - 162px);">
  <div id="stat_chart_wrap" style="max-width:1200px; margin:0px auto;">
   <div id="stat_allCount">
   <c:forEach var="items" items="${Count}" varStatus="status">
    <c:if test="${status.index == 0}">
    <span>게시글 수 : <b>${items.count}</b></span>·
    </c:if>
    <c:if test="${status.index == 1}">
    <span>집필된 책 수 : <b>${items.count}</b></span>·
    </c:if>
    <c:if test="${status.index == 2}">
    <span>회원 수 : <b>${items.count}</b></span>·
    </c:if>
    <c:if test="${status.index == 3}">
    <span>총 방문자 수 : <b>${items.count}</b></span>
    </c:if>
   </c:forEach>
   </div>
   <div id="stat_agegroup_chart" style="display:inline-block;"></div>
   <div id="stat_gender_chart" style="display:inline-block;"></div>
   <div id="stat_article_chart" style="display:inline-block;"></div>
   <div id="stat_category_chart"></div>
   <div id="stat_artCount_chart"></div>
  </div>
 </div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>