<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8">
        <title>添加教师</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="../X-admin/css/font.css">
        <link rel="stylesheet" href="../X-admin/css/xadmin.css">
        <script src="../X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../X-admin/js/xadmin.js"></script>
        
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form">                    
                    <div class="layui-form-item">
                        <label for="name" class="layui-form-label">
                            <span class="x-red">*</span>姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="name" name="name" required="" lay-verify="name" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="sex" class="layui-form-label">
                            <span class="x-red">*</span>性别</label>
                        <div class="layui-input-inline">
                            <input type="text" id="sex" name="sex" required="" lay-verify="sex" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="number" class="layui-form-label">
                            <span class="x-red">*</span>编号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="teachernumber" name="teachernumber" required="" lay-verify="number" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="password" class="layui-form-label">
                            <span class="x-red">*</span>密码</label>
                        <div class="layui-input-inline">
                            <input type="password" id="password" name="password" required="" lay-verify="password" autocomplete="off" class="layui-input"></div>
                        <div class="layui-form-mid layui-word-aux"></div></div>
                    <div class="layui-form-item">
                        <label for="power" class="layui-form-label">
                            <span class="x-red">*</span>权限</label>
                        <div class="layui-input-inline">
                            <input type="text" id="power" name="power" required="" lay-verify="power" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="major" class="layui-form-label">
                            <span class="x-red">*</span>专业</label>
                        <div class="layui-input-inline">
                            <input type="text" id="majorid" name="majorid" required="" lay-verify="majorid" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="add" class="layui-form-label"></label>
                        </label>
                      <button  class="layui-btn" onclick="add()" lay-filter="add" lay-submit="">
                      	   添加
                      </button>
                      </div>
                </form>
            </div>
        </div>
        <script>layui.use(['form', 'layer'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //自定义验证规则
                form.verify({
                    number: function(value) {
                        if (value.length < 5) {
                            return '教师ID至少得5个字符';
                            return false;
                        }
                    },
                    majorid: function(value) {
                        if (value.length < 5) {
                            return '专业ID至少得5个字';
                            return false;
                        }
                    }
                });

                //监听提交
                form.on('submit(add)',                
                    function() {
                        //关闭当前frame
                        xadmin.close();

                        // 可以对父窗口进行刷新 
                        xadmin.father_reload();
                    });                  

        });
        /*新增*/
        function add(){           
                	var url = "${pageContext.request.contextPath}/teacher/add-submit";
					var param = $(".layui-form").serialize();
	  				$.post(url, param);
	  				alert("添加成功！");
	  	            location.reload();
            }
        
        </script>
        </body>
</html>