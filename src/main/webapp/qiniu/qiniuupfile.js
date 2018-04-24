	function isFile(fileName){
		if(fileName!=null && fileName !=""){
			//lastIndexOf如果没有搜索到则返回为-1
			if (fileName.lastIndexOf(".")!=-1) {
				var fileType = (fileName.substring(fileName.lastIndexOf(".")+1,fileName.length)).toLowerCase();
				var suppotFile = new Array();
				suppotFile[0] = "doc";
				suppotFile[1] = "docx";
				for (var i =0;i<suppotFile.length;i++) {
					if (suppotFile[i]==fileType) {
						return true;
					} else{
						continue;
					}
				}
				jQAlert("文件类型不合法,只能是doc、docx类型！");
				return false;
			} else{
				jQAlert("文件类型不合法,只能是doc、docx类型！");
				return false;
			}
		}
	}
	
	function isPicture(fileName){
		if(fileName!=null && fileName !=""){
			//lastIndexOf如果没有搜索到则返回为-1
			if (fileName.lastIndexOf(".")!=-1) {
				var fileType = (fileName.substring(fileName.lastIndexOf(".")+1,fileName.length)).toLowerCase();
				var suppotFile = new Array();
				suppotFile[0] = "jpg";
				suppotFile[1] = "gif";
				suppotFile[2] = "bmp";
				suppotFile[3] = "png";
				suppotFile[4] = "jpeg";
				for (var i =0;i<suppotFile.length;i++) {
					if (suppotFile[i]==fileType) {
						return true;
					} else{
						continue;
					}
				}
				jQAlert("文件类型不合法,只能是jpg、gif、bmp、png、jpeg类型！");
				return false;
			} else{
				jQAlert("文件类型不合法,只能是 jpg、gif、bmp、png、jpeg 类型！");
				return false;
			}
		}
	}
	
	function isPictureOrPdf(fileName){
		if(fileName!=null && fileName !=""){
			//lastIndexOf如果没有搜索到则返回为-1
			if (fileName.lastIndexOf(".")!=-1) {
				var fileType = (fileName.substring(fileName.lastIndexOf(".")+1,fileName.length)).toLowerCase();
				var suppotFile = new Array();
				suppotFile[0] = "jpg";
				suppotFile[1] = "gif";
				suppotFile[2] = "bmp";
				suppotFile[3] = "png";
				suppotFile[4] = "jpeg";
				suppotFile[5] = "pdf";
				for (var i =0;i<suppotFile.length;i++) {
					if (suppotFile[i]==fileType) {
						return true;
					} else{
						continue;
					}
				}
				jQAlert("文件类型不合法,只能是jpg、gif、bmp、png、jpeg、pdf类型！");
				return false;
			} else{
				jQAlert("文件类型不合法,只能是 jpg、gif、bmp、png、jpeg、pdf类型！");
				return false;
			}
		}
	}
	
	var getFileName=function(o) {
		var pos = o.lastIndexOf("\\");
		return o.substring(pos + 1);
	}
	
	function uploadImage(){
		var file = $("#ex_Image").val();
		var fileName = getFileName(file);
		if(isPicture(fileName)==true){
			$.ajaxFileUpload({
				url : '../../common/qiniu/uploadFileByDS.json', //用于文件上传的服务器端请求地址
				fileElementId : 'ex_Image', //文件上传域的ID
				dataType : 'text',
				success : function(data, status){ //服务器成功响应处理函数
					var urlStr = eval("(" + data + ")").url;
					var pos = urlStr.lastIndexOf("/");
					var filename=urlStr.substring(pos + 1);
					console.log(filename);
					$('#imageName').html(filename);
					$("#manuscriptPic").val(urlStr);
				},
				error : function(data, status, e){// 服务器响应失败处理函数
					jQAlert("图片上传失败！",null,"异常");
				},
				complete : function(XMLHttpRequest, textStatus) {
				}
			})
		}
	}

 

