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
                                    <a href="/profile?id${avator.id}">
                                        <img src="${avator.banner}" alt="">
                                    </a>
                                    <a href="/profile?id${avator.id}" class="profile-thumb-2">
                                        <img src="${avator.profileUrl}" alt="">
                                    </a>
                                </figure>
                                <div class="profile-desc text-center">
                                    <h6 class="author"><a href="/profile?id${avator.id}">${avator.firstName} ${avator.lastName}</a></h6>
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
                            <!-- share content box end -->
<%--                            <script--%>
<%--                                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCneh1NGoaH33EkKQ6SltmLoqNtwbLqZ7U&callback=initAutocomplete&libraries=places&v=weekly"--%>
<%--                                    defer--%>
<%--                            ></script>--%>
                            <script src="js/geolocation.js"></script>
                            <!-- Modal start -->
                            <form action = "post/interact" method ="post" enctype="multipart/form-data">
<%--                            <form action = "post/interact" method ="post" >--%>
                                <input type="hidden" name="userID" value="${avator.id}">
                                <input type="hidden" name="latitude"  value="8998.233" id="latitude">
                                <input type="hidden" name="longitude" value="239823.99" id="longitude">
                                <input type="hidden" name="functionRequest" value="POST">

                                <div class="modal fade" id="textbox" aria-labelledby="textbox">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Share Your Travel Info</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body custom-scroll">
                                                <span class="share-text-box">
                                                    <textarea required name="description" class="share-field-big share-text-field custom-scroll" placeholder="Say Something">Testing Data Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.</textarea>
                                                </span>
                                            <span class="share-text-box">
                                                    <textarea required name="departureAddress" id="autocompleteDep" onFocus="geolocate()"  class="share-text-field" placeholder="Depature Travel Location" spellcheck="false" >IOWA, USA</textarea>
                                                    <grammarly-extension style="position: absolute; top: 0px; left: 0px; pointer-events: none; z-index: auto;" class="_1KJtL"></grammarly-extension>
                                            </span>
                                            <span class="share-text-box">
                                                    <textarea required name="destinationAddress" id="autocompleteDest" onFocus="geolocate()"  class="share-text-field" placeholder="Depature Travel Location" spellcheck="false" >CA ,USA </textarea>
                                                    <grammarly-extension style="position: absolute; top: 0px; left: 0px; pointer-events: none; z-index: auto;" class="_1KJtL"></grammarly-extension>
                                            </span>

                                            <br>
                                            <span class="list-title" style="padding: 10px">
                                                    Upload Images
                                                </span>
                                            <input type = "file" name = "file" size = "10" />
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="post-share-btn" data-dismiss="modal">cancel</button>
                                            <button type="submit" class="post-share-btn" >post</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </form>
                            <!-- Modal end -->
                        </div>
                    </div>
                    <!-- share box end -->
                    <c:set var="posts" value="${posts}" scope="request"/>
                    <c:set var="avator" value="${avator}" scope="request"/>
                    <c:import url="partial/posts.jsp" />

                </div>
                <div class="col-lg-3 order-3">
                    <aside class="widget-area">
                        <!-- widget single item start -->
                        <div class="card widget-item">
                            <h4 class="widget-title">Recent Notifications</h4>
                            <div class="widget-body">
                                <ul class="like-page-list-wrapper">
                                    <li class="unorder-list">
                                        <!-- profile picture end -->
                                        <div class="profile-thumb">
                                            <a href="#">
                                                <figure class="profile-thumb-small">
                                                    <img src="images/profile/profile-small-9.jpg" alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                        <!-- profile picture end -->
                                        <div class="unorder-list-info">
                                            <h3 class="list-title"><a href="#">Any one can join with us if you want</a></h3>
                                            <p class="list-subtitle">5 min ago</p>
                                        </div>
                                    </li>
                                    <li class="unorder-list">
                                        <!-- profile picture end -->
                                        <div class="profile-thumb">
                                            <a href="#">
                                                <figure class="profile-thumb-small">
                                                    <img src="images/profile/profile-small-35.jpg" alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                        <!-- profile picture end -->
                                        <div class="unorder-list-info">
                                            <h3 class="list-title"><a href="#">Any one can join with us if you want</a></h3>
                                            <p class="list-subtitle">10 min ago</p>
                                        </div>
                                    </li>
                                    <li class="unorder-list">
                                        <!-- profile picture end -->
                                        <div class="profile-thumb">
                                            <a href="#">
                                                <figure class="profile-thumb-small">
                                                    <img src="images/profile/profile-small-15.jpg" alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                        <!-- profile picture end -->
                                        <div class="unorder-list-info">
                                            <h3 class="list-title"><a href="#">Any one can join with us if you want</a></h3>
                                            <p class="list-subtitle">18 min ago</p>
                                        </div>
                                    </li>
                                    <li class="unorder-list">
                                        <!-- profile picture end -->
                                        <div class="profile-thumb">
                                            <a href="#">
                                                <figure class="profile-thumb-small">
                                                    <img src="images/profile/profile-small-6.jpg" alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                        <!-- profile picture end -->
                                        <div class="unorder-list-info">
                                            <h3 class="list-title"><a href="#">Any one can join with us if you want</a></h3>
                                            <p class="list-subtitle">25 min ago</p>
                                        </div>
                                    </li>
                                    <li class="unorder-list">
                                        <!-- profile picture end -->
                                        <div class="profile-thumb">
                                            <a href="#">
                                                <figure class="profile-thumb-small">
                                                    <img src="images/profile/profile-small-34.jpg" alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                        <!-- profile picture end -->
                                        <div class="unorder-list-info">
                                            <h3 class="list-title"><a href="#">Any one can join with us if you want</a></h3>
                                            <p class="list-subtitle">39 min ago</p>
                                        </div>
                                    </li>
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
