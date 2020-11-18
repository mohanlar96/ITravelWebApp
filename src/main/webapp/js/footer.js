$(document).ready(function () {
    $(".add-frnd").click(function () {
        $travellerID = $(this).attr('id'); //Button ID
        $followStatus = $('#' + $travellerID).html().trim();
        //  alert($userSession+" "+$travellerID+" "+$followStatus);
        $.ajax({
            url: "FollowUnfollowServlet",
            data: {
                "TravellerID": $travellerID,
                "FollowingStatus": $followStatus
            },
            type: "GET",
            cache: false,
            success: function (responseText) {
                $('#' + $travellerID).text(responseText);
                if (responseText.toString().trim() === "Follow") {
                    $('#' + $travellerID).css("font-weight", "normal");
                } else if (responseText.toString().trim() === "Following") {
                    $('#' + $travellerID).css("font-weight", "bold");
                }
            },
            error: function () {
                alert('Ajax Error');
            }
        });
    });
});

$(document).ready(function () {
    $(".footerBtn").click(function (e) {
        e.preventDefault();
        const $travelerType = $(this).attr('name').toString().trim(); // Follower or Followee
        var $userID = $('#avatar-id-hidden').val().toString().trim();  //Comes from Footer Holding the ID of the Opened Profile
         if ($userID.length > 3) ; // if current avatar is null, consider the current session
         $userID = $('#hidden-session-user-id').val().toString().trim();
        $.ajax({
            type: "GET",
            url: "FooterTravelersServlet",
            data: {
                "currentUserID": $userID, // accept this from session or hidden-user
                "travellerType": $travelerType
            },
            success: function (responseText) {
                const len = JSON.parse(responseText).length;
                let disp = "";
                let profile_images = "";
                for (let i = 0; i < len; i++) {
                    var obj = JSON.parse(responseText, function (key, value) {
                        return value;
                    });
                    let newEle = $("li.followers-li").eq(0).clone(true, true);
                    var ButtonText = obj[i].isFollwing.toString().trim() ? "Following" : "Follow";

                    disp += "<li class='d-flex align-items-center profile-active followers-li>'" +
                        "<div class='profile-thumb'> " +
                        "<a href='/profile?id=" + obj[i].userID + "' class='profPic'>" +
                        "<figure class='profile-thumb-small'> " +
                        "<img src='" + obj[i].picturePath + "' alt='profile picture'> " +
                        "</figure> " +
                        "</a> " +
                        "</div>" +
                        "<div class='posted-author'> " +
                        "<h6 class='author posted-author'> " +
                        "<a class='followerName' href='/profile?id=" + obj[i].userID + "'>" + obj[i].firstName + " " + obj[i].lastName + "</a>" +
                        "</h6>" +
                        "</div> " +
                        "<div class='posted-author'> " +
                        // "<button class='add-frnd follwers-left' style='float: right; border:none' id='" + obj[i].userID + "'>" + ButtonText +
                        //"</button>" +
                        "</div> " +
                        " </li>";
                    // profile_images+=
                    //
                    //     "<div class='profile-thumb profile-active'>" +
                    //     "<a href='/profile?id=" + obj[i].userID + "'>" +
                    //     "<figure class='profile-thumb-small'>" +
                    //     "<img class='all-images' src='"+obj[i].picturePath+"' alt='profile picture'>" +
                    //     "</figure>" +
                    //     "</a>" +
                    //     "</div>" +


                }
                $("#" + $travelerType).html(disp);
            },
            error: function () {
                alert('Ajax Error');
            }
        });
    });
});