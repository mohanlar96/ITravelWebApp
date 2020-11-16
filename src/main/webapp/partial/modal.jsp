<%--
  Created by IntelliJ IDEA.
  User: Santiago
  Date: 16/11/2020
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- share content box end -->
<%--                            <script--%>
<%--                                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCneh1NGoaH33EkKQ6SltmLoqNtwbLqZ7U&callback=initAutocomplete&libraries=places&v=weekly"--%>
<%--                                    defer--%>
<%--                            ></script>--%>
<script src="js/geolocation.js"></script>
<!-- Modal start -->
<form action = "post/interact" method ="post" enctype="multipart/form-data">
    <%--                            <form action = "post/interact" method ="post" >--%>
    <input type="hidden" name="userID" value="${requestScope.avator.id}">
    <input type="hidden" name="latitude"  value="8998.233" id="latitude">
    <input type="hidden" name="longitude" value="239823.99" id="longitude">
    <input type="hidden" name="functionRequest" value="POST">

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
                                                    <textarea required name="description" class="share-field-big share-text-field custom-scroll" placeholder="Say Something">Testing Data Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.</textarea>
                                                </span>
                    <span class="share-text-box">
                                                    <textarea required name="departureAddress" id="autocompleteDep" onFocus="geolocate()"  class="share-text-field" placeholder="Depature Travel Location" spellcheck="false" >IOWA, USA</textarea>
                                                    <grammarly-extension style="position: absolute; top: 0px; left: 0px; pointer-events: none; z-index: auto;" class="_1KJtL"></grammarly-extension>
                                            </span>
                    <span class="share-text-box">
                                                    <textarea required name="destinationAddress" id="autocompleteDest" onFocus="geolocate()"  class="share-text-field" placeholder="Depature Travel Location" spellcheck="false" >CA ,USA </textarea>
                                                    <grammarly-extension style="position: absolute; top: 0px; left: 0px; pointer-events: none; z-index: auto;" class="_1KJtL"></grammarly-extension>
                                            </span>

                    <br>
                    <span class="list-title" style="padding: 10px">
                                                    Upload Images
                                                </span>
                    <input type = "file" name = "file" size = "10" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="post-share-btn" data-dismiss="modal">cancel</button>
                    <button type="submit" class="post-share-btn" >post</button>
                </div>
            </div>
        </div>
    </div>
</form>
<!-- Modal end -->
