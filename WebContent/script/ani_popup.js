$(window).load(function(){
    ani_popup( $('.btn_nonmember'), $('.popup_nonmember').eq(0), 'top');
});

function ani_popup(btn, popup, direction){
    /**
    *   @description 팝업창 show / hide 애니메이션
    *   @param {string} btn 팝업창 여는 버튼
    *   @param {string} popup  팝업창 (팝업창 필수 css : position:fixed, width, height)
    *   @param {string} direction 뜨고 사라지는 방향 => top / right / bottom / left
    *   @example ani_popup( 팝업창 여는 버튼, 팝업창, 방향);
    *   @example ani_popup( $('a.btn_report:eq(0)'), $('div.popup_report_box:eq(0)'), 'left');
    *   @example 팝업창 닫힘 => .popup_close_common 
    *   @example var = _etc; 에 그 외 필요한 동작 따로 정리
    */
    if( btn.length > 0 && popup.length > 0 && direction != '' ){

        var _show, _hide, showChk;
        var showChk = false; // true 보임, false 안보임
        var speed = 200;
        var bg = $(popup).find(".bg");
        
        switch(direction){
            case 'top':
                _show = function(){ popup.show().stop().animate({top:'0'},speed); bg.fadeIn(1000); };
                _hide = function(){ popup.stop().animate({top:'100%'},speed).hide(speed); bg.hide() };
                break;
            case 'bottom':
                _show = function(){ popup.show().stop().animate({bottom:'0'},speed); bg.fadeIn(1000);};
                _hide = function(){ popup.stop().animate({bottom:'100%'},speed).hide(speed); bg.hide() };
                break;
            case 'right':
                _show = function(){ popup.show().stop().animate({right:'0'},speed); bg.fadeIn(1000);};
                _hide = function(){ popup.stop().animate({right:'100%'},speed).hide(speed); bg.hide() };
                break;
            default:
                _show = function(){ popup.show().stop().animate({left:'0'},speed); bg.fadeIn(1000);};
                _hide = function(){ popup.stop().animate({left:'100%'},speed).hide(speed); bg.hide() };
                break;
        }
        popup.css(direction, '100%');
        
        // OPEN
        btn.unbind().bind('click', function(){
            if( showChk == false ){ 
                _show(); 
                showChk = true; 
            }else{ 
                _hide(); 
                showChk = false; 
            }
            return showChk;
        });
        
        // CLOSE
        popup.find('.popup_close_common:eq(0)').unbind().bind('click', function(){ 
            _hide();
            
            return showChk = false;
        });

    }
}
