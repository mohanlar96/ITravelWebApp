$(document).ready(function() {
    "use strict";

    $("button.like-button").on('click',function(){
       const likeBtn= $(this);
       const userID=likeBtn.parents(".card.post").data("id");
       const postId=likeBtn.parents(".card.post").data("id");
       const isLiked=likeBtn.data("isliked");
       console.log("Like btn userID,postID ,isLiked  ="+userID+" "+postId+" " +isLiked);

        $.post('/post/interact',
            {   functionRequest:'LIKE',
                userID:userID,
                postID:postId,
                isLiked:isLiked,
            }).done(function(response){
                likeBtn.children('.heart-color').toggleClass('liked');
                console.log(response);
             }).fail(function() {
                 alert( "error" );
             });
    });
    $("button.btn-comment").on('click',function(){
        const commentBtn=$(this);
        const comment=$(this).siblings("textarea").val();
        const userID=commentBtn.parents(".card.post").data("id");
        const postId=commentBtn.parents(".card.post").data("id");
        console.log("Comment btn userID,postID ,comment  ="+userID+" "+postId+" " +comment);
        $.post('/post/interact',
            {   functionRequest:'COMMENT',
                userID:userID,
                postID:postId,
                comment:comment,
            }).done(function(response){
            console.log(response);
        }).fail(function() {
            alert( "error" );
        });
    });


});