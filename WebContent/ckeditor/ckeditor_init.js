$(function(){
	if( $("#contents_ckeditor").length > 0 ){
		// ck에디터 삽입
		CKEDITOR.replace('contents', {height: 500 });
	}
});