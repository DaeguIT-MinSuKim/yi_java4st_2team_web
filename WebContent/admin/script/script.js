$(function(){
    // 관리자 카테고리
    var btn = $('a.btn_depth1');
    categoryDepth(btn);

    function categoryDepth(btn){
        var btn = $(btn);
        if( btn.hasClass("active") ){
            btn.next("ul").slideUp(200);
            btn.removeClass("active");
        }else{
            btn.next("ul").slideDown(200);
            btn.addClass("active");
        }
    }
    
    $('a.btn_depth1').unbind().bind('click', function(){
        categoryDepth($(this));
    });
});