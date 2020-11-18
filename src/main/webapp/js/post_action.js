
$(document).ready(function() {

    $(".post-comment").on('click',function(){
        $(this).parents(".post-content").siblings('.liked-box').slideUp();
        $(this).parents(".post-content").siblings('.commant-box').slideToggle();
    });

    $("button.show-liked-dialog").on("click",function(){
        $(this).parents(".post-content").siblings('.commant-box').slideUp();
        $(this).parents(".post-content").siblings('.liked-box').slideToggle();

    });

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
                  var post=likeBtn.parents(".card.post");
                  var likedBox=post.children('.liked-box');

                if(isLiked){ // if already liked so we are going to dislike

                    totoalLiked= totoalLiked-1;
                    likeBtn.siblings('.show-liked-dialog').children('span').text(totoalLiked+" people like this");
                    likedBox.find("li.myLikeList").remove();
                    if(totoalLiked==0){

                        likedBox.find('ul').text('No Body, Be the like first');
                    }

                }else{ //if diskliked ,, now going to like

                    var likedTemplate = Handlebars.compile($("#commentTemplate").html());
                    var likeListContainer=likedBox.find("ul");

                    if(totoalLiked==0){
                        likeListContainer.text("");
                        textShow="You like it";
                        likeListContainer=post.children('.hidden-liked-box').addClass('liked-box').slideDown().find('ul');
                     }else if(totoalLiked==1){
                        textShow="You and 1 people liked this";
                    }else if(totoalLiked>1){
                        textShow="You and "+ totoalLiked+" people liked this"
                    }
                    totoalLiked++;
                    likeListContainer.append(likedTemplate({id:post.data("userid"),authorName:post.data("fullname"),url:post.data("avatorurl") }));
                    likeBtn.siblings('.show-liked-dialog').children('span').text(textShow);


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
        const fullName=$(this).parents(".card.post").data("fullname") ;
        const avatorUrl=$(this).parents(".card.post").data("avatorurl") ;
        const postId=$(this).parents(".card.post").data("id");


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
        const destinationAddress=$.trim($("#post-destAddress-"+postId).text());
        model.find("textarea").eq(0).val(description);
        model.find("input").eq(0).val(depatureAddress);
        model.find("input").eq(1).val(destinationAddress);
        model.find("span.list-title , input[type='file'] , input[type='checkbox']").hide();
        model.find("[type='submit']").text("Update");
        model.find("h5.modal-title").text("Update Your Travel Info");
        // $('#textbox').parent("form").attr("action","post/interact");

        model.modal();//show dialog

        $("[action='post/interact']").on('submit',function(e){
            e.preventDefault();

            console.log("Post id to update  ="+postId );
            $.post("/post/interact",
                {functionRequest:'UPDATE',
                    postID:postId,
                    description: $.trim(model.find("textarea").eq(0).val()),
                    departureAddress: $.trim(model.find("input").eq(0).val()),
                    destinationAddress:$.trim(model.find("input").eq(1).val()),
                }).done(function(response){
                console.log(response);
                 $("#post-description-"+postId).text(model.find("textarea").eq(0).val());
                 $("#post-departureAddress-"+postId).text(model.find("input").eq(0).val());
                 $("#post-destAddress-"+postId).text(model.find("input").eq(1).val());

                model.modal("hide");
                model.find("textarea").eq(0).text("");
                model.find("input").eq(0).val("");
                model.find("input").eq(1).val("");
                model.find("span.list-title , input[type='file'] , input[type='checkbox']").show();
                model.find("[type='submit']").text("Post");
                model.find("h5.modal-title").text("Share Your Travel Info");
                // $('#textbox').parent("form").attr("action","post");


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
                window.alert("Sorry : City or State not found in the System");

            }
        });

    });


});