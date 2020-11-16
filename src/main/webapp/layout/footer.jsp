<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script>

    $(document).ready(function () {
        $("#myFollowersList").click(function (e) {
            e.preventDefault();
            $.ajax({
                type: "GET",
                url: "FooterTravelersServlet",
                data: {
                    "currentUserID": "2" // accept this from session
                },
                success: function (responseText) {
                    alert(responseText);
                },
                error: function () {
                    alert('error');
                }
            });
        });


        $("#myFolloweesList").click(function (e) {
            e.preventDefault();
            $.ajax({
                type: "GET",
                url: "FooterTravelersServlet",
                data: {
                    "currentUserID": "2" // accept this from session
                },
                success: function (responseText) {
                    alert(responseText);
                },
                error: function () {
                    alert('error');
                }
            });
        });


    });


</script>


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
                                <%--                                <form class="search-box" action="<%=request.getContextPath()%>/FooterTravellers?currentUserID=2">--%>
                                <%--                                    <button style="width:100%" class="btn-share show-your-followers" id="myFollowersList" type="button">Your--%>
                                <%--                                        Followers--%>
                                <%--                                    </button>--%>
                                <%--                                </form>--%>

                                <button style="width:100%" class="btn-share show-your-followers" id="myFollowersList"
                                        type="button">Your
                                    Followers
                                </button>

                                <%--                                     <a style="width:100%" class="btn-share show-your-followers" id="myFollowersList" type="button"--%>
                                <%--                                       href="<%=request.getContextPath()%>/FooterTravellers?currentUserID=2">Your--%>
                                <%--                                        Followers--%>
                                <%--                                    </a>--%>


                            </div>
                            <div class="friend-search-list l1" id="follower-list">
                                <div class="frnd-search-title">
                                    <button class="frnd-search-icon">
                                    </button>
                                    <p>Your Followers</p>
                                    <button class="close-btn" data-close="l1"><i class="flaticon-cross-out"></i>
                                    </button>
                                </div>
                                <div class="frnd-search-inner custom-scroll">
                                    <ul>

                                        <c:forEach var="flwrs" items="${myFollowersList}">
                                            <c:choose>
                                                <c:when test="${flwrs.getIsFollwing()}">
                                                    <c:set var="flwrButtonName" scope="session" value="Following"/>
                                                    <c:set var="flwrFontWeight" scope="session" value="bold"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="flwrButtonName" scope="session" value="Follow"/>
                                                    <c:set var="flwrFontWeight" scope="session" value="normal"/>
                                                </c:otherwise>

                                            </c:choose>
                                            <li class="d-flex align-items-center profile-active">
                                                <!-- profile picture end -->
                                                <div class="profile-thumb ">
                                                    <a href="#">
                                                        <figure class="profile-thumb-small">
                                                            <img src="${flwrs.getPicturePath().toString()}"
                                                                 alt="profile picture">
                                                        </figure>
                                                    </a>
                                                </div>
                                                <!-- profile picture end -->
                                                <div class="posted-author">
                                                    <h6 class="author posted-author">
                                                        <a href="<%=request.getContextPath()%>/profile?id=${flwrs.getUserID()}">
                                                                ${flwrs.getFirstName().toString()} ${flwrs.getLastName().toString()}
                                                        </a>

<%--                                                        <button class="add-frnd" id="${flwrs.getUserID()}"--%>
<%--                                                                style="font-weight: ${flwrFontWeight}">${flwrButtonName}--%>
<%--                                                        </button>--%>
                                                    </h6>


                                                </div>
                                            </li>

                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card card-small mb-0 active-profile-wrapper">
                            <div class="active-profiles-wrapper">
                                <div class="active-profile-carousel slick-row-20 slick-arrow-style">
                                    <!-- profile picture end -->
                                    <div class="single-slide">
                                        <div class="profile-thumb profile-active">
                                            <a href="#">
                                                <figure class="profile-thumb-small">
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
                                                <figure class="profile-thumb-small">
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
                                                <figure class="profile-thumb-small">
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
                                                <figure class="profile-thumb-small">
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
                                                <figure class="profile-thumb-small">
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
                                                <figure class="profile-thumb-small">
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
                                                <figure class="profile-thumb-small">
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
                                                <figure class="profile-thumb-small">
                                                    <img src="images/profile/profile-small-6.jpg" alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- profile picture end -->
                                    <!-- profile picture end -->
                                    <div class="single-slide">
                                        <div class="profile-thumb profile-active">
                                            <a href="javascript:void(0)">
                                                <figure class="profile-thumb-small">
                                                    <img src="images/profile/profile-small-7.jpg" alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- profile picture end -->
                                    <!-- profile picture end -->
                                    <div class="single-slide">
                                        <div class="profile-thumb profile-active">
                                            <a href="javascript:void(0)">
                                                <figure class="profile-thumb-small">
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
                                                <figure class="profile-thumb-small">
                                                    <img src="images/profile/profile-small-9.jpg" alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- profile picture end -->
                                    <!-- profile picture end -->
                                    <div class="single-slide">
                                        <div class="profile-thumb profile-active">
                                            <a href="javascript:void(0)">
                                                <figure class="profile-thumb-small">
                                                    <img src="images/profile/profile-small-10.jpg"
                                                         alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- profile picture end -->
                                    <!-- profile picture end -->
                                    <div class="single-slide">
                                        <div class="profile-thumb profile-active">
                                            <a href="javascript:void(0)">
                                                <figure class="profile-thumb-small">
                                                    <img src="images/profile/profile-small-11.jpg"
                                                         alt="profile picture">
                                                </figure>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- profile picture end -->
                                </div>
                            </div>
                        </div>

                        <div class="footer-card footer-card-override position-relative">
                            <div class="friends-search">

                                    <button style="width:100%" class="btn-share show-your-following" type="button" id="myFolloweesList">You
                                        Followings
                                    </button>

                            </div>
                            <div class="friend-search-list l2" id="following-list">
                                <div class="frnd-search-title">
                                    <button class="frnd-search-icon">
                                    </button>
                                    <p>You Followings</p>
                                    <button class="close-btn" data-close="l2"><i class="flaticon-cross-out"></i>
                                    </button>
                                </div>
                                <div class="frnd-search-inner custom-scroll">
                                    <ul>
                                        <c:forEach var="flwees" items="${myFolloweesList}">
                                            <c:choose>
                                                <c:when test="${flwees.getIsFollwing()}">
                                                    <c:set var="flweesButtonName" scope="session" value="Following"/>
                                                    <c:set var="flweesFontWeight" scope="session" value="bold"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="flweesButtonName" scope="session" value="Follow"/>
                                                    <c:set var="flweesFontWeight" scope="session" value="normal"/>
                                                </c:otherwise>

                                            </c:choose>
                                            <li class="d-flex align-items-center profile-active">
                                                <!-- profile picture end -->
                                                <div class="profile-thumb ">
                                                    <a href="#">
                                                        <figure class="profile-thumb-small">
                                                            <img src="${flwees.getPicturePath().toString()}"
                                                                 alt="profile picture">
                                                        </figure>
                                                    </a>
                                                </div>
                                                <!-- profile picture end -->
                                                <div class="posted-author">
                                                    <h6 class="author" posted-author>
                                                        <a href="<%=request.getContextPath()%>/profile?id=${flwees.getUserID()}">
                                                                ${flwees.getFirstName().toString()} ${flwees.getLastName().toString()}
                                                        </a>

<%--                                                        <button class="add-frnd" id="${flwees.getUserID()}"--%>
<%--                                                                style="font-weight: ${flweesFontWeight}">${flweesButtonName}</button>--%>
                                                    </h6>

                                                </div>
                                            </li>

                                        </c:forEach>
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
<!-- Main JS -->
<script src="js/main.js"></script>
</body>
<!-- Mirrored from demo.hasthemes.com/ITravel-preview/ITravel/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 11 Nov 2020 03:43:14 GMT -->

</html>