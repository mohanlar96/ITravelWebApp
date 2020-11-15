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

            var newEle=$("li.comment-item-"+postId).eq(0).clone();
            newEle.find('a').attr('href',"/profile?id="+userID);
            newEle.find('img').attr('src',avatorUrl);
            newEle.find('h6.author').text(fullName);
            newEle.find('p').text(comment);
            newEle.show().appendTo( "ul.comment-box-"+postId );
            var totalE=$("span.total-comment-"+postId);
            var totalComments=parseInt(totalE.text());

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
    // $("button.btn-comment").unbind().on('click',function(){
    //     const comment=$(this).siblings("textarea").val();
    //     const userID=$(this).parents(".card.post").data("userid");
    //     const postId=$(this).parents(".card.post").data("id");
    //     console.log("Comment btn userID,postID ,comment  ="+userID+" "+postId+" " +comment);
    //     $.post('/post/interact',
    //         {   functionRequest:'COMMENT',
    //             userID:userID,
    //             postID:postId,
    //             comment:comment,
    //         }).done(function(response){
    //         console.log(response);
    //     }).fail(function() {
    //         alert( "error" );
    //     });
    // });


});