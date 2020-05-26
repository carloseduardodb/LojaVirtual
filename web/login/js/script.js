$(document).ready(function(){
    $(".sign-up").click(function(){
        $(".reg").toggleClass("regopen");
    });
    $(".login1").click(function(){
        $(".reg").removeClass("regopen");
    });
});
