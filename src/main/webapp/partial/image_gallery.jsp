<%--
  Created by IntelliJ IDEA.
  User: Mohan
  Date: 11/14/2020
  Time: 9:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:if test="${fn:length(requestScope.images)!=0}" >
    <div class="post-thumb-gallery img-gallery">
        <div class="row no-gutters">
            <c:forEach var="img" items="${requestScope.images}">
                <c:if test="${fn:length(images)>=2 && fn:length(images)<=6}">
                    <div class="col-6">
                </c:if>
                <figure class="post-thumb img-popup">
                    <a href="${img.url}">
                        <img src="${img.url}" alt="post image">
                    </a>
                </figure>
                <c:if test="${fn:length(images)>=2 && fn:length(images)<=6}">
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</c:if>
<script src="/js/like_comment_delete_post.js"></script>