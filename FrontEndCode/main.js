$(document).ready(function(){
    $(window).scroll(function(){
        var scroll = $(window).scrollTop();
        if (scroll > 50) {
          $(".black").css("background" , "black");
        }
  
        else{
            $(".black").css("background" , "red");
        }
    })
  })