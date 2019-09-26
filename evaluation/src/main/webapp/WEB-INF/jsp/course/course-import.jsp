<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>课程excel导入</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
         
        <link rel="stylesheet" href="../X-admin/css/font.css">
        <link rel="stylesheet" href="../X-admin/css/xadmin.css">
        <link rel="stylesheet" href="../X-admin/lib/layui/css/layui.css">
        <script src="../X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../X-admin/js/xadmin.js"></script>
       
</head>
<body>
<div class="layui-upload" style="width:600px;height:50px; margin-top: 50px; margin-left: 50px">
	<form class="layui-form" method="POST" action="${pageContext.request.contextPath}/course/Excelin" enctype="multipart/form-data">
		<input type="file" name="file" id="upfile" >
  		<button type="submit" class="layui-btn"  onclick="return checkData()">开始上传</button>
  		<input id="reslut1" style="display: none;" value=${reslut1 } >
   </form>
</div>
</body>


<script type="text/javascript">

  
//JS校验form表单信息  
  function checkData(){  
     var fileDir = $("#upfile").val();  
     var suffix = fileDir.substr(fileDir.lastIndexOf("."));  
     if("" == fileDir){  
         alert("选择需要导入的Excel文件！");  
         return false;  
     }  
     if(".xls" != suffix && ".xlsx" != suffix ){  
         alert("选择Excel格式的文件导入！");  
         return false;  
     }  
     return true;  
  }
  
  var res =document.getElementById("reslut1").value;
  function resl(){
	  if(res==1){
		  alert("上传成功");
	  }
	  if(res==2){
		  alert("上传失败");
	  }
	  
  }
  resl();
  
/*   layui.use(['form', 'layer'],
          function() {
            $ = layui.jquery;
            var form = layui.form,
            layer = layui.layer; 
          //监听提交
            form.on('submit(add)',
            function(data) {
            	//alert(data);
                // console.log(data);
                //发异步，把数据提交给php
               var formData = new FormData(); 
               formData.append("file",$("#upfile").files[0]);
               $.ajax({                	  
                	type:"post",
                	url:"${pageContext.request.contextPath}/course/Excelin", 
                	data:formData,
                	success:function(data){
                		alert("dd");
                		if(data.flag == 1){
                			layer.alert("上传成功", {icon: 1});
                		}else{
                			layer.alert("上传失败", {icon: 2});
                		}
                	}
                })
                
                return false;
            }); 
              
    }); */

</script>
</html>