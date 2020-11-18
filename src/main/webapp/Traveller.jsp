<%@ page import="itravel.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="itravel.model.Traveller" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="layout/header.jsp"/>
<%--<script type="text/java" src="/js/myAjax.js"> </script>--%>

<div class="main-wrapper">
    <!-- profile banner area start -->
    <div class="profile-banner-large bg-img" data-bg="images/banner/profile-banner.jpg">
    </div>
    <!-- profile banner area end -->

    <!-- profile menu area start -->
    <div class="profile-menu-area secondary-navigation-style bg-white">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-3 col-md-3">
                    <div class="profile-picture-box">
                        <figure class="profile-picture">
                            <a href="profile.jsp">
                                <img src="${profile.profPicLarge}" alt="profile picture" height="225" width="225"> <!--"images/profile/profile-1.jpg"-->
                            </a>
                        </figure>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 offset-lg-1">
                    <div class="profile-menu-wrapper">
                        <%int profile_ID = Integer.parseInt(request.getParameter("id"));%>
                        <div class="main-menu-inner header-top-navigation">
                            <nav>
                                <ul class="main-menu">
                                    <li class="active"><a href="#">timeline</a></li>
                                    <li><a href="about.jsp">about</a></li>
                                    <li><a href="photos.jsp">photos</a></li>
                                    <li>
                                        <a href="/allTraveller?id=<%=profile_ID%>">Travellers</a>
                                    </li>
                                    <li><a href="about.jsp">more</a></li>
                                    <!-- <li class="d-inline-block d-md-none"><a href="profile.jsp">edit profile</a></li> -->
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 d-none d-md-block">
                    <div class="profile-edit-panel">

                        <button onclick="window.location.href='editprofile?id=${userID}'" class="edit-btn">EDIT PROFILE</button>
                        <%--    ======================================================== Session Analysis Here =======================================--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- profile menu area end -->

    <!-- sendary menu start -->
    <div class="menu-secondary">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="secondary-menu-wrapper secondary-menu-2 bg-white">
                        <div class="page-title-inner">
                            <h4 class="page-title">(${myFollowersList.size()}) Travellers Following You</h4>
                        </div>
                        <div class="filter-menu">
                            <button class="active" data-filter="*">all</button>
                            <button data-filter=".recently">recently</button>
                            <button data-filter=".relative">relative</button>
                            <button data-filter=".collage">collage</button>
                            <button data-filter=".request">request</button>
                        </div>
                        <div class="post-settings-bar">
                            <span></span>
                            <span></span>
                            <span></span>
                            <div class="post-settings arrow-shape">
                                <ul>
                                    <li>
                                        <button>edit profile</button>
                                    </li>
                                    <li>
                                        <button>activity log</button>
                                    </li>
                                    <li>
                                        <button>embed adda</button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- sendary menu end -->

    <!-- photo section start -->
    <div class="friends-section mt-20">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="content-box friends-zone">
                        <div class="row mt--20 friends-list">
                            <c:forEach var="trvlr" items="${TravelersList}">
                                <c:choose>
                                    <c:when test="${trvlr.getIsFollwing()}">
                                        <c:set var="buttonName" scope="session" value="Following"/>
                                        <c:set var="myFontWeight" scope="session" value="bold"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="buttonName" scope="session" value="Follow"/>
                                        <c:set var="myFontWeight" scope="session" value="normal"/>
                                    </c:otherwise>

                                </c:choose>


                                <div class="col-lg-3 col-sm-6 relative">
                                    <div class="friend-list-view">
                                        <div class="profile-thumb">
                                            <a href="#">
                                                <figure class="profile-thumb-middle">
                                                    <img src="${trvlr.getPicturePath().toString()}"
                                                         alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                        <div class="posted-author">
                                            <h6 class="author"><a
                                                    href="<%=request.getContextPath()%>/profile?id=${trvlr.getUserID()}">
                                                    ${trvlr.getFirstName().toString()} ${trvlr.getLastName().toString()}
                                            </a></h6>
                                        </div>
                                        <div class="posted-author">
<%--                                            <%--%>
<%--                                                String buttontype = "";--%>
<%--                                                if (profile_ID != Integer.parseInt(session.getAttribute("UserSessionID").toString()))--%>
<%--                                                    buttontype = "disabled";--%>
<%--                                            %>--%>
<%--    ======================================================== Session Analysis Here =======================================--%>
                                            <button class="add-frnd" id="${trvlr.getUserID()}"
                                                    style="font-weight: ${myFontWeight}"  >${buttonName}</button>
                                        </div>
                                    </div>
                                </div>

                            </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- photo section end -->
</div>

<jsp:include page="layout/footer.jsp"/>


