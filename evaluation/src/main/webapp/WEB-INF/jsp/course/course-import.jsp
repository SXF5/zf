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
<div class="layui-upload">
  <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
  <button type="button" class="layui-btn" id="test9">开始上传</button>
</div>
</body>


<script>
layui.use('upload', function(){
   var $ = layui.jquery
  ,upload = layui.upload;
   //选完文件后不自动上传
   
  upload.render({
    elem: '#test8'
    ,url: ''
    ,accept:'file'
    ,auto: false
    ,multiple: true
    ,bindAction: '#test9'
    ,done: function(){
      alert(444);
    }
  });
  

  
  
 
  
});
</script>
</html>