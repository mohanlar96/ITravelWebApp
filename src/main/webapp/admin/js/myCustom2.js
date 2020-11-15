let deactivatedUserCnt = 0;
let skipOnce = 1;
function getDeactivatedUserCnt() {
    $.post("deactivatedUsers", {cmdUserServlet: "GET_CNT"},function(data){
        console.log(data);
        let jsonResp = JSON.parse(data);
        $('#badgeDeactivatedUsers').text(jsonResp.count);
        if ($('.current').attr('href')=="deactivatedUsers" && deactivatedUserCnt != parseInt(jsonResp.count) && skipOnce==0) {
            deactivatedUserCnt = parseInt(jsonResp.count);
            // window.location.replace("deactivatedUsers");
        }
        skipOnce = 0;
        //window.location.replace("deactivatedUsers");
    });
}

$(document).ready(function () {

    //when load, it sets the current page list item active
    //it sets the left, right button appear disabled depend on the page number
    var currPage = $('#myPagination').data("page");
    var totalPage = $('#myPagination').data("totalpage");
    //console.log(currPage);
    if (currPage==1) {
        $("ul.pagination>li:nth-child("+(currPage)+")").addClass('disabled');
    }
    if (currPage==totalPage) {
        $("ul.pagination>li:nth-child("+(currPage+2)+")").addClass("disabled");
    }
    $("ul.pagination>li:nth-child("+(currPage+1)+")").addClass("active");
    //
    // $('#example2').each(function(){
    //     let self = $(this);
    //     console.log(self.find("td").eq(1).text().trim());
    // });
    //when web page loads, get the cnt value;
    setInterval(getDeactivatedUserCnt, 10*1000);



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




    //
    // $(":checkbox").change(function(){
    //     $(this).val($(this).is(":checked") ? 1 : 0);
    // });
    //
    //
    //
    // $('.edit').on('click', function () {
    //     let theModal = $('#editModal');
    //     let $row = $(this).closest("tr"); // find the closest row
    //     let id = $row.find("td:nth-child(1)").text().split(" ").join("");
    //     let word = $row.find("td:nth-child(2)").text().split(" ").join("");
    //     $('#showWordId2').val(id);
    //     $('#editWord2').val(word);
    //
    //     console.log("id:" + id + " word:" + word);
    //     theModal.modal('show');
    //     return false;
    // });


});
