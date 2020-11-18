<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<jsp:include page="layout/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<main>
    <div class="main-wrapper pt-80">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 order-2 order-lg-1">
                    <aside class="widget-area">
                        <!-- widget single item start -->
                        <div class="card card-profile widget-item p-0" id="userID" data-id="2">
                            <div class="profile-banner">
                                <figure class="profile-banner-small">
                                    <a href="/profile?id=${avator.id}">
                                        <img src="${avator.banner}" alt="">
                                    </a>
                                    <a href="/profile?id=${avator.id}" class="profile-thumb-2">
                                        <img src="${avator.profileUrl}" alt="">
                                    </a>
                                </figure>
                                <div class="profile-desc text-center">
                                    <h6 class="author"><a href="/profile?id=${avator.id}">${avator.firstName} ${avator.lastName}</a></h6>
                                    <p>${avator.biography}</p>
                                </div>
                            </div>
                        </div>
                        <c:set var="places" value="${places}" scope="request"/>
                        <c:import url="partial/visited_place.jsp" />
                    </aside>
                </div>
                <div class="col-lg-6 order-1 order-lg-2">
                    <!-- share box start -->
                    <div class="card card-small">
                        <div class="share-box-inner">
                            <!-- profile picture end -->
                            <div class="profile-thumb">
                                <a href="#">
                                    <figure class="profile-thumb-middle">
                                        <img src="${avator.avatorIcon}" alt="profile picture">
                                    </figure>
                                </a>
                            </div>
                            <!-- profile picture end -->
                            <!-- share content box start -->
                            <div class="share-content-box w-100">
                                <form class="share-text-box">
                                    <textarea name="share" class="share-text-field" aria-disabled="true" placeholder="Say Something" data-toggle="modal" data-target="#textbox" id="email"></textarea>
                                    <button class="btn-share" data-toggle="modal" data-target="#textbox" type="button">share</button>
                                </form>
                            </div>



                        </div>
                    </div>
                    <!-- share box end -->
                    <c:set var="avator" value="${avator}" scope="request"/>
                    <c:set var="posts" value="${posts}" scope="request"/>
                    <c:import url="partial/posts.jsp" />
                    <c:import url="partial/modal.jsp" />


                </div>
                <div class="col-lg-3 order-3">
                    <aside class="widget-area">
                        <!-- widget single item start -->
                        <div class="card widget-item">
                            <h4 class="widget-title">Recent Notifications</h4>
                            <div class="widget-body">
                                <ul class="like-page-list-wrapper">
                                <c:forEach var="notification" items="${notifications}">

                                    <li class="unorder-list">
                                        <!-- profile picture end -->
                                        <div class="profile-thumb">
                                            <a href="/profile?id=${notification.avator.id}">
                                                <figure class="profile-thumb-small">
                                                    <img src="${notification.avator.profileUrl}" alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                        <!-- profile picture end -->
                                        <div class="unorder-list-info">
                                            <h3 class="list-title"><a href="#">${notification.message}</a></h3>
                                            <p class="list-subtitle">${notification.postDate}</p>
                                        </div>
                                    </li>
                                     </c:forEach>
                                    <c:if test="${fn:length(notifications)==0}">
                                             <li class="unorder-list">
                                                 <div class="unorder-list-info">
                                                     <h3 class="list-title"> No notification Yet ...  </h3>
                                                 </div>

                                             </li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                        <!-- widget single item end -->
                        <!-- widget single item start -->
                        <div class="card widget-item">
                            <h4 class="widget-title">Advertizement</h4>
                            <div class="widget-body">
                                <div class="add-thumb">
                                    <a href="https://miu.edu" target="_blank">
                                        <img src="images/banner/advertise.jfif" alt="advertisement">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- widget single item end -->
                    </aside>
                </div>
            </div>
        </div>
    </div>
</main>
<jsp:include page="layout/footer.jsp" />
