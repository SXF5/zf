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
        <link rel="stylesheet" href="../css/font.css">
        <link rel="stylesheet" href="../css/xadmin.css">
        <script src="../lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../js/xadmin.js"></script>  
    </head>
    <script src=../js/jquery.min.js></script>
    <script type="text/javascript">
    /*删除*/
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
	<style type="text/css">
    	.layui-table td, .layui-table th {
			min-width: 10px;
		}			
    </style>
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
                           <form class="layui-form layui-col-space5" action="${pageContext.request.contextPath}/faculty/mselect">
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" id="mlike" name="facultyname" value=""  placeholder="请输入院系名" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button type="submit" class="layui-btn layui-btn-lg"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            <button class="layui-btn layui-btn-danger layui-btn-lg" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                            <button class="layui-btn layui-btn-lg"  onclick="xadmin.open('新增学院','${pageContext.request.contextPath}/faculty/addfaculty',600,400)"><i class="layui-icon"></i>添加</button>
                        </div>
                        <div class="layui-card-body ">
                            <table class="layui-table" lay-filter="mylist" lay-size="lg">
                              <thead>
                                <tr>
                                  <th lay-data="{type:'checkbox',fixed:'left'}">
                                   <input type="checkbox" lay-filter="checkall" name="checkall" lay-skin="primary">
                                  </th>
                                  <th lay-data="{field:'ID', align:'center',width:215}">学院ID</th>
                                  <th lay-data="{field:'number', align:'center',width:230}">学院编号</th>
                                  <th lay-data="{field:'name', align:'center',width:220}">学院名称</th>
                                  <th lay-data="{field:'option',align:'center',width:350,fixed: 'right'}">操作</th>
                              </thead>
                              <tbody>
                               <c:forEach items="${faculties}" var="item">
                                <tr>
                                  <td><input type="checkbox" name=""  lay-skin="primary"></td>
                                  <td>${item.facultyid}</td>
                                  <td>${item.facultynumber}</td>
                                  <td>${item.facultyname}</td>
                                  <td class="td-manage">
                                  <button class="layui-btn layui-btn layui-btn" 
                                       onclick="xadmin.open('编辑信息','${pageContext.request.contextPath}/faculty/update?facultyid=${item.facultyid}',600,400)" href="javascript:;">
                                       <i class="layui-icon">&#xe642;</i>修改
                                      </button>
                                      <button class="layui-btn-danger layui-btn layui-btn"
                                     onclick="del('${item.facultyid}')" href="javascript:;">
                                     <i class="layui-icon">&#xe640;</i>删除
                                 </button> 
                                 </td>  
                               </tr>
                               </c:forEach>
                             </tbody>  
                            </table>
                        </div>                        
                    </div>
                </div>
            </div>
        </div> 
    </body>
    <script>
    $(function(){
    	layui.use('table',function(){
    	       var table = layui.table;
    	       //转换静态表格
    	       table.init('mylist', {
    	           height: '460' //高度最大化减去差值,也可以自己设置高度值：如 height:300
    	           ,count: 50 //数据总数 服务端获得
    	           ,limit: 7 //每页显示条数 注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致    	           
    	           ,page:true //开启分页    	           	          
    	           ,limits:[7,10, 20, 30, 40, 50]//分页显示每页条目下拉选择    	          
    	       });
    	});
    	
    	//监听头工具栏事件
		/* table.on('toolbar(mylist)', function(obj){
			var checkStatus = table.checkStatus(obj.config.id)
			,data = checkStatus.data; //获取选中的数据 
			switch(obj.event){ 
			 case 'add': 
				
			break;
			case 'update':
				
			break;
			case 'delete':
				
			break; 
			};
		}); */
    });
    //表单
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
    
      /*批量删除*/
     
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
      //模糊查询
      function selectm(){
     	 var name = $("#mlike").val();
     	 alert(name);
     	 $.ajax({
     		 type:"post",
     		 url:"${pageContext.request.contextPath}/faculty/mselect",
     		 data:{"facultyname":name},
     		 success:function(data){
     			 if(data.flag == 1){
          			layer.alert("查询成功", {
                          icon: 1
                      },function(){
                      	xadmin.father_reload();
                      });
          		}else{
          			layer.alert("查询失败", {
                         icon: 1
                     },function(){
                     	xadmin.father_reload();
                     });
          		}
     		 }
     	 })
      }

  </script>
    

   
</html>