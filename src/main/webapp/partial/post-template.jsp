<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--    handlebar.js for handling the infinite scroll templating html--%>
<script src="js/vendor/handlebars.js"></script>


<script id="postTemplate" type="text/x-handlebars-template">
    {{#each this.posts}}
    <div class="card post" data-id="{{postID}}" data-userid="{{this.loginAvator.id}}" data-avatorurl="{{this.loginAvator.profileUrl}}"
         data-fullname="{{avator.firstName}} {{avator.lastName}}">
        <!-- post title start -->
        <div class="post-title d-flex align-items-center">
            <!-- profile picture end -->
            <div class="profile-thumb">
                <a href="profile?id=2">
                    <figure class="profile-thumb-middle">
                        <img src="images/profile/profile-midle-2.jpg" alt="profile picture">
                    </figure>
                </a>
            </div>
            <!-- profile picture end -->
            <div class="posted-author">
                <h6 class="author"><a href="profile?id=2">{{avator.firstName}} {{avator.lastName}}</a></h6>
                <span class="post-time">{{postDate}}</span>
            </div>

            <div class="post-settings-bar">
                <span></span>
                <span></span>
                <span></span>
                <div class="post-settings arrow-shape">
                    <ul>
                        <li>
                            <button class="edit-post" data-id="15">edit post</button>
                        </li>
                        <li>
                            <button class="delete-post" data-id="15">delete post</button>
                        </li>
                    </ul>
                </div>
            </div>


        </div>
        <!-- post title start -->
        <div class="post-content ">
            <p class="post-desc " id="post-description-15">
                Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,
                and a search for 'lorem ipsum' will uncover many web sites still in their infancy.
            </p>
            <p class="post-desc">
                <b>Travelling</b> From : <b> <u id="post-departureAddress-15"> CA,United States</u></b> To : <b> <u
                    id="post-destinationAddress-15"> CA,United States</u></b>
            </p>


            <div class="post-thumb-gallery img-gallery">
                <div class="row no-gutters">
                    <figure class="post-thumb img-popup">

                        <a href="images/post/post-large-1.jpg">
                            <img src="images/post/post-1.jpg" alt="post image">
                        </a>
                    </figure>


                </div>
            </div>


            <div class="post-meta">
                <button class="post-meta-like">


                </button>
                <button class="like-button click-on-like" style="margin-left: 0; padding: 0 10px; float: left"
                        data-isliked="false">
                    <img class="heart" src="/images/icons/heart.png" alt="">
                    <img class="heart-color " src="/images/icons/heart-color.png" alt="" style="margin-left: 12px;">
                </button>


                <button class="like-button show-liked-dialog">
                    <span> 0 people like this</span>
                    <strong>0</strong>
                </button>


                <ul class="comment-share-meta">
                    <li>
                        <button class="post-comment">
                            <i class="bi bi-chat-bubble"></i>
                            <span class="total-comment-15">0</span>
                        </button>
                    </li>

                </ul>
            </div>
        </div>
        <!-- List of commant Box Start  -->


        <div class="hidden-commant-box hide frnd-search-inner custom-scroll ps" style="height: auto; display: none;">


            <h4 class="widget-title"> Comments </h4>
            <ul class="comment-box-15">
                <li class="d-flex align-items-center profile-active comment-item-15" style="display: none!important;">
                    <!-- profile picture end -->
                    <div class="profile-thumb ">
                        <a href="/">
                            <figure class="profile-thumb-small">
                                <img src="/" alt="profile picture">
                            </figure>
                        </a>
                    </div>
                    <!-- profile picture end -->
                    <div class="posted-author">
                        <h6 class="author"><span></span>
                            <button class="deletecomment" data-commentid="">
                                delete
                            </button>
                        </h6>
                        <p>Nth</p>
                    </div>
                </li>

            </ul>
            <div class="ps__rail-x" style="left: 0px; bottom: -101px;">
                <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
            </div>
            <div class="ps__rail-y" style="top: 104px; height: 350px; right: 2px;">
                <div class="ps__thumb-y" tabindex="0" style="top: 81px; height: 269px;"></div>
            </div>
            <div class="ps__rail-x" style="left: 0px; bottom: 3px;">
                <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
            </div>
            <div class="ps__rail-y" style="top: 0px; right: 2px;">
                <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
            </div>
        </div>
        <!-- End List of commant Box  -->

        <div class="hidden-liked-box frnd-search-inner custom-scroll ps" style="height: auto;display: none;">


            <!-- List of like list box start -->
            <h4 class="widget-title"> Liked By </h4>
            <ul>

            </ul>
            <div class="ps__rail-x" style="left: 0px; bottom: -101px;">
                <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
            </div>
            <div class="ps__rail-y" style="top: 104px; height: 350px; right: 2px;">
                <div class="ps__thumb-y" tabindex="0" style="top: 81px; height: 269px;"></div>
            </div>
            <div class="ps__rail-x" style="left: 0px; bottom: 3px;">
                <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
            </div>
            <div class="ps__rail-y" style="top: 0px; right: 2px;">
                <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
            </div>
        </div>
        <!-- List of like list box end -->


        <!-- Commant Box Start -->
        <div class="card card-small">
            <div class="share-box-inner">
                <!-- profile picture end -->
                <div class="profile-thumb">
                    <a href="profile?id=2">
                        <figure class="profile-thumb-middle">
                            <img src="images/profile/profile-midle-2.jpg" alt="profile picture">
                        </figure>
                    </a>
                </div>
                <!-- profile picture end -->
                <!-- share content box start -->
                <div class="share-content-box w-100">
                    <form class="share-text-box" method="post">
                        <textarea name="share" class="share-text-field txt-comment" placeholder="Write a comment"
                                  spellcheck="false"></textarea>
                        <grammarly-extension
                                style="position: absolute; top: 0px; left: 0px; pointer-events: none; z-index: auto;"
                                class="_1KJtL"></grammarly-extension>
                        <button class="btn-share btn-comment" type="button">Comment</button>
                    </form>
                </div>
            </div>
        </div>
        <!-- Commant Box End -->
    </div>

    {{/each}}
</script>