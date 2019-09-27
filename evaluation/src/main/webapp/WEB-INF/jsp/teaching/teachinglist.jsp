<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html  class="x-admin-sm">
<head>
<title>课程列表</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
       <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
         <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css" media="all" >
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" charset="utf-8"></script>
        <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>  
       
</head>
<meta charset="UTF-8">
<script>
$(document).ready(function(){
	$.ajax({
		url:"${pageContext.request.contextPath}/teaching/getFacultyname",
		success:function(data){
		if(!data)return;
		var html="";
		for(var i in data){
			html+='<option value='+data[i].facultyid+'>'+data[i].facultyname+'</option>';
			
		}
	        $("#getFacultyname").append(html);
	        $("#getFacultyname").change(function(){
	           $("#getMajorname").html("");
	 	       $("#getCoursename").html("");
	 	       $("#getTeachername").html("");
	 	       getMajorname($(this).val());
	        });
	       
	}
	});
});

$(document).ready(function(){
	$.ajax({
		url:"${pageContext.request.contextPath}/teaching/getClassname",
		success:function(data){
		if(!data)return;
		var html="";
		for(var c in data){
			html+='<option value='+data[c].classid+'>'+data[c].classname+'</option>';
			
			
			
		}
	        $("#getClassname").append(html);
	       
	       
	       
	}
	});
});


function getMajorname(facultyid){
	$.ajax({
		url:"${pageContext.request.contextPath}/teaching/getMajorname",
		data:{parentid:facultyid},
		success:function(data){
			if(!data)return;
			var html="";
			for(var j in data){
				html+='<option value='+data[j].majorid+'>'+data[j].majorname+'</option>';	
			}
			$("#getMajorname").append(html);
			$("#getMajorname").change(function(){
				$("#getMajorname").html("");
				 getCoursename($(this).val());
				 getTeachername($(this).val());
			});
			
			
			getCoursename($("#getMajorname").val());
			getTeachername($("#getMajorname").val());
			
		}
	});
}

function getCoursename(majorid){
	$.ajax({
		url:"${pageContext.request.contextPath}/teaching/getCoursename",
		data:{parentid:majorid},
		success:function(data){
			if(!data)return;
			var html="";
			for(var m in data){
				html+='<option value='+data[m].courseid+'>'+data[m].coursename+'</option>';	
			}
			$("#getCoursename").append(html);
			
		}
	});
}


function getTeachername(majorid){
	$.ajax({
		url:"${pageContext.request.contextPath}/teaching/getTeachername",
		data:{parentid:majorid},
		success:function(data){
			if(!data)return;
			var html="";
			for(var n in data){
				html+='<option value='+data[n].teacherid+'>'+data[n].name+'</option>';
				
				
			}
			$("#getTeachername").append(html);
		
			
		}
	});
}



function add(){
	var url="${pageContext.request.contextPath}/teaching/add_submit";
	var param=$("#form").serialize();
	$.post(url,param,function(data){
		alert(data.content);
		if(data.flag==1){
			 location.reload();
		} 
	});
}


function del(teachingid){
	  var result=confirm("是否删除?");
	  if(result){
		  var url="${pageContext.request.contextPath}/teaching/del";
		  var param={teachingid:teachingid};
		  $.post(url,param,function(data){
			  alert(data.content);
			  if(data.flag==1){
				  location.reload();
			  }
		  });  
	  }
	}



</script>
<style>
.layui-btn{margin-top:10px;}
.layui-input{margin-top:10px;}
.layui-input-inline{
margin-top:10px;}

            select{  
    width:200px;  
    height:30px;  
    appearance:none;  
    -moz-appearance:none;  
    -webkit-appearance:none;  
    background-size:10%;
    background: url("../images/type_4.png") no-repeat 180px center;  
    font-size:16px;  
    font-family:Microsoft YaHei;  
    color:#666;  
    outline:none;
}  
         


</style>

<body>
	        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">教学管理</a>
            <a>
              <cite>课程列表</cite></a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                         <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5" action="${pageContext.request.contextPath}/teaching/mselect">
                                <div class="layui-inline layui-show-xs-block">
                                    <input id="mlike" type="text" name="name"  placeholder="请输入教师姓名" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button type="submit" class="layui-btn"  lay-submit=""   lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                            <form id="form">
    
     <div class="layui-input-inline">
      <select name="facultyid" id="getFacultyname">
        <option value="">请选择学院</option>
      </select>
      </div>
      
      <div class="layui-input-inline">
      <select name="majorid" id="getMajorname">
        <option value="">请选择专业</option>
      </select>
      </div>
      
      <div class="layui-input-inline">
      <select name="courseid" id="getCoursename">
        <option value="">请选择课程</option>
      </select>
      </div>
      
      <div class="layui-input-inline">
      <select name="classid" id="getClassname">
        <option value="">请选择班级</option>
      </select>
      </div>
      
      <div class="layui-input-inline">
      <select name="teacherid" id="getTeachername">
        <option value="">请选择教师</option>
      </select>
      </div>
         
        
       
         
                                                                                                                                                                                                                                                                   
<input value="添加" type="button" class="layui-btn" onClick="add()">
</form>
                        </div> 
                        <div class="layui-card-header">
                            <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                           
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                  <tr>
                                    <th>
                                     <input type="checkbox" lay-filter="checkall" name="checkall" lay-skin="primary">
                                    </th>
                                    <th style="display:none;"></th>
                                    <th>专业名称</th>                                   
                                    <th>所授课程</th> 
                                    <th>授课教师</th>
                                    <th>授课班级</th>                          
                                    <th>操作</th>
                                 </tr>
                                </thead>
                               
                                <tbody>       
                                <c:forEach items="${teachings}" var="item">
                                	<tr>
                                		<td>
                                		<input type="checkbox" name=""  lay-skin="primary">
										</td>
										<td style="display:none;">${item.teachingid }</td>
                                		 <td>${item.tv.majorname}</td>
                                		 <td>${item.cou.coursename}</td>
                                		 <td>${item.tv.name }</td> 
                                		 <td>${item.cla.classname }</td> 
                                		
										<td class="td-manage">
										<button class="layui-btn layui-btn layui-btn-xs" 
										onclick="xadmin.open('编辑','${pageContext.request.contextPath}/course/course-update?courseid=${li.courseid }',600,400)"
											href="javascript:;"> <i class="layui-icon">&#xe642;</i>修改
										</button> 
									
										<button class="layui-btn-danger layui-btn layui-btn-xs"
												onclick="del('${item.teachingid}')" href="javascript:;">
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
          	var teachingid=$(this).parent().next();
              if($(this).prop('checked')){
              	
                 ids.push(teachingid.html())
              } 
          });
         
           var aa=ids.toString();
         
          
           
           layer.confirm('确认要删除吗？',function(index){
              //捉到所有被选中的，发异步进行删除
             
              $.ajax({
            	  type:"post",
              	  url:"${pageContext.request.contextPath}/teaching/delcheck", 
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





