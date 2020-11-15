$(document).ready(function() {
    "use strict";

    $("button.like-button").on('click',function(){
       const likeBtn= $(this);
       const postId=likeBtn.parents("post-content").data("postID");
       const isLiked=true;

        $.post('/post/interact',
            {   functionRequest:'LIKE',
                userID:$("userID").data('id'),
                postID:postId,
                isLiked:isLiked,
            }).done(function(response){
                likeBtn.children('.heart-color').toggleClass('liked');
                console.log(response);
             }).fail(function() {
                 alert( "error" );
             });
    });


});