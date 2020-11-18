<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



<!-- Scroll to top start -->

<div class="scroll-top not-visible">
    <i class="bi bi-finger-index"></i>
</div>
<!-- Scroll to Top End -->
<!-- footer area start -->
<footer class="d-none d-lg-block">
    <div class="footer-area reveal-footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="footer-wrapper">
                        <div class="footer-card footer-card-override position-relative">
                            <div class="friends-search">
                                <input type="hidden" id="hidden-session-user-id"
                                    value="<%=session.getAttribute("userId")%>">
                                <%--   Session needed here in the hidden-button value--%>

                                <input type="hidden" id="avatar-id-hidden"
                                       value="<%=request.getParameter("id")%>">

                                <button style="width:100%" class="btn-share show-your-followers footerBtn"
                                        name="Followers"
                                        type="button">Followers
                                </button>

                            </div>
                            <div class="friend-search-list l1" id="follower-list">
                                <div class="frnd-search-title">
                                    <button class="frnd-search-icon">
                                    </button>
                                    <p>Followers</p>
                                    <button class="close-btn" data-close="l1"><i class="flaticon-cross-out"></i>
                                    </button>
                                </div>
                                <div class="frnd-search-inner custom-scroll">
                                    <ul class="followers-ul" id="Followers">
                                        <%--   ======================================================= OUTPUT OF FOLLOWERS HERE ================================================--%>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="card card-small mb-0 active-profile-wrapper">
                            <div class="active-profiles-wrapper">
                                <div class="active-profile-carousel slick-row-20 slick-arrow-style">
                                    <!-- profile picture end -->
                                    <div class="single-slide" id="footer-images">

                                    </div>

                                    <!-- profile picture end -->
                                </div>
                            </div>
                        </div>

                        <div class="footer-card footer-card-override position-relative">
                            <div class="friends-search">

                                <button style="width:100%" class="btn-share show-your-following footerBtn"
                                        type="button" name="Followees"
                                        id="myFolloweesList"> Followees
                                </button>

                            </div>
                            <div class="friend-search-list l2" id="following-list">
                                <div class="frnd-search-title">
                                    <button class="frnd-search-icon">
                                    </button>
                                    <p>Followees</p>
                                    <button class="close-btn" data-close="l2"><i class="flaticon-cross-out"></i>
                                    </button>
                                </div>
                                <div class="frnd-search-inner custom-scroll">
                                    <ul class="my-followees" id="Followees">
                                        <%--                                       ======================================================= OUTPUT OF FOLOWEES HERE ================================================--%>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- footer area end -->
<!-- footer area start -->
<footer class="d-block d-lg-none">
    <div class="footer-area reveal-footer">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="mobile-footer-inner d-flex">
                        <div class="mobile-frnd-search">
                            <button class="search-toggle-btn"><i class="flaticon-search"></i></button>
                        </div>
                        <div class="mob-frnd-search-inner">
                            <form class="mob-frnd-search-box d-flex">
                                <input type="text" placeholder="List Your" class="mob-frnd-search-field">
                            </form>
                        </div>
                        <div class="card card-small mb-0 active-profile-mob-wrapper">
                            <div class="active-profiles-mob-wrapper slick-row-10">
                                <div class="active-profile-mobile">
                                    <!-- profile picture end -->
                                    <div class="single-slide">
                                        <div class="profile-thumb profile-active">
                                            <a href="#">
                                                <figure class="profile-thumb-small profile-active">
                                                    <img src="images/profile/profile-small-1.jpg" alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- profile picture end -->
                                    <!-- profile picture end -->
                                    <div class="single-slide">
                                        <div class="profile-thumb profile-active">
                                            <a href="javascript:void(0)">
                                                <figure class="profile-thumb-small profile-active">
                                                    <img src="images/profile/profile-small-8.jpg" alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- profile picture end -->
                                    <!-- profile picture end -->
                                    <div class="single-slide">
                                        <div class="profile-thumb profile-active">
                                            <a href="javascript:void(0)">
                                                <figure class="profile-thumb-small profile-active">
                                                    <img src="images/profile/profile-small-2.jpg" alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- profile picture end -->
                                    <!-- profile picture end -->
                                    <div class="single-slide">
                                        <div class="profile-thumb profile-active">
                                            <a href="javascript:void(0)">
                                                <figure class="profile-thumb-small profile-active">
                                                    <img src="images/profile/profile-small-3.jpg" alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- profile picture end -->
                                    <!-- profile picture end -->
                                    <div class="single-slide">
                                        <div class="profile-thumb profile-active">
                                            <a href="javascript:void(0)">
                                                <figure class="profile-thumb-small profile-active">
                                                    <img src="images/profile/profile-small-4.jpg" alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- profile picture end -->
                                    <!-- profile picture end -->
                                    <div class="single-slide">
                                        <div class="profile-thumb profile-active">
                                            <a href="javascript:void(0)">
                                                <figure class="profile-thumb-small profile-active">
                                                    <img src="images/profile/profile-small-5.jpg" alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- profile picture end -->
                                    <!-- profile picture end -->
                                    <div class="single-slide">
                                        <div class="profile-thumb profile-active">
                                            <a href="javascript:void(0)">
                                                <figure class="profile-thumb-small profile-active">
                                                    <img src="images/profile/profile-small-9.jpg" alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- profile picture end -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- footer area end -->
<!-- JS
============================================ -->
<!-- Modernizer JS -->
<script src="js/vendor/modernizr-3.6.0.min.js"></script>
<!-- jQuery JS -->
<script src="js/vendor/jquery-3.3.1.min.js"></script>
<!-- Popper JS -->
<script src="js/vendor/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="js/vendor/bootstrap.min.js"></script>
<!-- Slick Slider JS -->
<script src="js/plugins/slick.min.js"></script>
<!-- nice select JS -->
<script src="js/plugins/nice-select.min.js"></script>
<!-- audio video player JS -->
<script src="js/plugins/plyr.min.js"></script>
<!-- perfect scrollbar js -->
<script src="js/plugins/perfect-scrollbar.min.js"></script>
<!-- light gallery js -->
<script src="js/plugins/lightgallery-all.min.js"></script>
<!-- image loaded js -->
<script src="js/plugins/imagesloaded.pkgd.min.js"></script>
<!-- isotope filter js -->
<script src="js/plugins/isotope.pkgd.min.js"></script>

<script type="text/javascript" src ="js/footer.js">   </script>

<%--just  custom for posts --%>
<script src="js/post_action.js"></script>
<%--infinite scroll--%>
<script src="js/post_scroll.js"></script>
<!-- Main JS -->
<script src="js/main.js"></script>

<c:import url="partial/post-template.jsp" />

</body>
<!-- Mirrored from demo.hasthemes.com/ITravel-preview/ITravel/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 11 Nov 2020 03:43:14 GMT -->

</html>