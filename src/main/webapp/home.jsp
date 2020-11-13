<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="layout/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<main>
    <div class="main-wrapper pt-80">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 order-2 order-lg-1">
                    <aside class="widget-area">
                        <!-- widget single item start -->
                        <div class="card card-profile widget-item p-0">
                            <div class="profile-banner">
                                <figure class="profile-banner-small">
                                    <a href="profile.html">
                                        <img src="images/banner/banner-small.jpg" alt="">
                                    </a>
                                    <a href="profile.html" class="profile-thumb-2">
                                        <img src="images/profile/profile-midle-1.jpg" alt="">
                                    </a>
                                </figure>
                                <div class="profile-desc text-center">
                                    <h6 class="author"><a href="profile.html">Dimbel Lebmid</a></h6>
                                    <p>Any one can join with but Social network us if you want Any one can join with us if you want</p>
                                </div>
                            </div>
                        </div>
                        <!-- widget single item start -->
                        <!-- widget single item start -->
                        <div class="card widget-item">
                            <h4 class="widget-title">Place You have Visited</h4>
                            <div class="widget-body">
                                <ul class="like-page-list-wrapper">
                                    <li class="unorder-list">
                                        <!-- profile picture end -->
                                        <div class="profile-thumb">
                                            <a href="#">
                                                <figure>
                                                    <img src="images/icons/location.png" alt="Location">
                                                </figure>
                                            </a>
                                        </div>
                                        <!-- profile picture end -->
                                        <div class="unorder-list-info">
                                            <h3 class="list-title"><a href="#">USA</a></h3>
                                            <p class="list-subtitle"><a href="#">State : <b>Iowa</b></a>
                                            </p>
                                            <p class="list-subtitle"><a href="#">City : <b>Fairfield</b></a>
                                            </p>
                                        </div>
                                    </li>
                                    <li class="unorder-list">
                                        <!-- profile picture end -->
                                        <div class="profile-thumb">
                                            <a href="#">
                                                <figure>
                                                    <img src="images/icons/location.png" alt="Location">
                                                </figure>
                                            </a>
                                        </div>
                                        <!-- profile picture end -->
                                        <div class="unorder-list-info">
                                            <h3 class="list-title"><a href="#">USA</a></h3>
                                            <p class="list-subtitle"><a href="#">State : <b>Iowa</b></a>
                                            </p>
                                            <p class="list-subtitle"><a href="#">City : <b>Fairfield</b></a>
                                            </p>
                                        </div>
                                    </li>
                                    <li class="unorder-list">
                                        <!-- profile picture end -->
                                        <div class="profile-thumb">
                                            <a href="#">
                                                <figure>
                                                    <img src="images/icons/location.png" alt="Location">
                                                </figure>
                                            </a>
                                        </div>
                                        <!-- profile picture end -->
                                        <div class="unorder-list-info">
                                            <h3 class="list-title"><a href="#">USA</a></h3>
                                            <p class="list-subtitle"><a href="#">State : <b>Iowa</b></a>
                                            </p>
                                            <p class="list-subtitle"><a href="#">City : <b>Fairfield</b></a>
                                            </p>
                                        </div>
                                    </li>
                                    <li class="unorder-list">
                                        <!-- profile picture end -->
                                        <div class="profile-thumb">
                                            <a href="#">
                                                <figure>
                                                    <img src="images/icons/location.png" alt="Location">
                                                </figure>
                                            </a>
                                        </div>
                                        <!-- profile picture end -->
                                        <div class="unorder-list-info">
                                            <h3 class="list-title"><a href="#">USA</a></h3>
                                            <p class="list-subtitle"><a href="#">State : <b>Iowa</b></a>
                                            </p>
                                            <p class="list-subtitle"><a href="#">City : <b>Fairfield</b></a>
                                            </p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- widget single item end -->
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
                                        <img src="images/profile/profile-small-37.jpg" alt="profile picture">
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
                            <!-- Modal start -->
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
                                                    <textarea name="share" class="share-field-big share-text-field custom-scroll" placeholder="Say Something"></textarea>
                                                </span>
                                            <span class="share-text-box">
                                                    <textarea name="share" class="share-text-field" placeholder="Depature Travel Location" spellcheck="false"></textarea>
                                                    <grammarly-extension style="position: absolute; top: 0px; left: 0px; pointer-events: none; z-index: auto;" class="_1KJtL"></grammarly-extension>
                                                </span>
                                            <span class="share-text-box">
                                                    <textarea name="share" class="share-text-field" placeholder="Desitnation Travel Location" spellcheck="false"></textarea>
                                                    <grammarly-extension style="position: absolute; top: 0px; left: 0px; pointer-events: none; z-index: auto;" class="_1KJtL"></grammarly-extension>
                                                </span>
                                            <br>
                                            <span class="list-title" style="padding: 10px">
                                                    Upload Images
                                                </span>
                                            <input type="file" multiple="multiple">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="post-share-btn" data-dismiss="modal">cancel</button>
                                            <button type="button" class="post-share-btn">post</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal end -->
                        </div>
                    </div>
                    <!-- share box end -->
                    <!-- post status start -->
                    <div class="card post">
                        <!-- post title start -->
                        <div class="post-title d-flex align-items-center">
                            <!-- profile picture end -->
                            <div class="profile-thumb">
                                <a href="#">
                                    <figure class="profile-thumb-middle">
                                        <img src="images/profile/profile-small-1.jpg" alt="profile picture">
                                    </figure>
                                </a>
                            </div>
                            <!-- profile picture end -->
                            <div class="posted-author">
                                <h6 class="author"><a href="profile.html">hello heoel hello  LJ</a></h6>
                                <span class="post-time">20 min ago</span>
                            </div>
                            <div class="post-settings-bar">
                                <span></span>
                                <span></span>
                                <span></span>
                                <div class="post-settings arrow-shape">
                                    <ul>
                                        <li><button>copy link to ITravel</button></li>
                                        <li><button>edit post</button></li>
                                        <li><button>embed ITravel</button></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- post title start -->
                        <div class="post-content">
                            <p class="post-desc">
                                Many desktop publishing packages and web page editors now use Lorem Ipsum as their
                                default model text, and a search for 'lorem ipsum' will uncover many web sites still
                                in their infancy.
                            </p>
                            <div class="post-thumb-gallery">
                                <figure class="post-thumb img-popup">
                                    <a href="images/post/post-large-1.jpg">
                                        <img src="images/post/post-1.jpg" alt="post image">
                                    </a>
                                </figure>
                            </div>
                            <div class="post-meta">
                                <button class="post-meta-like">
                                    <i class="bi bi-heart-beat"></i>
                                    <span>You and 201 people like this</span>
                                    <strong>201</strong>
                                </button>
                                <ul class="comment-share-meta">
                                    <li>
                                        <button class="post-comment">
                                            <i class="bi bi-chat-bubble"></i>
                                            <span>41</span>
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- List of commant Box Start  -->
                        <div class="commant-box hide frnd-search-inner custom-scroll ps ps--active-y">
                            <h4 class="widget-title"> Comments </h4>
                            <ul>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-1.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author">Jon Wilime</h6>
                                        <p>What a beautiful pictures</p>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-2.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wileyam</a></h6>
                                        <button class="add-frnd">What the hack!</button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-3.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Mili Raoulin</a></h6>
                                        <button class="add-frnd">Amazing places and pictures</button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-4.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wilime</a></h6>
                                        <button class="add-frnd">I want to go that place</button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-5.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Robart faul</a></h6>
                                        <button class="add-frnd">Beautiful</button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-3.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Mili Raoulin</a></h6>
                                        <button class="add-frnd">Cool </button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-4.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wilime</a></h6>
                                        <button class="add-frnd">Wow amazing </button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-5.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Robart faul</a></h6>
                                        <button class="add-frnd">Wow amazing view</button>
                                    </div>
                                </li>
                            </ul>
                            <div class="ps__rail-x" style="left: 0px; bottom: -101px;">
                                <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                            </div>
                            <div class="ps__rail-y" style="top: 104px; height: 350px; right: 2px;">
                                <div class="ps__thumb-y" tabindex="0" style="top: 81px; height: 269px;"></div>
                            </div>
                        </div>
                        <!-- End List of commant Box  -->
                        <!-- List of like list box start -->
                        <div class="liked-box frnd-search-inner custom-scroll ps ps--active-y">
                            <h4 class="widget-title"> Liked By </h4>
                            <ul>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-1.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author">Jon Wilime</h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-2.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wileyam</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-3.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Mili Raoulin</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-4.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wilime</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-5.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Robart faul</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-3.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Mili Raoulin</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-4.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wilime</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-5.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Robart faul</a></h6>
                                    </div>
                                </li>
                            </ul>
                            <div class="ps__rail-x" style="left: 0px; bottom: -101px;">
                                <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                            </div>
                            <div class="ps__rail-y" style="top: 104px; height: 350px; right: 2px;">
                                <div class="ps__thumb-y" tabindex="0" style="top: 81px; height: 269px;"></div>
                            </div>
                        </div>
                        <!-- List of like list box end -->
                        <!-- Commant Box Start -->
                        <div class="card card-small">
                            <div class="share-box-inner">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-middle">
                                            <img src="images/profile/profile-small-37.jpg" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->
                                <!-- share content box start -->
                                <div class="share-content-box w-100">
                                    <form class="share-text-box">
                                        <textarea name="share" class="share-text-field" placeholder="Write a comment" spellcheck="false"></textarea>
                                        <grammarly-extension style="position: absolute; top: 0px; left: 0px; pointer-events: none; z-index: auto;" class="_1KJtL"></grammarly-extension>
                                        <button class="btn-share" type="submit">Comment</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Commant Box End -->
                    </div>
                    <!-- post status end -->
                    <!-- post status start -->
                    <div class="card post">
                        <!-- post title start -->
                        <div class="post-title d-flex align-items-center">
                            <!-- profile picture end -->
                            <div class="profile-thumb">
                                <a href="#">
                                    <figure class="profile-thumb-middle">
                                        <img src="images/profile/profile-small-9.jpg" alt="profile picture">
                                    </figure>
                                </a>
                            </div>
                            <!-- profile picture end -->
                            <div class="posted-author">
                                <h6 class="author"><a href="profile.html">Jon Wileyam</a></h6>
                                <span class="post-time">15 min ago</span>
                            </div>
                            <div class="post-settings-bar">
                                <span></span>
                                <span></span>
                                <span></span>
                                <div class="post-settings arrow-shape">
                                    <ul>
                                        <li><button>copy link to ITravel</button></li>
                                        <li><button>edit post</button></li>
                                        <li><button>embed ITravel</button></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- post title start -->
                        <div class="post-content">
                            <p class="post-desc pb-0">
                                Many desktop publishing packages and web page editors now use Lorem Ipsum as their
                                default model text, and a search for
                            </p>
                            <div class="post-meta">
                                <button class="post-meta-like">
                                    <i class="bi bi-heart-beat"></i>
                                    <span>You and 206 people like this</span>
                                    <strong>206</strong>
                                </button>
                                <ul class="comment-share-meta">
                                    <li>
                                        <button class="post-comment">
                                            <i class="bi bi-chat-bubble"></i>
                                            <span>41</span>
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- List of commant Box Start  -->
                        <div class="commant-box hide frnd-search-inner custom-scroll ps ps--active-y">
                            <h4 class="widget-title"> Comments </h4>
                            <ul>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-1.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author">Jon Wilime</h6>
                                        <p>What a beautiful pictures</p>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-2.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wileyam</a></h6>
                                        <button class="add-frnd">What the hack!</button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-3.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Mili Raoulin</a></h6>
                                        <button class="add-frnd">Amazing places and pictures</button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-4.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wilime</a></h6>
                                        <button class="add-frnd">I want to go that place</button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-5.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Robart faul</a></h6>
                                        <button class="add-frnd">Beautiful</button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-3.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Mili Raoulin</a></h6>
                                        <button class="add-frnd">Cool </button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-4.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wilime</a></h6>
                                        <button class="add-frnd">Wow amazing </button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-5.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Robart faul</a></h6>
                                        <button class="add-frnd">Wow amazing view</button>
                                    </div>
                                </li>
                            </ul>
                            <div class="ps__rail-x" style="left: 0px; bottom: -101px;">
                                <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                            </div>
                            <div class="ps__rail-y" style="top: 104px; height: 350px; right: 2px;">
                                <div class="ps__thumb-y" tabindex="0" style="top: 81px; height: 269px;"></div>
                            </div>
                        </div>
                        <!-- End List of commant Box  -->
                        <!-- List of like list box start -->
                        <div class="liked-box frnd-search-inner custom-scroll ps ps--active-y">
                            <h4 class="widget-title"> Liked By </h4>
                            <ul>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-1.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author">Jon Wilime</h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-2.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wileyam</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-3.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Mili Raoulin</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-4.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wilime</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-5.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Robart faul</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-3.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Mili Raoulin</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-4.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wilime</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-5.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Robart faul</a></h6>
                                    </div>
                                </li>
                            </ul>
                            <div class="ps__rail-x" style="left: 0px; bottom: -101px;">
                                <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                            </div>
                            <div class="ps__rail-y" style="top: 104px; height: 350px; right: 2px;">
                                <div class="ps__thumb-y" tabindex="0" style="top: 81px; height: 269px;"></div>
                            </div>
                        </div>
                        <!-- List of like list box end -->
                        <!-- Commant Box Start -->
                        <div class="card card-small">
                            <div class="share-box-inner">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-middle">
                                            <img src="images/profile/profile-small-37.jpg" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->
                                <!-- share content box start -->
                                <div class="share-content-box w-100">
                                    <form class="share-text-box">
                                        <textarea name="share" class="share-text-field" placeholder="Write a comment" spellcheck="false"></textarea>
                                        <grammarly-extension style="position: absolute; top: 0px; left: 0px; pointer-events: none; z-index: auto;" class="_1KJtL"></grammarly-extension>
                                        <button class="btn-share" type="submit">Comment</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Commant Box End -->
                    </div>
                    <!-- post status end -->
                    <!-- post status end -->
                    <!-- post status start -->
                    <div class="card post">
                        <!-- post title start -->
                        <div class="post-title d-flex align-items-center">
                            <!-- profile picture end -->
                            <div class="profile-thumb">
                                <a href="#">
                                    <figure class="profile-thumb-middle">
                                        <img src="images/profile/profile-small-37.jpg" alt="profile picture">
                                    </figure>
                                </a>
                            </div>
                            <!-- profile picture end -->
                            <div class="posted-author">
                                <h6 class="author"><a href="profile.html">Kate Palson</a></h6>
                                <span class="post-time">35 min ago</span>
                            </div>
                            <div class="post-settings-bar">
                                <span></span>
                                <span></span>
                                <span></span>
                                <div class="post-settings arrow-shape">
                                    <ul>
                                        <li><button>copy link to ITravel</button></li>
                                        <li><button>edit post</button></li>
                                        <li><button>embed ITravel</button></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- post title start -->
                        <div class="post-content">
                            <p class="post-desc">
                                Many desktop publishing packages and web page editors now use Lorem Ipsum as their
                                default model text, and a search for 'lorem ipsum' will uncover many web sites still
                                in their infancy.
                            </p>
                            <div class="post-thumb-gallery img-gallery">
                                <div class="row no-gutters">
                                    <div class="col-8">
                                        <figure class="post-thumb">
                                            <a class="gallery-selector" href="images/post/post-large-2.jpg">
                                                <img src="images/post/post-2.jpg" alt="post image">
                                            </a>
                                        </figure>
                                    </div>
                                    <div class="col-4">
                                        <div class="row">
                                            <div class="col-12">
                                                <figure class="post-thumb">
                                                    <a class="gallery-selector" href="images/post/post-large-3.jpg">
                                                        <img src="images/post/post-3.jpg" alt="post image">
                                                    </a>
                                                </figure>
                                            </div>
                                            <div class="col-12">
                                                <figure class="post-thumb">
                                                    <a class="gallery-selector" href="images/post/post-large-4.jpg">
                                                        <img src="images/post/post-4.jpg" alt="post image">
                                                    </a>
                                                </figure>
                                            </div>
                                            <div class="col-12">
                                                <figure class="post-thumb">
                                                    <a class="gallery-selector" href="images/post/post-large-5.jpg">
                                                        <img src="images/post/post-5.jpg" alt="post image">
                                                    </a>
                                                </figure>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="post-meta">
                                <button class="post-meta-like">
                                    <i class="bi bi-heart-beat"></i>
                                    <span>You and 70 people like this</span>
                                    <strong>70</strong>
                                </button>
                                <ul class="comment-share-meta">
                                    <li>
                                        <button class="post-comment">
                                            <i class="bi bi-chat-bubble"></i>
                                            <span>28</span>
                                        </button>
                                    </li>

                                </ul>
                            </div>
                        </div>
                        <!-- List of commant Box Start  -->
                        <div class="commant-box hide frnd-search-inner custom-scroll ps ps--active-y">
                            <h4 class="widget-title"> Comments </h4>
                            <ul>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-1.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author">Jon Wilime</h6>
                                        <p>What a beautiful pictures</p>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-2.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wileyam</a></h6>
                                        <button class="add-frnd">What the hack!</button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-3.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Mili Raoulin</a></h6>
                                        <button class="add-frnd">Amazing places and pictures</button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-4.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wilime</a></h6>
                                        <button class="add-frnd">I want to go that place</button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-5.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Robart faul</a></h6>
                                        <button class="add-frnd">Beautiful</button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-3.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Mili Raoulin</a></h6>
                                        <button class="add-frnd">Cool </button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-4.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wilime</a></h6>
                                        <button class="add-frnd">Wow amazing </button>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-5.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Robart faul</a></h6>
                                        <button class="add-frnd">Wow amazing view</button>
                                    </div>
                                </li>
                            </ul>
                            <div class="ps__rail-x" style="left: 0px; bottom: -101px;">
                                <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                            </div>
                            <div class="ps__rail-y" style="top: 104px; height: 350px; right: 2px;">
                                <div class="ps__thumb-y" tabindex="0" style="top: 81px; height: 269px;"></div>
                            </div>
                        </div>
                        <!-- End List of commant Box  -->
                        <!-- List of like list box start -->
                        <div class="liked-box frnd-search-inner custom-scroll ps ps--active-y">
                            <h4 class="widget-title"> Liked By </h4>
                            <ul>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-1.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author">Jon Wilime</h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-2.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wileyam</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-3.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Mili Raoulin</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-4.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wilime</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-5.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Robart faul</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-3.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Mili Raoulin</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-4.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Jon Wilime</a></h6>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center profile-active">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb ">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="images/profile/profile-small-5.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
                                    <div class="posted-author">
                                        <h6 class="author"><a href="profile.html">Robart faul</a></h6>
                                    </div>
                                </li>
                            </ul>
                            <div class="ps__rail-x" style="left: 0px; bottom: -101px;">
                                <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                            </div>
                            <div class="ps__rail-y" style="top: 104px; height: 350px; right: 2px;">
                                <div class="ps__thumb-y" tabindex="0" style="top: 81px; height: 269px;"></div>
                            </div>
                        </div>
                        <!-- List of like list box end -->
                        <!-- Commant Box Start -->
                        <div class="card card-small">
                            <div class="share-box-inner">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-middle">
                                            <img src="images/profile/profile-small-37.jpg" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->
                                <!-- share content box start -->
                                <div class="share-content-box w-100">
                                    <form class="share-text-box">
                                        <textarea name="share" class="share-text-field" placeholder="Write a comment" spellcheck="false"></textarea>
                                        <grammarly-extension style="position: absolute; top: 0px; left: 0px; pointer-events: none; z-index: auto;" class="_1KJtL"></grammarly-extension>
                                        <button class="btn-share" type="submit">Comment</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Commant Box End -->
                    </div>
                    <!-- post status end -->
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
