$(document).ready(function () {

    // it sets the pagination value and notifications badges
    paginateAndBadgeCnt();

    $('#allowBtn').on('click',function(){
        let tempArr=[];
        let counter = 0;
        $('#example2>tbody>tr').each(function(){
            if ($(this).find("td:nth-child(6)").find('input').is(':checked')) {
                tempArr[counter++] = $(this).find("td:nth-child(3)").text().trim();
            }
        });

        if (tempArr.length==0) {
            alert("please check the user value");
        } else {

            let ids = tempArr.join();
            console.log("ids:"+ ids);
            // delete Word dialogue modal
            $.post("bannedPosts", {cmdUserServlet: "ALLOW",
                postIds: ids},function(data){
                alert("Result: "+data);
                window.location.replace("bannedPosts");
            });
        }
    })

});
