<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="js/vendor/handlebars.js"></script>
<script id="postTemplate" type="text/x-handlebars-template">
    {{#each this.posts}}
    <!-- post status start -->
    <div class="card post" data-id="{{postID}}" data-userid="{{../this.loginAvator.id}}" data-avatorurl="{{../this.loginAvator.profileUrl}}" data-fullname="{{../this.loginAvator.firstName}} {{../this.loginAvator.lastName}}" >
        <!-- post title start -->
        <div class="post-title d-flex align-items-center">
            <!-- profile picture end -->
            <div class="profile-thumb">
                <a href="profile?id={{avator.id}}">
                    <figure class="profile-thumb-middle">
                        <img src="{{avator.profileUrl}}" alt="profile picture">
                    </figure>
                </a>
            </div>
            <!-- profile picture end -->
            <div class="posted-author">
                <h6 class="author"><a href="profile?id={{avator.id}}">{{avator.firstName}} {{avator.lastName}}</a></h6>
                <span class="post-time">{{postDate}}</span>
            </div>
            {{#isMyPost}}
                <div class="post-settings-bar">
                    <span></span>
                    <span></span>
                    <span></span>
                    <div class="post-settings arrow-shape">
                        <ul>
                            <li><button class="edit-post" data-id="{{postID}}">edit post</button></li>
                            <li><button class="delete-post" data-id="{{postID}}">delete post</button></li>
                        </ul>
                    </div>
                </div>
            {{/isMyPost}}


        </div>
        <!-- post title start -->
        <div class="post-content " >
            <p class="post-desc " id="post-description-{{postID}}">
                {{description}}
            </p>
            <p class="post-desc">
                <b>Travelling</b> From : <b> <u class="weather" id="post-departureAddress-{{postID}}"> {{depAddress}}</u></b> To :  <b> <u class="weather" id="post-destAddress-{{postID}}"> {{desAddress}}</u></b>
            </p>
            {{#isAnyImage}}

            <div class="post-thumb-gallery img-gallery">
                <div class="row no-gutters">
                    {{#each this.images}}
<%--                        <c:if test="${fn:length(images)>=2 && fn:length(images)<=6}">--%>
<%--                            <div class="col-6">--%>
<%--                        </c:if>--%>
                        <figure class="post-thumb img-popup">
                            <a href="images/post/post-large-{{largeImage url}}">
                                <img src="{{url}}" alt="post image">
                            </a>
                        </figure>
<%--                        <c:if test="${fn:length(images)>=2 && fn:length(images)<=6}">--%>
<%--                            </div>--%>
<%--                        </c:if>--%>
                    {{/each}}
                </div>
            </div>

            {{/isAnyImage}}

            <div class="post-meta">
                <button class="post-meta-like">
                    {{#isLiked}}
                        <button class="like-button click-on-like"  style="margin-left: 0; padding: 0 10px; float: left" data-isliked="true" >
                            <img class="heart" src="/images/icons/heart.png" alt="">
                            <img class="heart-color liked " src="/images/icons/heart-color.png" alt="" style="margin-left: 12px;">
                        </button>
                    {{else}}
                        <button class="like-button click-on-like"   style="margin-left: 0; padding: 0 10px; float: left" data-isliked="false" >
                            <img class="heart" src="/images/icons/heart.png" alt="">
                            <img class="heart-color " src="/images/icons/heart-color.png" alt="" style="margin-left: 12px;">
                        </button>
                    {{/isLiked}}
                    <button class="like-button show-liked-dialog">
                        <span>
                            {{displayLikedMessage this}}
                        </span>
                        <strong>
                             {{likeCount this}}
                        </strong>
                    </button>
                </button>
                <ul class="comment-share-meta">
                    <li>
                        <button class="post-comment">
                            <i class="bi bi-chat-bubble"></i>
                            <span class="total-comment-{{postID}}">
                                {{commentCount this}}
                            </span>
                        </button>
                    </li>
                </ul>
            </div>
        </div>
        <!-- List of commant Box Start  -->
            {{#isAnyComment}}
                 <div class="commant-box hide frnd-search-inner custom-scroll ps ps--active-y" style="height: auto;">
            {{else}}
                <div class="hidden-commant-box hide frnd-search-inner custom-scroll ps ps--active-y" style="height: auto; display: none;">
            {{/isAnyComment}}

                <h4 class="widget-title"> Comments </h4>
                <ul class="comment-box-{{postID}}">
                    <li class="d-flex align-items-center profile-active comment-item-{{postID}}" style="display: none!important;">
                        <!-- profile picture end -->
                        <div class="profile-thumb ">
                            <a href="/profile?id={{avator}}">
                                <figure class="profile-thumb-small">
                                    <img src="{{avator.profileUrl}}" alt="profile picture">
                                </figure>
                            </a>
                        </div>
                        <!-- profile picture end -->
                        <div class="posted-author">
                            <h6 class="author"><span></span>
                                <button class="deletecomment" data-commentid="{{id}}">
                                    delete
                                </button>
                            </h6>
                            <p>Nth</p>
                        </div>
                    </li>
                    {{#each this.comments}}

                        <li class="d-flex align-items-center profile-active">
                            <!-- profile picture end -->
                            <div class="profile-thumb ">
                                <a href="/profile?id={{avator.id}}">
                                    <figure class="profile-thumb-small">
                                        <img src="{{avator.profileUrl}}" alt="profile picture">
                                    </figure>
                                </a>
                            </div>
                            <!-- profile picture end -->
                            <div class="posted-author">
                                <h6 class="author">{{fullName avator}}

                                    {{#isMyComment}}
                                        <button class="deletecomment" data-commentid="{{comment.id}}">
                                            delete
                                        </button>
                                    {{/isMyComment}}
                                </h6>
                                <p>{{commentContent}}</p>
                            </div>
                        </li>
                    {{/each}}

                </ul>
                <div class="ps__rail-x" style="left: 0px; bottom: -101px;">
                    <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                </div>
                <div class="ps__rail-y" style="top: 104px; height: 350px; right: 2px;">
                    <div class="ps__thumb-y" tabindex="0" style="top: 81px; height: 269px;"></div>
                </div>
            </div>
            <!-- End List of commant Box  -->

            <!-- Start Liked Box  -->

            {{#isAnyReaction}}
            <div class="liked-box frnd-search-inner custom-scroll ps ps--active-y" style="height: auto;">
            {{else}}
            <div class="hidden-liked-box frnd-search-inner custom-scroll ps ps--active-y" style="height: auto;display: none;">
            {{/isAnyReaction}}
                    <h4 class="widget-title"> Liked By </h4>
                    <ul>
                        {{#each this.reactions}}

                            <li class="d-flex align-items-center profile-active">
                                <!-- profile picture end -->
                                <div class="profile-thumb ">
                                    <a href="/profile?id={{avator.id}}">
                                        <figure class="profile-thumb-small">
                                            <img src="{{avator.profileUrl}}" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->
                                <div class="posted-author">
                                    <h6 class="author">{{fullName avator}}</h6>
                                </div>
                            </li>
                        {{/each}}
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
                            <a href="profile?id={{../loginAvator.id}}">
                                <figure class="profile-thumb-middle">
                                    <img src="{{../loginAvator.profileUrl}}" alt="profile picture">
                                </figure>
                            </a>
                        </div>
                        <!-- profile picture end -->
                        <!-- share content box start -->
                        <div class="share-content-box w-100">
                            <form class="share-text-box" method="post">
                                <textarea name="share" class="share-text-field txt-comment" placeholder="Write a comment" spellcheck="false"></textarea>
                                <grammarly-extension style="position: absolute; top: 0px; left: 0px; pointer-events: none; z-index: auto;" class="_1KJtL"></grammarly-extension>
                                <button class="btn-share btn-comment" type="button" >Comment</button>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Commant Box End -->
            </div>
            <!-- post status end -->
    {{/each}}

</script>

<script id="commentTemplate" type="text/x-handlebars-template">
    <li class="d-flex align-items-center profile-active myLikeList">
        <!-- profile picture end -->
        <div class="profile-thumb ">
            <a href="/profile?id={{id}}">
                <figure class="profile-thumb-small">
                    <img src="{{url}}" alt="profile picture">
                </figure>
            </a>
        </div>
        <!-- profile picture end -->
        <div class="posted-author">
            <h6 class="author">{{fullName}}</h6>
        </div>
    </li>
</script>
