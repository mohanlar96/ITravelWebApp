$(document).ready(function() {
    "use strict";

    $("button.like-button").on('click',function(){
        $(this).children('.heart-color').toggleClass('liked');

    });


});