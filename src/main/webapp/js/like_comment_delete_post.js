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
    $("button.btn-comment").unbind().on('click',function(){
        const comment=$(this).siblings("textarea").val();
        const userID=$(this).parents(".card.post").data("userid");
        const postId=$(this).parents(".card.post").data("id");
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