<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
       <meta charset="UTF-8">
<title>专业列表</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="../X-admin/css/font.css">
        <link rel="stylesheet" href="../X-admin/css/xadmin.css">
        <!--  <link rel="stylesheet" href="../X-admin/css/theme5.css"> -->
        <script src="../X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../X-admin/js/xadmin.js"></script>
        <script type="text/javascript" src="../js/jquery.min.js" charset="utf-8"></script>
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
            <a href="">教学管理</a>
            <a>
              <cite>专业列表</cite></a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                         <div class="layui-card-body ">
                           <form class="layui-form layui-col-space5" action="${pageContext.request.contextPath}/major/mselect"> 
                                <div class="layui-inline layui-show-xs-block">
                                    <input id="mlike" type="text" name="majorname"  placeholder="请输入专业名" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button type="submit" class="layui-btn layui-btn-lg"  lay-submit=""   lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div> 
                        <div class="layui-card-header">
                             <button class="layui-btn layui-btn-danger layui-btn-lg" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                            <button class="layui-btn layui-btn-lg" onclick="xadmin.open('添加用户','${pageContext.request.contextPath}/major/addmajor',600,400)"><i class="layui-icon"></i>添加</button>
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table" lay-filter="mylist" lay-size="lg">
                                <thead>
                                  <tr>
                                    <th lay-data="{type:'checkbox',fixed:'left'}">
                                      <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                                    </th>                                   
                                    <th lay-data="{field:'ID', align:'center',width:115}">ID</th>
                                    <th lay-data="{field:'number', align:'center',width:200}">专业编号</th>
                                    <th lay-data="{field:'name', align:'center',width:200}">专业名称</th>
                                    <th lay-data="{field:'faculty', align:'center',width:200}">院系</th>  
                                    <th lay-data="{field:'option',align:'center',width:300,fixed: 'right'}">操作</th></tr>
                                </thead>
                                <tbody>       
                                 <c:forEach items="${majors}" var="item">
                                  <tr>
                                    <td>
                                      <input type="checkbox" name="id" value="1"   lay-skin="primary"> 
                                    </td>
                                    <td> ${item.majorid}</td>
                                    <td> ${item.majornumber}</td>
                                    <td> ${item.majorname}</td>
                                    <td> ${item.faculty.facultyname}</td>
                                   
                                    
                                    <td class="td-manage">
                                      <button class="layui-btn layui-btn " 
                                       href="javascript:;" onclick="xadmin.open('编辑','${pageContext.request.contextPath}/major/updatemajor?majorid=${item.majorid }',600,400)" >
                                        <i class="layui-icon">&#xe642;</i>修改
                                      </button> 
                                      <button class="layui-btn-danger layui-btn "
                                     onclick="member_del(this,'${item.majorid}')" href="javascript:;">
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

       /*用户-停用*/
      function member_stop(obj,id){
          layer.confirm('确认要停用吗？',function(index){

              if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

              }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
              }
              
          });
      }

      /*删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
          });
          var url="${pageContext.request.contextPath}/major/delmajor";
          var majorid=id;
          var param={majorid:majorid};
          $.post(url,param,function(data){
      		var result=confirm("你确定要删除该用户吗？");
      		if(result){
      			//删除用户
      			alert(data.msg);
      			location.reload();
      		}
      		
      	});
      }
      
   // 用户-修改
//       function xadmin.open(title,url,id,w,h) {
//           x_admin_show(title,url+"?majorid="+id,w,h); 
         
//       }


 /*批量删除*/
      function delAll (argument) {
        var ids = "";

        // 获取选中的id 
        $('tbody input').each(function(index, el) {
        	var majorid = $(this).parent().next();
            if($(this).prop('checked')){
               //ids.push($(this).val())
            ids+=majorid.html()+",";
            }
        });
        ids = ids.substring(0,ids.length-1);
  		
  
        layer.confirm('确认要删除吗？'+ids.toString(),function(index){
            //捉到所有被选中的，发异步进行删除
            layer.closeAll();      
            $.ajax({
          	  type:"post",
            	  url:"${pageContext.request.contextPath}/major/delallmajor", 
            	  data:{"ids":ids},
            	  success:function(data){
          		if(data.flag == 1){
          			layer.alert("删除成功", {
                          icon: 1
                      },function(){
                      	xadmin.father_reload();
                      });
          		}
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
     		 url:"${pageContext.request.contextPath}/major/mselect",
     		 data:{"majorname":name},
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