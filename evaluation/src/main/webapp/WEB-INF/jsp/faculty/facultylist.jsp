<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-X-admin2.2</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
        <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>  
    </head>
    <script src=${pageContext.request.contextPath}/js/jquery.min.js></script>
    <script type="text/javascript">
function del(facultyid){
	  var result=confirm("是否删除?");
	  if(result){
		  var url="${pageContext.request.contextPath}/faculty/del";
		  var param={facultyid:facultyid};
		  $.post(url,param,function(data){
			  alert(data.content);
			  if(data.flag==1){
				  location.reload();
			  }
		  });  
	  }
	}


	</script>
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
                                <div class="layui-inline layui-show-xs-block">
                                    <input class="layui-input"  autocomplete="off" placeholder="开始日" name="start" id="start">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <input class="layui-input"  autocomplete="off" placeholder="截止日" name="end" id="end">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            <button class="layui-btn layui-btn-danger layui-btn-lg" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                            <button class="layui-btn" onclick="xadmin.open('新增学院','${pageContext.request.contextPath}/faculty/addfaculty',330,260)"><i class="layui-icon"></i>添加</button>
                        </div>
                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                              <thead>
                                <tr>
                                  <th>
                                   <input type="checkbox" lay-filter="checkall" name="checkall" lay-skin="primary">
                                  </th>
                                  <th>学院ID</th>
                                  <th>学院编号</th>
                                  <th>学院名称</th>
                                  <th>操作</th>
                                  
                              </thead>
                              
                              <tbody>
                               <c:forEach items="${faculties}" var="item">
                                <tr>
                                  <td>
                                    <input type="checkbox" name=""  lay-skin="primary">
                                  </td>
                                  <td>${item.facultyid}</td>
                                  <td>${item.facultynumber}</td>
                                  <td>${item.facultyname}</td>
                                  <td class="td-manage">
                                    <button class="layui-btn layui-btn layui-btn-xs"  onclick="xadmin.open('编辑信息','${pageContext.request.contextPath}/faculty/update?facultyid=${item.facultyid}',330,260)" href="javascript:;">
                                        <i class="layui-icon">&#xe642;</i>修改
                                      </button>
                                    <button class="layui-btn-danger layui-btn layui-btn-xs" onclick="del('${item.facultyid}')" href="javascript:;">
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
                                  <span class="current">1</span>
                                  <a class="num" href="">2</a>
                                  <a class="num" href="">3</a>
                                  <a class="num" href="">489</a>
                                  <a class="next" href="">&gt;&gt;</a>
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
        var form = layui.form;
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
    
     
     
      function delAll (argument) {
          var ids = []; 

          // 获取选中的id 
          $('tbody input').each(function(index, el) {
          	var facultyid=$(this).parent().next();
              if($(this).prop('checked')){
              	
                 ids.push(facultyid.html())
              } 
          });
         
           var aa=ids.toString();
         
           alert(typeof aa);
           
           
           layer.confirm('确认要删除吗？'+aa,function(index){
              //捉到所有被选中的，发异步进行删除
             
              $.ajax({
            	  type:"post",
              	  url:"${pageContext.request.contextPath}/faculty/delchecked", 
              	  data:{"aa":aa},
              	  success:function(data){
            		if(data.flag == 1){
            			layer.alert("删除成功", {
                            icon: 1
                        },function(){
                        	location.reload();
                        });
            		}else{alert("删除失败")}
            	}            	  
              })
              
          });
        }

  </script>
    

   
</html>