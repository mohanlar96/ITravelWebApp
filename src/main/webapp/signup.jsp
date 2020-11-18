<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!doctype html>
<html class="no-js" lang="en">
<!-- Mirrored from demo.hasthemes.com/adda-preview/adda/signup.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 10 Nov 2020 15:36:19 GMT -->

<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>iTravel login</title>
  <meta name="robots" content="noindex, follow" />
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">

  <!-- CSS
	============================================ -->
  <!-- google fonts -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900" rel="stylesheet">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="css/vendor/bootstrap.min.css">
  <!-- Icon Font CSS -->
  <link rel="stylesheet" href="css/vendor/bicon.min.css">
  <!-- Flat Icon CSS -->
  <link rel="stylesheet" href="css/vendor/flaticon.css">
  <!-- audio & video player CSS -->
  <link rel="stylesheet" href="css/plugins/plyr.css">
  <!-- Slick CSS -->
  <link rel="stylesheet" href="css/plugins/slick.min.css">
  <!-- nice-select CSS -->
  <link rel="stylesheet" href="css/plugins/nice-select.css">
  <!-- perfect scrollbar css -->
  <link rel="stylesheet" href="css/plugins/perfect-scrollbar.css">
  <!-- light gallery css -->
  <link rel="stylesheet" href="css/plugins/lightgallery.min.css">
  <!-- Main Style CSS -->
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/signup.css">
</head>

<body class="bg-transparent">

  <main>
    <div class="main-wrapper pb-0 mb-0">
      <div class="timeline-wrapper">
        <div class="timeline-header">
          <div class="container-fluid p-0">
            <div class="row no-gutters align-items-center">
              <div class="col-lg-6">
                <div class="timeline-logo-area d-flex align-items-center">
                  <div class="timeline-logo">
                    <a href="home">
                      <img src="images/logo/logo-new.jpg" alt="timeline logo">
                    </a>
                  </div>
                  <div class="timeline-tagline">
                    <h6 class="tagline">Life is either a daring adventure or nothing at all</h6>
                  </div>
                </div>
              </div>
              <div class="col-lg-6">
                <form action="login" method="POST">
                  <div class="login-area">
                    <div class="row align-items-center">
                      <div class="col-12 col-sm">
                        <input type="text" name="email" placeholder="Email or Userame" class="single-field">
                      </div>
                      <div class="col-12 col-sm">
                        <input type="password" name="password" placeholder="Password" class="single-field">
                      </div>
                      <div class="col-12 col-sm-auto">
                        <button type="submit" class="login-btn" id="loginBtn">Login</button>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="timeline-page-wrapper">
          <div class="container-fluid p-0">
            <div class="row no-gutters">
              <div class="col-lg-6 order-2 order-lg-1">
                <div class="timeline-bg-content bg-img" data-bg="images/timeline/home-timeline.jpg">
                  <h3 class="timeline-bg-title">Let's see what's happening to you and your world. Welcome in <span>iTravel</span>.</h3>
                </div>
              </div>
              <div class="col-lg-6 order-2 order-lg-1">
                <div class="alert alert-danger" role="alert" id="loginErrorBlock" <c:if test="${param.error eq null}">style="visibility: hidden"</c:if> >
                  <c:choose>
                    <c:when test="${fn:startsWith(param.error,'notActive')}">
                      User is deactivated, contact admin.
                    </c:when>
                    <c:when test="${fn:startsWith(param.error,'wrongPass')}">
                      Password is wrong.
                    </c:when>
                    <c:when test="${fn:startsWith(param.error,'notActive')}">
                      There no user exists.
                    </c:when>
                    <c:otherwise>
                      Something is wrong.
                    </c:otherwise>
                  </c:choose>
                </div>
                <div class="col-lg-12 order-1 order-lg-2 d-flex align-items-center justify-content-center">
                  <div class="signup-form-wrapper">
                    <div class="signup-inner text-center">
                      <h3 class="title">Welcome to iTravel</h3>
                      <form id="signupForm" class="signup-inner--form">
                        <div class="row">
                          <div class="col-12">
                            <div class="form-group">
                              <input type="email" class="single-field form-control" id="emailInput" placeholder="Email"
                                pattern="[a-z0-9._+\-]+@[a-z0-9.\-]+\.[a-z]{2,3}">
                              <div class="invalid-feedback" id="emailError">invalid email or it already exists</div>
                              <div class="valid-feedback"></div>
                            </div>
                          </div>
                          <div class="col-md-6">
                            <!-- <input type="text" class="single-field" name="firstName" placeholder="First Name" pattern="[A-Z][a-z]{1,}"> -->

                            <div class="form-group">
                              <input type="text" class="single-field form-control" id="firstNameInput"
                                placeholder="First name" pattern="[A-Z][a-z]{1,}">
                              <div class="invalid-feedback">Not valid name</div>
                              <div class="valid-feedback"></div>
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group">
                              <input type="text" class="single-field form-control" id="lastNameInput"
                                placeholder="Last Name" pattern="[A-Z][a-z]{1,}">
                              <div class="invalid-feedback">Not valid name</div>
                              <div class="valid-feedback"></div>
                            </div>

                          </div>
                          <div class="col-12">
                            <div class="form-group">
                              <input type="password" class="single-field form-control " id="passwordInput"
                                name="password" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"
                                placeholder="Password">
                              <div class="invalid-feedback">Minimum 6 chars. At least 1 capital, 1 number, 1 small
                                characters</div>
                              <div class="valid-feedback"></div>
                            </div>
                          </div>
                          <div class="col-md-6">
                            <select class="nice-select form-control" placeholder="gender" id="genderInput"
                              name="sortby">
                              <option value="trending">Gender</option>
                              <option value="M">M</option>
                              <option value="F">F</option>
                            </select>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group">
                              <input class="single-field form-control" id="dateInput" name="date"
                                placeholder="MM/DD/YYYY" type="text" />
                              <div class="invalid-feedback">Must be older than 14</div>
                              <div class="valid-feedback"></div>
                            </div>
                          </div>
                          <!-- <input type="text" class="single-field" pattern="^(19|20)\d{2}$" placeholder="Birth Year"> -->
                          <div class="col-sm-4">
                            <div class="form-group">
                              <input type="text" class="single-field form-control" name="city" id="cityInput"
                                placeholder="City">
                              <div class="invalid-feedback">Not valid name</div>
                              <div class="valid-feedback"></div>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="form-group">
                              <input type="text" class="single-field form-control" name="state" id="stateInput"
                                placeholder="State">
                              <div class="invalid-feedback">Not valid name</div>
                              <div class="valid-feedback"></div>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="form-group">
                              <input type="text" class="single-field form-control" name="zipcode" id="zipcodeInput"
                                placeholder="Zip code">
                              <div class="invalid-feedback">Not valid name</div>
                              <div class="valid-feedback"></div>
                            </div>
                          </div>
                          <div class="col-sm-12">
                            <div class="form-group">
                              <input type="text" class="single-field form-control" name="street" id="streetInput"
                                placeholder="Street">
                              <div class="invalid-feedback">Not valid name</div>
                              <div class="valid-feedback"></div>
                            </div>
                          </div>
                          <div class="col-12">
                            <button type="button" id="signupBtn" class="submit-btn">Create Account</button>
                          </div>
                        </div>
                        <h6 class="terms-condition">I have read & accepted the <a href="#">terms of use</a></h6>
                      </form>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>

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
  <!-- Bootstrap Date-Picker Plugin -->
  <script type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
  <script src="js/my.js"></script>
  
</body>


<!-- Mirrored from demo.hasthemes.com/adda-preview/adda/signup.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 10 Nov 2020 15:36:19 GMT -->

</html>