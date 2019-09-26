<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>教师信息</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="../X-admin/css/font.css">
        <link rel="stylesheet" href="../X-admin/css/xadmin.css">
        <script src="../X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../X-admin/js/xadmin.js"></script>
        <style type="text/css">
    		.layui-table td, .layui-table th {
			    min-width: 10px;
			}
    	</style>
    </head>
    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">演示</a>
            <a>
              <cite>导航元素</cite></a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5">
<!--                                 <div class="layui-inline layui-show-xs-block"> -->
<!--                                     <input class="layui-input"  autocomplete="off" placeholder="开始日" name="start" id="start"> -->
<!--                                 </div> -->
<!--                                 <div class="layui-inline layui-show-xs-block"> -->
<!--                                     <input class="layui-input"  autocomplete="off" placeholder="截止日" name="end" id="end"> -->
<!--                                 </div> -->
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                            <button class="layui-btn" onclick="xadmin.open('添加教师','add',600,400)"><i class="layui-icon"></i>添加</button>
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                  <tr>
                                    <th>
                                      <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                                    </th>
                                    <th>ID</th>
                                    <th>姓名</th>
                                    <th>账号</th>
                                    <th>性别</th>
                                    <th>密码</th>
                                    <th>电话</th>
                                    <th>年龄</th>
                                    <th>专业</th>
                                    <th>权限</th>
                                   <!--  <th>备注</th> -->
                                    <th>操作</th></tr>
                                </thead>
                                <tbody id="test1">
                                <c:forEach var="teacher" items="${teachers}" varStatus="item">
                                  <tr>
                                    <td>
                                      <input type="checkbox" name="id" value="1"   lay-skin="primary"> 
                                    </td>
                                    <td>${teacher.teacherid}</td>
                                    <td>${teacher.name}</td>
                                    <td>${teacher.teachernumber}</td>
                                    <td>${teacher.sex}</td>
                                    <td>${teacher.password}</td>
                                    <td>${teacher.phone}</td>
                                    <td>${teacher.birthday}</td>
                                    <td>${teacher.maj.majorname}</td>
                                    <td>${teacher.power}</td>
                                   <%--  <td>${teacher.remarks}</td>         --%>                           
                                    <td class="td-manage">                                     
                                      <button class="layui-btn layui-btn layui-btn-xs"  onclick="xadmin.open('编辑','update?teacherid=${teacher.teacherid}',600,400)" href="javascript:;">
                                        <i class="layui-icon">&#xe642;</i>编辑
                                      </button>
                                      <button class="layui-btn-warm layui-btn layui-btn-xs"  onclick="resetpwd('${teacher.teacherid}')" title="重置密码" href="javascript:;">
                                        <i class="layui-icon">&#xe631;</i>重置密码
                                      </button>
                                      <button class="layui-btn-danger layui-btn layui-btn-xs" onclick="del('${teacher.teachernumber}')" href="javascript:;">
                                        <i class="layui-icon">&#xe640;</i>删除
                                      </button>
                                    </td>
                                  </tr> 
                                   </c:forEach>                                 
                                </tbody>
                            </table>
                        </div>
                        <div class="layui-card-body ">
                            <div class="page">
                                <div>
                                  <a class="prev" href="">&lt;&lt;</a>
                                  <span class="current" >1</span>
                                  <a class="num" href="teacher-page?pageIndex=2">2</a>
                                  <a class="num" href="teacher-page?pageIndex=3">3</a>
                                  <a class="num" href="">${totalPageCount}</a>
                                  <a class="next" href="teacher-page?pageInde+1">&gt;&gt;</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </body>
    <script>
      layui.use(['laydate','form'], function(){
        var laydate = layui.laydate;
        var  form = layui.form;


        // 监听全选
        form.on('checkbox(checkall)', function(data){

          if(data.elem.checked){
            $('tbody input').prop('checked',true);
          }else{
            $('tbody input').prop('checked',false);
          }
          form.render('checkbox');
        }); 
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });  
      //分页实现
      laypage.render({
    	  elem: 'test1'
    	  ,count: 50 //数据总数，从服务端得到
    	  ,jump: function(obj, first){
    	    //obj包含了当前分页的所有参数，比如：
    	    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
    	    console.log(obj.limit); //得到每页显示的条数
    	    
    	    //首次不执行
    	    if(!first){
    	      //do something
    	    }
    	  }
    	});

      /*用户-删除*/
      function del(teachernumber){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              	var url = "${pageContext.request.contextPath}/teacher/delete";
				var param = {teachernumber:teachernumber};
				$.post(url, param);	
				alert("删除成功！");
	            location.reload();
          });
      }

      function delAll (argument) {
        var ids = [];

        // 获取选中的id 
        $('tbody input').each(function(index, el) {
            if($(this).prop('checked')){
               ids.push($(this).val())
            }
        });
  
        layer.confirm('确认要删除吗？'+ids.toString(),function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      } 
      
      function resetpwd(teacherid){
    	  var result=confirm("是否重置?");
    	  if(result){
    		  var url="${pageContext.request.contextPath}/teacher/resetpwd";
    		  var param={teacherid:teacherid};
    		  $.post(url,param,function(data){
    			  alert(data.content);
    			  if(data.flag==1){
    				  location.reload();
    			  }
    		  });  
    	  }
    	}
    </script>
</html>