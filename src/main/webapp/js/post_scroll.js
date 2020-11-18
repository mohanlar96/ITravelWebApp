$(document).ready(function(){
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

                generatePostFromTemplate(data,'scroll');


            }).fail(function() {
                alert( "error" );
            });

        }
    });
    $("form#search").unbind().on('submit',function(e){
        e.preventDefault();
        console.log("searching ...");
        var userID=$(".card.post").eq(0).data("userid");
        var keywords=$(this).find('input').val();

        $.post("/post/interact",
            {functionRequest:'SEARCH',
                userID:userID,
                keywords:keywords
            }).done(function(response){
            const data=JSON.parse(response);
            console.log(data);
            if(data.posts.length==0){
                alert("no data relative with follower with this keyword=> "+keywords);
                alert("Try with keyword  OK with user sandy grey to work this feature");
            }


            generatePostFromTemplate(data,'search');

        }).fail(function() {
            alert( "error" );
        });
    });

    function generatePostFromTemplate(  data,templateType){

        var template = Handlebars.compile($("#postTemplate").html());

        Handlebars.registerHelper('fullName', function (avator) {
            return avator.firstName + " "+avator.lastName;
        });
        Handlebars.registerHelper('isMyPost', function(block) {

            if (data.loginAvator.id==this.avator.id)
                return block.fn(this);
            else
                return block.inverse(this);

        });
        Handlebars.registerHelper('isAnyReaction', function(block) {
            if (this.reactions.length !=0)
                return block.fn(this);
            else
                return block.inverse(this);

        });

        Handlebars.registerHelper('isAnyComment', function(block) {
            if (this.comments.length ==0)
                return block.fn(this);
            else
                return block.inverse(this);

        });
        Handlebars.registerHelper('isAnyImage', function(block) {
            if (this.images.length !=0)
                return block.fn(this);
            else
                return block.inverse(this);

        });
        Handlebars.registerHelper('isLiked', function(block) {
            if (this.avator.id==data.loginAvator.id)
                return block.fn(this);
            else
                return block.inverse(this);
        });
        Handlebars.registerHelper('isMyComment', function(block) {
            if (this.avator.id==data.loginAvator.id)
                return block.fn(this);
            else
                return block.inverse(this);
        });
        Handlebars.registerHelper('commentCount', function() {
            return this.comments.length;
        });
        Handlebars.registerHelper('likeCount', function() {
            return this.reactions.length;
        });
        Handlebars.registerHelper('displayLikedMessage', function(reaction) {

            var totoalLiked=this.reactions.length;
            var isLiked=false
            this.reactions.forEach(function(x){
                if(x.avator.id==data.loginAvator.id){
                    isLiked=true;
                    return true;
                }
            });
            // c:if test="${isLiked && fn:length(post.reactions)==1}">You liked it</c:if>
            // <c:if test="${isLiked && fn:length(post.reactions)!=1}">You and ${fn:length(post.reactions)} people liked this</c:if>
            // <c:if test="${!isLiked}">${fn:length(post.reactions)} people liked this </c:if>

            if(isLiked && totoalLiked==1)
                return "You Liked it";
            if(isLiked && totoalLiked!=1)
                return "You and "+totoalLiked+" people liked it";
            if(!isLiked)
                return totoalLiked +" people liked this";
            return "error";


        });
        Handlebars.registerHelper('largeImage', function(url) {
            return url.split('-')[1];
        });
        if(templateType=="search"){
            console.log("searching is working ");
            $(".card.post").first().before(template(data));
        }else if(templateType=="scroll"){
            $(".card.post").last().after(template(data));
        }
        // $.getScript("js/post_action.js");
    }

    // $.post("/post/interact",
    //     {functionRequest:'SCROLL',
    //         userID:1,
    //         page:1,
    //     }).done(function(response){ //list of
    //     const data=JSON.parse(response);
    //
    //     generatePostFromTemplate(data,'scroll');
    //
    // }).fail(function() {
    //     alert( "error" );
    // });




});
