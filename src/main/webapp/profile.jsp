<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="layout/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    .refname{
        color:#dc4734;
        font-weight:500;
        padding-right: 10px;
    }
    .answer{
        padding-left: 1px;
    }
</style>


<main>
    <div class="main-wrapper">
        <!-- BANNER START -->
        <div class="profile-banner-large bg-img" data-bg="${prof.banner}">
        </div>
        <!-- BANNER END -->
        <!-- OPTIONS BAR START -->
        <div class="profile-menu-area bg-white">
            <div class="container" id="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-3">
                        <div class="profile-picture-box">
                            <figure class="profile-picture">
                                <a href="/profile?id=${prof.userId}">
                                    <img src="${prof.profPicLarge}" alt="profile picture" height="225" width="225"> <!--"images/profile/profile-1.jpg"-->
                                </a>
                            </figure>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 offset-lg-1">
                        <div class="profile-menu-wrapper">
                            <div class="main-menu-inner header-top-navigation">
                                <nav>
                                    <ul class="main-menu">
                                        <li><a href="profile?id=${prof.userId}">timeline</a></li>
                                        <li><a href="about.jsp">about</a></li>
                                        <li><a href="photos.jsp">photos</a></li>
                                     <li><a id="main-menu-people" href="/allTraveller?id=${prof.userId}">Travellers</a></li>
                                    <li class="d-inline-block d-md-none"><a href="profile.jsp">edit profile</a></li>
<%--                                        <li><a id="main-menu-people"  href="javascript:void(0)">  Travellers</a></li>--%>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 d-none d-md-block">
                        <div class="profile-edit-panel">
                            <button onclick="window.location.href='editprofile?id=${prof.userId}'" class="edit-btn">EDIT PROFILE</button>
                            <%--    ======================================================== Session Analysis Here =======================================--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- OPTIONS BAR END -->
        <!-- CONTAINER START -->
        <div class="container">
            <div class="row">
                <!-- LEFT ASIDE START -->
                <div class="col-lg-3 order-2 order-lg-1">
                    <aside class="widget-area profile-sidebar">
                        <!-- widget single item start -->
                        <div class="card widget-item">
                            <h4 class="widget-title">${prof.firstName} ${prof.lastName}</h4>
                            <div class="widget-body">
                                <div class="about-author">
                                    <p>${prof.biography}</p>
                                    <ul class="author-into-list">
                                        <li><label class="refname">Full Name</label> <span class="answer">${prof.firstName} ${prof.midName} ${prof.lastName}</span></li>
                                        <li><label class="refname">Gender</label> <span class="answer">${prof.gender}</span></li>
                                        <li><label class="refname">State</label> <span class="answer">${prof.address.state}</span></li>
                                        <li><label class="refname">City</label> <span class="answer">${prof.address.city}</span></li>
                                        <li><label class="refname">Main Street</label> <span class="answer">${prof.address.street1}</span></li>
                                        <li><label class="refname">ZIP Code</label> <span class="answer">${prof.address.zipCode}</span></li>
                                        <li><label class="refname">Year Birth</label> <span class="answer">${prof.dateBirth.substring(0,4)}</span></li>
                                        <li><label class="refname">Email</label> <span class="answer">${prof.email}</span></li>
                                        <li><label class="refname">Job</label> <span class="answer">${prof.job}</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- widget single item end -->
                    </aside>
                </div>
                <!-- LEFT ASIDE END -->
                <!-- CENTRAL PART START -->
                <div class="col-lg-6 order-1 order-lg-2">
                    <!-- POST START -->
                    <c:set var="posts" value="${posts}" scope="request"/>
                    <c:set var="avator" value="${avator}" scope="request"/>
                    <c:import url="partial/posts.jsp" />
                    <c:import url="partial/modal.jsp" />
                    <!-- POST END -->
                </div>
                <!-- CENTRAL PART END -->
                <!-- RIGHT ASIDE START -->
                <div class="col-lg-3 order-3">
                    <aside class="widget-area">
                        <!-- widget single item start -->
                        <c:set var="places" value="${places}" scope="request"/>
                        <c:import url="partial/visited_place.jsp" />
                        <!-- widget single item end -->
                    </aside>
                </div>
                <!-- RIGHT ASIDE END -->
            </div>
        </div>
        <!-- CONTAINER END -->
    </div>
</main>

<jsp:include page="layout/footer.jsp" />