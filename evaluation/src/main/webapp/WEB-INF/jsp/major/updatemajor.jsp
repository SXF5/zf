<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8">
        <title>修改专业</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="../X-admin/css/font.css">
        <link rel="stylesheet" href="../X-admin/css/xadmin.css">
        <script type="text/javascript" src="../X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../X-admin/js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
    
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form">
                    <div class="layui-form-item">
                        <label for="L_majorid" class="layui-form-label">
                            <span class="x-red">*</span>ID</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_majorid" name="majorid" required="" lay-verify="majorid" value=" ${major.majorid}" autocomplete="off" class="layui-input" readonly="readonly"></div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>唯一的ID</div></div>
                    <div class="layui-form-item">
                        <label for="L_majornumber" class="layui-form-label">
                            <span class="x-red">*</span>专业编号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_majornumber" name="majornumber" required="" lay-verify="majornumber" value=" ${major.majornumber}" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_majorname" class="layui-form-label">
                            <span class="x-red">*</span>专业名称</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_majorname" name="majorname" required="" lay-verify="majorname" value=" ${major.majorname}" autocomplete="off" class="layui-input"></div>
                    </div>
                    
                    <div class="layui-form-item">
                        	<label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>院系</label>
                           <div class="layui-input-inline">
                    	<select name="facultyid" class="layui-input">
                    	 <c:forEach items="${faculty}" var="item">
				         <option value="${item.facultyid}">${item.facultyname}</option>
				         </c:forEach>
		                   </select>
		                  </div>
		                   </div>
                    

                    
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label"></label>
                        <button class="layui-btn" lay-filter="add" lay-submit="" onclick="update()">保存</button></div>
                </form>
            </div>
        </div>
         
         <script>
//         function add(){
//         	var url="${pageContext.request.contextPath}/major/addmajor_submit";
//         	var param=$(".layui-form").serialize();
//         	$.post(
//         			url,param,function(data){
//         				alert(data.msg);
//         				if(data.flag==1){
//         					location.href="${pageContext.request.contextPath}/major/majorlist";
//         				}
//         			});
//         }
        /*修改提交*/
        function update(){
        	var url="${pageContext.request.contextPath}/major/updatemajor_submit";
        	var param = $(".layui-form").serialize();
        	$.post(url, param, function(data) {
        		alert(data.msg);
        		if(data.flag==1){
        			location.href="${pageContext.request.contextPath}/major/majorlist";
        		}
        	});
        }
        </script>
        
        <script>layui.use(['form', 'layer','jquery'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //自定义验证规则
                form.verify({
                    nikename: function(value) {
                        if (value.length < 5) {
                            return '昵称至少得5个字符啊';
                        }
                    },
                    pass: [/(.+){6,12}$/, '密码必须6到12位'],
                    repass: function(value) {
                        if ($('#L_pass').val() != $('#L_repass').val()) {
                            return '两次密码不一致';
                        }
                    }
                });

                //监听提交
                form.on('submit(add)',
                function(data) {
                    console.log(data);
                    //发异步，把数据提交给php
                    layer.alert("修改成功", {
                        icon: 6
                    },
                    function() {
                        //关闭当前frame
                        xadmin.close();

                        // 可以对父窗口进行刷新 
                        xadmin.father_reload();
                    });
                    return false;
                });

            });</script>
        <script>var _hmt = _hmt || []; (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();</script>
    </body>

</html>