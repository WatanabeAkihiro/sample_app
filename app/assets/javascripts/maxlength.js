$(function(){
    var countMax = 140;
    $('textarea').bind('keydown keyup keypress change',function(){
        var thisValueLength = $(this).val().length;
        var countDown = (countMax)-(thisValueLength);
        $('.count').html(countDown);
 
        if(countDown < 0){
            $('.count').css({color:'#ff0000',fontWeight:'bold'});
        } else {
            $('.count').css({color:'#000000',fontWeight:'normal'});
        }
    });
    $(window).load(function(){
        $('.count').html(countMax);
    });
});