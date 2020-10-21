$(function(){
	if( $("#contents_ckeditor").length > 0 ){
		CKEDITOR.replace('contents_ckeditor',{
			height:500
			//filebrowserUploadUrl: '${pageContext.request.contextPath }/adm/fileupload.do'
		});
	}
});