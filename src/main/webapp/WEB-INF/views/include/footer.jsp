 <%-- <%@ include file="../include/footer.jsp"%> 사용하여 푸터연결--%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css" />

  <div class="clear"></div>
<%-- 정보란 파랑--%>
   <footer id="foot-main-footer">
  <div id="foot-footer">
   <div id="foot-footer-inner">
    <div id="foot-inner-quotation">
     <p class="foot-inner-quotation-text">글 쓰는 것은 쉽다. 그저 혈관을 열고 피를 흘리면 된다.</p>
     <span class="foot-inner-quotation-author">레드스미스(Red Smith, 스포츠 기자)</span>
    </div>
    <div id="foot-inner-right">
     <div id="foot-inner-menu">
      <ul id="foot-inner-menu-list">
       <li class="foot-inner-menu-item"><a href="${pageContext.request.contextPath}/notice">공지사항</a></li>
       <c:if test="${m ne null}">
        <c:if test="${m.mem_author == 0}">
         <li class="foot-inner-menu-item"><a href="${pageContext.request.contextPath}/request_author">작가신청</a></li>
        </c:if>
       </c:if>
       <li class="foot-inner-menu-item"><a href="${pageContext.request.contextPath}/inquire">문의하기</a></li>
       <li class="foot-inner-menu-item"><a href="${pageContext.request.contextPath}/policy_terms">이용약관</a></li>
       <li class="foot-inner-menu-item"><a href="${pageContext.request.contextPath}/policy_privacy">개인정보 처리방침</a></li>
      </ul>
     </div>
     <div id="foot-inner-sns">
      <ul id="foot-inner-sns-list">
       <li class="foot-inner-sns-item">
        <a class="foot-inner-sns-link" href="http://www.facebook.com" target="_blank">
         <img class="foot-inner-sns-img" src="${pageContext.request.contextPath}/resources/img/footer/facebook.png" alt="페이스북"/>
        </a>
       </li>
       <li class="foot-inner-sns-item">
        <a class="foot-inner-sns-link" href="https://www.instagram.com" target="_blank">
         <img class="foot-inner-sns-img" src="${pageContext.request.contextPath}/resources/img/footer/instagram.png" alt="인스타그램"/>
        </a>
       </li>
       <li class="foot-inner-sns-item">
        <a class="foot-inner-sns-link" href="http://www.twitter.com" target="_blank">
         <img class="foot-inner-sns-img" src="${pageContext.request.contextPath}/resources/img/footer/twitter.png" alt="트위터"/>
        </a>
       </li>
      </ul>
     </div>
    </div>
   </div>
  </div>
 </footer>
</body>
</html>