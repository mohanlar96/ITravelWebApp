function commentClick(){
    alert("comment Click");
}
$(document).ready(function() {

    $('button.click-on-like').unbind().on('click','',function(e){
        let likeBtn=$(this);
       let userID=$(this).parents(".card.post").data("userid");
       let postId=$(this).parents(".card.post").data("id");
       let isLiked=$(this).data("isliked");
       console.log("Like btn userID,postID ,isLiked  ="+userID+" "+postId+" " +isLiked);

        $.post('/post/interact',
            {   functionRequest:'LIKE',
                userID:userID,
                postID:postId,
                isLiked:isLiked,
            }).done(function(response){
                likeBtn.data("isliked",!(isLiked));
                likeBtn.children('.heart-color').toggleClass('liked');
                    var val=likeBtn.siblings(".show-liked-dialog").children('strong').text();
                  var totoalLiked= parseInt(val);

                if(isLiked){ // if already liked so we are going to dislike

                    totoalLiked= totoalLiked-1;
                    likeBtn.siblings('.show-liked-dialog').children('span').text(totoalLiked+" people like this");


                }else{ //if diskliked ,, now going to like
                    totoalLiked= totoalLiked+1;

                    likeBtn.siblings('.show-liked-dialog').children('span').text("You and "+ totoalLiked+" people like this");
                }
                 likeBtn.siblings('.show-liked-dialog').children('strong').text(totoalLiked);

                 likeBtn=undefined;
                console.log(response);
             }).fail(function() {
                 alert( "error" );
             });

    });
    $("button.btn-comment").unbind().on('click',function(){
        const comment=$(this).siblings("textarea").val();
        const userID=$(this).parents(".card.post").data("userid");
        const postId=$(this).parents(".card.post").data("id");
        const fullName=$(this).parents(".card.post").data("fullname") ;
        const avatorUrl=$(this).parents(".card.post").data("avatorurl") ;

        console.log("Comment btn userID,postID ,comment  ="+userID+" "+postId+" " +comment+"  "+fullName+" " +avatorUrl);
        $.post('/post/interact',
            {   functionRequest:'COMMENT',
                userID:userID,
                postID:postId,
                comment:comment,
            }).done(function(response){
            console.log(response);

            let newEle=$("li.comment-item-"+postId).eq(0).clone(true,true);
            newEle.find('a').attr('href',"/profile?id="+userID); //moh
            newEle.find('img').attr('src',avatorUrl);
            newEle.find('h6.author span').text(fullName); //
            newEle.find('p').text(comment); //howo
            newEle.find('button.deletecomment').attr("data-commentid",response);
            newEle.show().appendTo( "ul.comment-box-"+postId ); //appen
            var totalE=$("span.total-comment-"+postId);
            var totalComments=parseInt(totalE.text());
            newEle=undefined;

            if(totalComments==0){
                $("ul.comment-box-"+postId).parent(".hidden-commant-box").addClass('commant-box').slideDown();
            }else{
                $("ul.comment-box-"+postId).parent(".commant-box").slideDown();
            }
            totalE.text(totalComments+1);
            $(this).siblings("textarea").text("");
            }).fail(function() {
              alert( "error" );
        });
    });
    $("button.deletecomment").unbind().on('click',function(){
        const commentItem=$(this);
        const postId=$(this).parents(".card.post").data("id");
        const commentID=$(this).data("commentid");
        console.log("Comment id to delete  ="+commentID );
        $.post("/post/interact",
            {functionRequest:'DELETE_COMMENT',
             commentID:commentID
            }).done(function(response){
                console.log(response);
                commentItem.parents("li").remove();
                var totalE=$("span.total-comment-"+postId);
                var totalComments=parseInt(totalE.text());
                totalComments=parseInt(totalComments)-1;
                totalE.text(totalComments);
                if(totalComments==0){
                    $("ul.comment-box-"+postId).parent(".commant-box")
                        .addClass('hidden-commant-box').slideUp()
                        .removeClass(".commant-box");
                }
        }).fail(function() {
            alert( "error" );
        });
    });
    $("button.delete-post").unbind().on('click',function(){
        const menu=$(this);
        const postId=$(this).data("id");
        console.log("Post id to delete  ="+postId );
        $.post("/post/interact",
            {functionRequest:'DELETE',
                postID:postId
            }).done(function(response){
            console.log(response);
            menu.parents(".card.post").slideUp('slow',function (){
                $(this).remove();
            });
        }).fail(function() {
            alert( "error" );
        });
    });

    $("button.edit-post").unbind().on('click',function(){
        const postId=$(this).data("id");
        const model=$('#textbox');
        const description=$.trim($("#post-description-"+postId).text());
        const depatureAddress=$.trim($("#post-departureAddress-"+postId).text());
        const destinationAddress=$.trim($("#post-departureAddress-"+postId).text());
        model.find("textarea").eq(0).text(description);
        model.find("textarea").eq(1).text(depatureAddress);
        model.find("textarea").eq(2).text(destinationAddress);
        model.find(".list-title , input").hide();
        model.find("[type='submit']").text("Update");
        model.find("h5.modal-title").text("Update Your Travel Info");


        model.modal();//show dialog

        $("[action='post/interact']").on('submit',function(e){
            e.preventDefault();

            console.log("Post id to update  ="+postId );
            $.post("/post/interact",
                {functionRequest:'UPDATE',
                    postID:postId,
                    description: $.trim(model.find("textarea").eq(0).val()),
                    departureAddress: $.trim(model.find("textarea").eq(1).val()),
                    destinationAddress:$.trim(model.find("textarea").eq(2).val()),
                }).done(function(response){
                console.log(response);
                 $("#post-description-"+postId).text(model.find("textarea").eq(0).val());
                 $("#post-departureAddress-"+postId).text(model.find("textarea").eq(1).val());
                 $("#post-departureAddress-"+postId).text(model.find("textarea").eq(2).val());

                model.modal("hide");
                model.find("textarea").eq(0).text("");
                model.find("textarea").eq(1).text("");
                model.find("textarea").eq(2).text("");
                model.find(".list-title , input").hide();
                model.find("[type='submit']").text("Post");
                model.find("h5.modal-title").text("Share Your Travel Info");

            }).fail(function() {
                alert( "error" );
            });


        });



    });
    var weatherObj;
    function fetchWeather(weatherData){
        for (let i=0; i<5; i++) {
            // console.log(weatherData[i]);
            let tempDay = getDayText(new Date(weatherData[i].dt * 1000).getDay());
            console.log(tempDay);
            $('#day'+(i+1)+' h3').text(tempDay);
            $('#day'+(i+1)+' p.dayTemp').text(weatherData[i].temp.max+'°');
            $('#day'+(i+1)+' p.nightTemp').text(weatherData[i].temp.min+'°');
            $('#day'+(i+1)+' i').removeClass();
            let faClass = getWeatherPic((weatherData[i].weather)[0].main);
            console.log(faClass);
            $('#day'+(i+1)+' i').addClass('fas '+faClass+' fa-2x');

        }
        // for (const singleData of weatherData) {
        //   //console.log(new Date(singleData.dt * 1000));
        //   console.log(singleData);
        // }
    }

    function getDayText(day) {
        var weekday = new Array(7);
        weekday[0] = "Sunday";
        weekday[1] = "Monday";
        weekday[2] = "Tuesday";
        weekday[3] = "Wednesday";
        weekday[4] = "Thursday";
        weekday[5] = "Friday";
        weekday[6] = "Saturday";
        return weekday[day];
    }

    function getWeatherPic(weatherDesc) {
        var faClassName = "fa-sun";
        console.log(weatherDesc);
        switch (weatherDesc) {
            case "Thunderstorm":
                faClassName = "fa-cloud-showers";
                break;
            case "Drizzle":
                faClassName = "fa-cloud-showers";
                break
            case "Rain":
                faClassName = "fa-cloud-showers";
                break
            case "Snow":
                faClassName = "fa-snowflake";
                break
            case "Clear":
                faClassName = "fa-sun";
                break
            case "Clouds":
                faClassName = "fa-cloud";
                break
            default:
                faClassName = "fa-cloud-sun";
                break;
        }
        return faClassName;
    }


    $('u.weather').unbind().click(function(){
        $("#weather-modal").text($(this).text());
        let city = $.trim($(this).text()).split(",")[0];
        console.log(city);
        $.ajax({
            url: "http://api.openweathermap.org/data/2.5/forecast/daily",
            data: { q: city, appid: "77be4c8a3f4f50b485fd140c1ab4d87d",units: "metric"},
            success: function (response) {
                weatherObj = response.list;
                console.log(weatherObj);
                fetchWeather(weatherObj);
                $("#weatherModal").modal('show');
                // console.log(obj.longitude);
            },
            error: function (xhr) {
                console.log(xhr);
                window.alert("Error : Weather need to be clicked on city");

            }
        });

    });
    pageForPostScroll=1; // page number

    $(window).on("scroll", function() {
        var scrollHeight = $(document).height();
        var scrollPosition = $(window).height() + $(window).scrollTop();
        if ((scrollHeight - scrollPosition) / scrollHeight === 0) { //when scroll down
            var userID=$(".card.post").eq(0).data("userid");
            pageForPostScroll++; //increase page no

            console.log("when scroll down"+pageForPostScroll+userID);

            $.post("/post/interact",
                {functionRequest:'SCROLL',
                    userID:userID,
                    page:pageForPostScroll,
                }).done(function(response){
                const data=JSON.parse(response);

                    console.log(data);

                    var template = Handlebars.compile($("#postTemplate").html());

                    $(".card.post").last().after(template(data)).slideDown('slow');

            }).fail(function() {
                alert( "error" );
            });

        }
    });
    $("form#search").unbind().on('submit',function(e){
        e.preventDefault();
        var userID=$(".card.post").eq(0).data("userid");
        var keywords=$(this).find('input').val();

        $.post("/post/interact",
            {functionRequest:'SEARCH',
                userID:userID,
                keywords:keywords

            }).done(function(response){
                const data=JSON.parse(response);
                console.log(data);
                var template = Handlebars.compile($("#postTemplate").html());
                $(".card.post").first().before(template(data)).slideDown('slow');

        }).fail(function() {
            alert( "error" );
        });
    });



    // $.post("/post/interact",
    //     {functionRequest:'SCROLL',
    //         userID:1,
    //         page:1,
    //     }).done(function(response){ //list of
    //      const data=JSON.parse(response);
    //
    //     console.log(data);
    //
    //     var template = Handlebars.compile($("#postTemplate").html());
    //
    //     $(".card.post").first().after(template(data));
    //
    // }).fail(function() {
    //     alert( "error" );
    // });




});