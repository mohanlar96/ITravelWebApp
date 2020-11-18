$(document).ready(function () {

    // it sets the pagination value and notifications badges
    paginateAndBadgeCnt();

    $('#activateBtn').on('click',function(){
        let tempArr=[];
        let counter = 0;
        $('#example2>tbody>tr').each(function(){
            if ($(this).find("td:nth-child(5)").find('input').is(':checked')) {
                tempArr[counter++] = $(this).find("td:nth-child(1)").text().trim();
            }
        });

        if (tempArr.length==0) {
            alert("please check the user value");
        } else {

            let ids = tempArr.join();
            console.log("ids:"+ ids);
            // delete Word dialogue modal
            $.post("deactivatedUsers", {cmdUserServlet: "ACTIVATE",
                userIds: ids},function(data){
                alert("Result: "+data);
                window.location.replace("deactivatedUsers");
            });
        }
    })

});
