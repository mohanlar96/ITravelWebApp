<%--
  Created by IntelliJ IDEA.
  User: Santiago
  Date: 13/11/2020
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
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
                    <div class="col-lg-2 col-md-3 d-none d-md-block">
                        <div class="profile-edit-panel">
                            <button class="edit-btn">GO BACK</button>
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
                            <h4 class="widget-title">EDIT PROFILE: ${prof.fullName}</h4>
                            <div class="widget-body">
                                Remember to press 'Save' button in the section(s) you update information.
                            </div>
                        </div>
                        <!-- widget single item end -->
                    </aside>
                </div>
                <!-- LEFT ASIDE END -->
                <!-- CENTRAL PART START -->
                <style>
                    .refname{
                        color:#dc4734;
                        font-weight:500;
                        padding-right: 10px;
                    }
                    .answer{
                        padding-left: 1px;
                    }
                    .lightred{
                        background-color:#ebccd1;
                        display: block;
                        block-size: max-content;
                    }
                    .btn-sec {
                        position: absolute;
                        top: 9px;
                        right: 9px;
                        line-height: 1;
                        padding: 11px 25px;
                        border-radius: 40px;
                        color: #fff;
                        font-size: 12px;
                        font-weight: 700;
                        text-transform: uppercase;
                        background-color: #dc4734;
                    }
                </style>
                <script>
                    $(document).ready(function(){
                        $("#users").on('show.bs.modal', function(){
                            $("#email_m").val($("#email").text());
                            $("#usern_m").val($("#usern").text());
                            $("#passw_m").val($("#passw").text());
                            $("#bio_m").val($("#bio").text());
                        });
                        $("#names").on('show.bs.modal', function(){
                            $("#fname_m").val($("#fname").text());
                            $("#mname_m").val($("#mname").text());
                            $("#lname_m").val($("#lname").text());
                            $("#gender").text() === "M" ? $("#gender_m").val("M") : $("#gender_m").val("F");
                            $("#job_m").val($("#job").text());
                            $("#cityb_m").val($("#cityb").text());
                            $("#dateb_m").val($("#dateb").text());
                        });
                        $("#addresses").on('show.bs.modal', function(){
                            $("#state_m").val($("#state").text());
                            $("#city_m").val($("#city").text());
                            $("#stre1_m").val($("#stre1").text());
                            $("#stre2_m").val($("#stre2").text());
                            $("#zipc_m").val($("#zipc").text());
                        });
                    });
                    function xUsers(){
                        $("#email").text($("#email_m").val());
                        $("#usern").text($("#usern_m").val());
                        $("#passw").text($("#passw_m").val());
                        $("#bio").text($("#bio_m").val());
                    }
                    function xNames(){
                        $("#fname").text($("#fname_m").val());
                        $("#mname").text($("#mname_m").val());
                        $("#lname").text($("#lname_m").val());
                        $("#gender").text($("#gender_m").val());
                        $("#job").text($("#job_m").val());
                        $("#cityb").text($("#cityb_m").val());
                        $("#dateb").text(validYear($("#dateb_m").val()));
                    }
                    function xAddresses(){
                        $("#state").text($("#state_m").val());
                        $("#city").text($("#city_m").val());
                        $("#stre1").text($("#stre1_m").val());
                        $("#stre2").text($("#stre2_m").val());
                        $("#zipc").text($("#zipc_m").val());
                    }
                    function validYear(newdate){
                        if(parseInt(newdate.substring(0,4))>2100) return "2100-12-31";
                        else if(parseInt(newdate.substring(0,4))<1880) return "1880-01-01";
                        else return newdate;
                    }
                </script>
                <div class="col-lg-6 order-1 order-lg-2">
                    <!-- USER START -->
                    <div class="card card-small">
                        <div class="share-box-inner">
                            <!-- info start -->
                            <div class="share-content-box w-100">
                                <form data-toggle="modal" data-target="#users">
                                    <div class="share-text-field" aria-disabled="true">
                                        <label class="refname">ACCOUNT INFORMATION</label>
                                    </div>
                                    <div id="email_s" class="share-text-field" aria-disabled="true">
                                        <label class="refname">Email</label><span id="email" class="answer">ABC</span>
                                    </div>
                                    <div id="usern_s" class="share-text-field" aria-disabled="true">
                                        <label class="refname">Username</label><span id="usern" class="answer">ABC</span>
                                    </div>
                                    <div id="passw_s" class="share-text-field" aria-disabled="true">
                                        <label class="refname">Password</label><span id="passw" class="answer">ABC</span>
                                    </div>
                                    <div id="bio_s" class="share-text-field" aria-disabled="true">
                                        <label class="refname">Biography</label><span id="bio" class="answer">ABC</span>
                                    </div>
                                    <input class="btn-sec" type="submit" value="save"/>
                                </form>
                            </div>
                            <!-- info end -->
                            <!-- Modal start -->
                            <div class="modal fade" id="users" aria-labelledby="users">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">EDIT ACCOUNT INFORMATION</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body custom-scroll">
                                            <!-- UPDATING PART START -->
                                            <label for="email_m" class="refname">Email</label><input type="text" id="email_m" name="email_m" maxlength="50" required class="top-search-field lightred"/>
                                            <label for="usern_m" class="refname">Username</label><input type="text" id="usern_m" name="usern_m" maxlength="20" required class="top-search-field lightred"/>
                                            <label for="passw_m" class="refname">Password</label><input type="text" id="passw_m" name="passw_m" maxlength="50" required class="top-search-field lightred"/>
                                            <label for="bio_m" class="refname">Biography</label><textarea id="bio_m" name="bio_m" maxlength="200" placeholder="Describe yourself briefly..." rows="4" class="top-search-field lightred"></textarea>
                                            <!-- UPDATING PART END   -->
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="post-share-btn" data-dismiss="modal">cancel</button>
                                            <button type="button" class="post-share-btn" onclick="xUsers()" data-dismiss="modal">next</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal end -->
                        </div>
                    </div>
                    <!-- USER END -->

                    <!-- PERSONAL INFORMATION START -->
                    <div class="card card-small">
                        <div class="share-box-inner">
                            <!-- info start -->
                            <div class="share-content-box w-100">
                                <form>
                                    <div class="share-text-field" aria-disabled="true" data-toggle="modal" data-target="#names">
                                        <label class="refname">PERSONAL INFORMATION</label>
                                    </div>
                                    <div id="fname_s" class="share-text-field" aria-disabled="true" data-toggle="modal" data-target="#names">
                                        <label class="refname">First Name</label><span id="fname" class="answer">ABC</span>
                                    </div>
                                    <div id="mname_s" class="share-text-field" aria-disabled="true" data-toggle="modal" data-target="#names">
                                        <label class="refname">Middle Name</label><span id="mname" class="answer">ABC</span>
                                    </div>
                                    <div id="lname_s" class="share-text-field" aria-disabled="true" data-toggle="modal" data-target="#names">
                                        <label class="refname">Last Name</label><span id="lname" class="answer">ABC</span>
                                    </div>
                                    <div id="gender_s" class="share-text-field" aria-disabled="true" data-toggle="modal" data-target="#names">
                                        <label class="refname">Gender</label><span id="gender" class="answer">F</span>
                                    </div>
                                    <div id="job_s" class="share-text-field" aria-disabled="true" data-toggle="modal" data-target="#names">
                                        <label class="refname">Job</label><span id="job" class="answer">ABC</span>
                                    </div>
                                    <div id="cityb_s" class="share-text-field" aria-disabled="true" data-toggle="modal" data-target="#names">
                                        <label class="refname">City of Birth</label><span id="cityb" class="answer">ABC</span>
                                    </div>
                                    <div id="dateb_s" class="share-text-field" aria-disabled="true" data-toggle="modal" data-target="#names">
                                        <label class="refname">Date of Birth</label><span id="dateb" class="answer">1998-09-30</span>
                                    </div>
                                    <input class="btn-sec" type="submit" value="save"/>
                                </form>
                            </div>
                            <!-- info end -->
                            <!-- Modal start -->
                            <div class="modal fade" id="names" aria-labelledby="names">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">EDIT PERSONAL INFORMATION</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body custom-scroll">
                                            <!-- UPDATING PART START -->
                                            <label for="fname_m" class="refname">First name</label><input type="text" id="fname_m" name="fname_m" maxlength="50" required class="top-search-field lightred"/>
                                            <label for="mname_m" class="refname">Middle name</label><input type="text" id="mname_m" name="mname_m" maxlength="50" class="top-search-field lightred"/>
                                            <label for="lname_m" class="refname">Last name</label><input type="text" id="lname_m" name="lname_m" maxlength="50" class="top-search-field lightred"/>
                                            <label for="gender_m" class="refname">Gender</label>
                                            <select id="gender_m" name="gender_m" class="top-search-field lightred">
                                                <option value="M">M</option>
                                                <option value="F" selected>F</option>
                                            </select>
                                            <div> </div>
                                            <label for="job_m" class="refname">Job</label><input type="text" id="job_m" name="job_m" maxlength="80" class="top-search-field lightred"/>
                                            <label for="cityb_m" class="refname">City of birth</label><input type="text" id="cityb_m" name="cityb_m" maxlength="50" required class="top-search-field lightred"/>
                                            <label for="dateb_m" class="refname">Date of birth</label><input type="date" id="dateb_m" name="dateb_m" required class="top-search-field lightred"/>
                                            <!-- UPDATING PART END   -->
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="post-share-btn" data-dismiss="modal">cancel</button>
                                            <button type="button" class="post-share-btn" onclick="xNames()" data-dismiss="modal">next</button><!--inside func: ('#fname_m','#fname')-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal end -->
                        </div>
                    </div>
                    <!-- PERSONAL INFORMATION END -->

                    <!-- ADDRESS START -->
                    <div class="card card-small">
                        <div class="share-box-inner">
                            <!-- info start -->
                            <div class="share-content-box w-100">
                                <form data-toggle="modal" data-target="#addresses">
                                    <div class="share-text-field" aria-disabled="true">
                                        <label class="refname">ADDRESS</label>
                                    </div>
                                    <div id="state_s" class="share-text-field" aria-disabled="true">
                                        <label class="refname">State</label><span id="state" class="answer">ABC</span>
                                    </div>
                                    <div id="city_s" class="share-text-field" aria-disabled="true">
                                        <label class="refname">City</label><span id="city" class="answer">ABC</span>
                                    </div>
                                    <div id="stre1_s" class="share-text-field" aria-disabled="true">
                                        <label class="refname">Street 1</label><span id="stre1" class="answer">ABC</span>
                                    </div>
                                    <div id="stre2_s" class="share-text-field" aria-disabled="true">
                                        <label class="refname">Street2</label><span id="stre2" class="answer">ABC</span>
                                    </div>
                                    <div id="zipc_s" class="share-text-field" aria-disabled="true">
                                        <label class="refname">ZIP Code</label><span id="zipc" class="answer">ABC</span>
                                    </div>
                                    <input class="btn-sec" type="submit" value="save"/>
                                </form>
                            </div>
                            <!-- info end -->
                            <!-- Modal start -->
                            <div class="modal fade" id="addresses" aria-labelledby="addresses">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">EDIT ADDRESS</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body custom-scroll">
                                            <!-- UPDATING PART START -->
                                            <label for="state_m" class="refname">State</label>
                                            <select id="state_m" name="state_m" required class="top-search-field lightred">
                                                <option value="states">READ DB</option>
                                            </select>
                                            <div> </div>
                                            <label for="city_m" class="refname">City</label>
                                            <select id="city_m" name="city_m" required class="top-search-field lightred">
                                                <option value="cities">READ DB, IMPORTANT STATE</option>
                                            </select>
                                            <div> </div>
                                            <label for="stre1_m" class="refname">Street 1</label><input type="text" id="stre1_m" name="stre1_m" maxlength="50" class="top-search-field lightred"/>
                                            <label for="stre2_m" class="refname">Street 2</label><input type="text" id="stre2_m" name="stre2_m" maxlength="50" class="top-search-field lightred"/>
                                            <label for="zipc_m" class="refname">ZIP Code</label><input type="text" id="zipc_m" name="zipc_m" maxlength="10" required class="top-search-field lightred"/>
                                            <!-- UPDATING PART END   -->
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="post-share-btn" data-dismiss="modal">cancel</button>
                                            <button type="button" class="post-share-btn" onclick="xAddresses()" data-dismiss="modal">next</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal end -->
                        </div>
                    </div>
                    <!-- ADDRESS END -->
                </div>
                <!-- CENTRAL PART END -->
            </div>
        </div>
        <!-- CONTAINER END -->
    </div>
</main>

<jsp:include page="layout/footer.jsp" />
