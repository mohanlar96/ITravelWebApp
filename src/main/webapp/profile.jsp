<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="layout/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<main>
    <div class="main-wrapper">
        <!-- BANNER START -->
        <div class="profile-banner-large bg-img" data-bg="${prof.banner}">
        </div>
        <!-- BANNER END -->
        <!-- OPTIONS BAR START -->
        <div class="profile-menu-area bg-white">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-3">
                        <div class="profile-picture-box">
                            <figure class="profile-picture">
                                <a href="profile.jsp">
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
                                        <li><a href="profile.jsp">timeline</a></li>
                                        <li><a href="about.jsp">about</a></li>
                                        <li><a href="photos.jsp">photos</a></li>
                                        <li><a id="main-menu-people" href="<%=request.getContextPath()%>/allpeople">People</a></li>                                        <!-- <li class="d-inline-block d-md-none"><a href="profile.jsp">edit profile</a></li> -->
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 d-none d-md-block">
                        <div class="profile-edit-panel">
                            <button class="edit-btn">edit profile</button>
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
                            <h4 class="widget-title">${prof.fullName}</h4>
                            <div class="widget-body">
                                <div class="about-author">
                                    <p>${prof.biography}</p>
                                    <ul class="author-into-list">
                                        <li><a href="#"><i class="bi bi-office-bag"></i>${prof.job}</a></li>
                                        <li><a href="#"><i class="bi bi-home"></i>${prof.cityBirth}</a></li>
                                        <li><a href="#"><i class="bi bi-location-pointer"></i>${prof.cityBirth}</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- widget single item end -->
                        <!-- widget single item start -->
                        <div class="card widget-item">
                            <h4 class="widget-title">LAST IMAGES</h4>
                            <div class="widget-body">
                                <div class="sweet-galley img-gallery">
                                    <div class="row row-5">
                                        <%for(int i=0; i<9; i++){%>
                                        <div class="col-4">
                                            <div class="gallery-tem">
                                                <figure class="post-thumb">
                                                    <a class="gallery-selector" href="images/gallery/gallery-2.jpg">
                                                        <img src="images/gallery/gallery-2.jpg" alt="sweet memory">
                                                    </a>
                                                </figure>
                                            </div>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </aside>
                </div>
                <!-- LEFT ASIDE END -->
                <!-- CENTRAL PART START -->
                <div class="col-lg-6 order-1 order-lg-2">
                    <!-- SHARE BOX START -->
                    <div class="card card-small">
                        <div class="share-box-inner">
                            <!-- profile picture end -->
                            <div class="profile-thumb">
                                <a href="#">
                                    <figure class="profile-thumb-middle">
                                        <img src="${prof.profPicSmall}" alt="profile picture">
                                    </figure>
                                </a>
                            </div>
                            <!-- profile picture end -->

                            <!-- share content box start -->
                            <div class="share-content-box w-100">
                                <form class="share-text-box">
                                    <textarea name="share" class="share-text-field" aria-disabled="true" placeholder="Say Something" data-toggle="modal" data-target="#textbox" id="email"></textarea>
                                    <button class="btn-share" type="submit">share</button>
                                </form>
                            </div>
                            <!-- share content box end -->
                            <!-- Modal start -->
                            <div class="modal fade" id="textbox" aria-labelledby="textbox">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">What are you thinking about?</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body custom-scroll">
                                            <textarea name="share" class="share-field-big custom-scroll" placeholder="Say Something"></textarea>
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
                    <!-- SHARE BOX END -->
                    <!-- POST START -->
                    <%for(int i=0; i<2; i++){%>
                    <div class="card">
                        <!-- post title start -->
                        <div class="post-title d-flex align-items-center">
                            <!-- profile picture end -->
                            <div class="profile-thumb">
                                <a href="#">
                                    <figure class="profile-thumb-middle">
                                        <img src="images/profile/profile-small-5.jpg" alt="profile picture">
                                    </figure>
                                </a>
                            </div>
                            <!-- profile picture end -->

                            <div class="posted-author">
                                <h6 class="author"><a href="profile.jsp">USER POST 1</a></h6>
                                <span class="post-time">XX min ago</span>
                            </div>

                            <div class="post-settings-bar">
                                <span></span>
                                <span></span>
                                <span></span>
                                <div class="post-settings arrow-shape">
                                    <ul>
                                        <li><button>copy link to adda</button></li>
                                        <li><button>edit post</button></li>
                                        <li><button>embed adda</button></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- post title start -->
                        <div class="post-content">
                            <p class="post-desc">
                                COMMENT OF POST 1
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
                                    <span>You and xxx people like this</span>
                                    <strong>xxx</strong>
                                </button>
                                <ul class="comment-share-meta">
                                    <li>
                                        <button class="post-comment">
                                            <i class="bi bi-chat-bubble"></i>
                                            <span>41</span>
                                        </button>
                                    </li>
                                    <li>
                                        <button class="post-share">
                                            <i class="bi bi-share"></i>
                                            <span>07</span>
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <%}%>
                    <!-- POST END -->
                </div>
                <!-- CENTRAL PART END -->
                <!-- RIGHT ASIDE START -->
                <div class="col-lg-3 order-3">
                    <aside class="widget-area">
                        <!-- widget single item start -->
                        <div class="card widget-item">
                            <h4 class="widget-title">COMMON FRIENDS</h4>
                            <div class="widget-body">
                                <ul class="like-page-list-wrapper">
                                    <% for(int i=0; i<4; i++){%>
                                    <li class="unorder-list">
                                        <!-- profile picture start -->
                                        <div class="profile-thumb">
                                            <a href="#">
                                                <figure class="profile-thumb-small">
                                                    <img src="images/profile/profile-small-10.jpg" alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                        <!-- profile picture end -->
                                        <div class="unorder-list-info">
                                            <h3 class="list-title"><a href="#">HERE_NAME</a></h3>
                                            <p class="list-subtitle"><a href="#">SOME_INFO</a></p>
                                        </div>
                                        <button class="like-button"><!--add active for changing state-->
                                            <img class="heart" src="images/icons/heart.png" alt="">
                                            <img class="heart-color" src="images/icons/heart-color.png" alt="">
                                        </button>
                                    </li>
                                    <%}%>
                                </ul>
                            </div>
                        </div>
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