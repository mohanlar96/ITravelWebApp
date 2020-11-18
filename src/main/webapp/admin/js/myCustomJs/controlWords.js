$(document).ready(function () {

    // it sets the pagination value and notifications badges
    paginateAndBadgeCnt();

    //******************************Modal fillup START*******************************
    // All Edit button modal fillup before show
    $('.edit').on('click', function () {
        let theModal = $('#editModal');
        let $row = $(this).closest("tr"); // find the closest row
        let id = $row.find("td:nth-child(1)").text().split(" ").join("");
        let word = $row.find("td:nth-child(2)").text().split(" ").join("");
        $('#showWordId2').val(id);
        $('#editWord2').val(word);

        console.log("id:" + id + " word:" + word);
        theModal.modal('show');
        return false;
    });

    //All Delete button modal fillup before show
    $('.delete').on('click', function () {
        let theModal = $('#deleteModal');
        let $row = $(this).closest("tr"); // find the closest row
        let id = $row.find("td:nth-child(1)").text().split(" ").join("");
        let word = $row.find("td:nth-child(2)").text().split(" ").join("");
        $('#showWordId3').val(id);
        $('#deleteWord3').val(word);
        console.log("id:" + id + " word:" + word);
        theModal.modal('show');
        return false;
    });
    //******************************Modal fillup END*******************************


    //******************************Ajax call to Servlet START*******************************
    // Add new Word dialogue modal
    $('#saveModalButton1').on('click', function () {
        $.get("controlWords", {cmdWordServlet: "ADD", newWord: $('#addModalVarWord').val()},function(data){
            alert("Result: " + data);
        });
    });

    // edit Word dialogue modal
    $('#editModalButton2').on('click', function () {
        console.log("edit word");
        $.get("controlWords", {cmdWordServlet: "UPDATE", newWord: $('#editWord2').val(), currId: $('#showWordId2').val()},function(data){
            alert("Result: " + data);
            window.location.replace("controlWords");
        });
    });

    // delete Word dialogue modal
    $('#deleteModalButton3').on('click', function () {
        console.log("new update word request");
        $.get("controlWords", {cmdWordServlet: "DELETE", newWord: $('#deleteWord3').val(), currId: $('#showWordId3').val()},function(data){
            alert("Result: " + data);
            window.location.replace("controlWords");
        });
    });
//******************************Ajax call to Servlet END*******************************
});
