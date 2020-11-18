function getBadgeCnt() {
    $.post("deactivatedUsers", {cmdUserServlet: "GET_CNT"},function(data){
        let jsonResp = JSON.parse(data);
        $('#badgeDeactivatedUsers').text(jsonResp.count);
    });
    $.post("bannedPosts", {cmdUserServlet: "GET_CNT"},function(data){
        let jsonResp = JSON.parse(data);
        $('#badgeBannedPost').text(jsonResp.count);
    });
}

function paginateAndBadgeCnt(){
    let currPage = $('#myPagination').data("page");
    let totalPage = $('#myPagination').data("totalpage");
    if (currPage==1) {
        $("ul.pagination>li:nth-child("+(currPage)+")").addClass('disabled');
    }
    if (currPage==totalPage) {
        $("ul.pagination>li:nth-child("+(currPage+2)+")").addClass("disabled");
    }
    $("ul.pagination>li:nth-child("+(currPage+1)+")").addClass("active");

    getBadgeCnt();
    setInterval(getBadgeCnt, 10*1000);
}