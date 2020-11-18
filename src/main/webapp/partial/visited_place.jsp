<%--
  Created by IntelliJ IDEA.
  User: Mohan
  Date: 11/14/2020
  Time: 9:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

    <!-- widget single item start -->
    <div class="card widget-item">
        <h4 class="widget-title">Place You have Visited</h4>
        <h3 class="list-subtitle" style="margin-bottom: 20px;color: #dc4734; font-size: 15px;font-weight: bold;">Click on the city for Weather Info</h3>
        <div class="widget-body">

            <ul class="like-page-list-wrapper">

            <c:forEach var="place" items="${requestScope.places}">
                <c:set var="place_arr" scope="application" value="${fn:split(place,',')}"/>
                <c:set var="place_length" scope="application" value="${fn:length(place_arr)}"/>


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
                            <h3 class="list-title"><a href="#">${place_arr[place_length-1]}</a></h3>
                            <p class="list-subtitle"><a href="#">State : <b>${place_arr[place_length-2]}</b></a>
                            </p>
                            <p class="list-subtitle"><a  href="#">City : <b> <u class="weather">${place_arr[place_length-3]}</u></b></a>
                            </p>
                        </div>
                    </li>
            </c:forEach>
            <c:if test="${fn:length(requestScope.places)==0}" >
                <li class="unorder-list">
                    <!-- profile picture end -->
                    <div class="profile-thumb">
                        <a href="#">
                            <figure>
                                <img src="images/icons/sad.jpg" alt="Location">
                            </figure>
                        </a>
                    </div>
                    <!-- profile picture end -->
                    <div class="unorder-list-info">
                        <h3 class="list-title"><a href="#">NO VISITED POST</a></h3>
                        <p class="list-subtitle text-warning"><a href="#">please <b> post something</b></a>
                        </p>
                        <p class="list-subtitle"><a href="#"> let Your follower know!</a>
                        </p>
                    </div>
                </li>
            </c:if>
            </ul>
        </div>
    </div>
    <!-- widget single item end -->

