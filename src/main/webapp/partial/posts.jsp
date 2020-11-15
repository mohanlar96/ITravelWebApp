<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!-- post status start -->
<c:forEach var="post" items="${requestScope.posts}">

    <c:set var="isLiked" scope="application" value="${(post.reactions.stream().filter(x->x.getAvator().getId()==requestScope.avator.id).count()>=1)}"/>
    <!-- post status start -->
    <div class="card post">
        <!-- post title start -->
        <div class="post-title d-flex align-items-center">
            <!-- profile picture end -->
            <div class="profile-thumb">
                <a href="${post.avator.profileUrl}">
                    <figure class="profile-thumb-middle">
                        <img src="${post.avator.profileUrl}" alt="profile picture">
                    </figure>
                </a>
            </div>
            <!-- profile picture end -->
            <div class="posted-author">
                <h6 class="author"><a href="profile?id=${post.avator.id}">${post.avator.firstName} ${post.avator.lastName}</a></h6>
                <span class="post-time">${post.postDate}</span>
            </div>
            <div class="post-settings-bar">
                <span></span>
                <span></span>
                <span></span>
                <div class="post-settings arrow-shape">
                    <ul>
                        <li><button class="edit-post" data-postID="${post.postID}">edit post</button></li>
                        <li><button class="edit-post delete-post" data-postID="${post.postID}">edit post</button></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- post title start -->
        <div class="post-content" data-postID="${post.postID}">
            <p class="post-desc">
                    ${post.description}
            </p>
            <c:set var="images" value="${post.images}" scope="request"/>
            <c:import url="partial/image_gallery.jsp" />

            <div class="post-meta">
                <button class="post-meta-like">
                    <c:if test="${isLiked}">
                        <button class="like-button" style="margin-left: 0; padding: 0 10px; float: left" data-isLiked="true" >
                            <img class="heart" src="/images/icons/heart.png" alt="">
                            <img class="heart-color liked " src="/images/icons/heart-color.png" alt="" style="margin-left: 12px;">
                        </button>
                    </c:if>
                    <c:if test="${!isLiked}">
                        <button class="like-button" style="margin-left: 0; padding: 0 10px; float: left" data-isLiked="false" >
                            <img class="heart" src="/images/icons/heart.png" alt="">
                            <img class="heart-color " src="/images/icons/heart-color.png" alt="" style="margin-left: 12px;">
                        </button>
                    </c:if>

                    <button class="like-button show-liked-dialog">
                        <span > <c:if test="${isLiked}">You and </c:if>${fn:length(post.reactions)} people like this</span>
                        <strong  >${fn:length(post.reactions)}</strong>
                    </button>

                </button>
                <ul class="comment-share-meta">
                    <li>
                        <button class="post-comment">
                            <i class="bi bi-chat-bubble"></i>
                            <span>${fn:length(post.comments)}</span>
                        </button>
                    </li>

                </ul>
            </div>
        </div>
        <c:if test="${fn:length(post.comments)!=0}" >

            <!-- List of commant Box Start  -->
            <div class="commant-box hide frnd-search-inner custom-scroll ps ps--active-y" style="height: auto;">
                <h4 class="widget-title"> Comments </h4>
                <ul>
                    <c:forEach var="comment" items="${post.comments}">
                        <li class="d-flex align-items-center profile-active">
                            <!-- profile picture end -->
                            <div class="profile-thumb ">
                                <a href="/profile?id=${comment.avator.id}">
                                    <figure class="profile-thumb-small">
                                        <img src="${comment.avator.profileUrl}" alt="profile picture">
                                    </figure>
                                </a>
                            </div>
                            <!-- profile picture end -->
                            <div class="posted-author">
                                <h6 class="author">${comment.avator.firstName} ${comment.avator.lastName}</h6>
                                <p>${comment.commentContent}</p>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <div class="ps__rail-x" style="left: 0px; bottom: -101px;">
                    <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                </div>
                <div class="ps__rail-y" style="top: 104px; height: 350px; right: 2px;">
                    <div class="ps__thumb-y" tabindex="0" style="top: 81px; height: 269px;"></div>
                </div>
            </div>
            <!-- End List of commant Box  -->
        </c:if>
        <c:if test="${fn:length(post.reactions)!=0}" >

            <!-- List of like list box start -->
            <div class="liked-box frnd-search-inner custom-scroll ps ps--active-y" style="height: auto;">
                <h4 class="widget-title"> Liked By </h4>
                <ul>
                    <c:forEach var="reaction" items="${post.reactions}">

                        <li class="d-flex align-items-center profile-active">
                            <!-- profile picture end -->
                            <div class="profile-thumb ">
                                <a href="/profile?id=${reaction.avator.id}">
                                    <figure class="profile-thumb-small">
                                        <img src="${reaction.avator.profileUrl}" alt="profile picture">
                                    </figure>
                                </a>
                            </div>
                            <!-- profile picture end -->
                            <div class="posted-author">
                                <h6 class="author">${reaction.avator.firstName} ${reaction.avator.lastName}</h6>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <div class="ps__rail-x" style="left: 0px; bottom: -101px;">
                    <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                </div>
                <div class="ps__rail-y" style="top: 104px; height: 350px; right: 2px;">
                    <div class="ps__thumb-y" tabindex="0" style="top: 81px; height: 269px;"></div>
                </div>
            </div>
            <!-- List of like list box end -->
        </c:if>

        <!-- Commant Box Start -->
        <div class="card card-small">
            <div class="share-box-inner">
                <!-- profile picture end -->
                <div class="profile-thumb">
                    <a href="#">
                        <figure class="profile-thumb-middle">
                            <img src="${requestScope.avator.avatorIcon}" alt="profile picture">
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
</c:forEach>
<script src="/js/like_comment_delete_post.js"></script>
