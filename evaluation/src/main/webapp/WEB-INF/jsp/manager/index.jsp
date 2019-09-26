<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>后台登录-教师综合评价系统</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <!-- <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" /> -->
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="../X-admin/css/font.css">
        <link rel="stylesheet" href="../X-admin/css/xadmin.css">
        <script src="../X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../X-admin/js/xadmin.js"></script>
        <script type="text/javascript" src="../lib/jquery-3.4.0.min.js"></script>
    </head>
    <body class="index">
       <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a href="./index.html">教师综合评价系统</a></div>
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>
            <ul class="layui-nav left fast-add" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">+新增</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a onclick="xadmin.open('最大化','http://www.baidu.com','','',true)">
                                <i class="iconfont">&#xe6a2;</i>弹出最大化</a></dd>
                        <dd>
                            <a onclick="xadmin.open('弹出自动宽高','http://www.baidu.com')">
                                <i class="iconfont">&#xe6a8;</i>弹出自动宽高</a></dd>
                        <dd>
                            <a onclick="xadmin.open('弹出指定宽高','http://www.baidu.com',500,300)">
                                <i class="iconfont">&#xe6a8;</i>弹出指定宽高</a></dd>
                        <dd>
                            <a onclick="xadmin.add_tab('在tab打开','member-list.html')">
                                <i class="iconfont">&#xe6b8;</i>在tab打开</a></dd>
                        <dd>
                            <a onclick="xadmin.add_tab('在tab打开刷新','member-del.html',true)">
                                <i class="iconfont">&#xe6b8;</i>在tab打开刷新</a></dd>
                    </dl>
                </li>
            </ul>
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">admin</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a onclick="xadmin.open('个人信息','http://www.baidu.com')">个人信息</a></dd>
                        <dd>
                            <a onclick="xadmin.open('login')">切换帐号</a></dd>
                        <dd>
                            <a href="login">退出</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item to-index">
                    <a href="index">前台首页</a></li>
            </ul>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="用户管理">&#xe6b8;</i>
                            <cite>用户管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('教师页面','${pageContext.request.contextPath}/teacher/teacherlist')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>教师管理</cite></a>
                            </li> 
                             <li>
                                
                                <a onclick="xadmin.add_tab('学生列表','${pageContext.request.contextPath}/student/studentlist')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>学生管理</cite></a>
                            </li>   
                        </ul>
                    </li>
                    
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="教学管理">&#xe6b8;</i>
                            <cite>教学管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                        	<li>
                                <a onclick="xadmin.add_tab('院系列表','${pageContext.request.contextPath}/faculty/facultylist')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>院系列表</cite></a>
                            </li>
                        	<li>
                                <a onclick="xadmin.add_tab('专业列表','${pageContext.request.contextPath}/major/majorlist')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>专业列表</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('课程列表','${pageContext.request.contextPath}/course/course-list')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>课程列表</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('授课页面','welcome1.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>授课列表</cite></a>
                            </li>   
                        </ul>
                    </li>                                 
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="得分管理">&#xe6b8;</i>
                            <cite>得分管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('得分表','welcome1.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>得分表</cite></a>
                            </li>   
                        </ul>
                    </li>                    
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="权限管理">&#xe6b8;</i>
                            <cite>权限管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('权限列表','welcome1.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>权限列表</cite></a>
                            </li>   
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="Excel导入信息">&#xe6b8;</i>
                            <cite>Excel导入信息</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('学生信息','${pageContext.request.contextPath}/student/studentimport')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>学生信息导入</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('教师信息','${pageContext.request.contextPath}/teacher/teacherimport')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>教师信息导入</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('课程信息导入' , '${pageContext.request.contextPath}/course/courseimport')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>课程信息导入</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('专业信息','${pageContext.request.contextPath}/major/majorimport')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>专业信息导入</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('院系信息','${pageContext.request.contextPath}/faculty/facultyimport')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>院系信息导入</cite></a>
                            </li> 
                            <li>
                                <a onclick="xadmin.add_tab('授课信息','${pageContext.request.contextPath}/teaching/teachingimport')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>授课信息导入</cite></a>
                            </li>  
                        </ul>
                    </li>     
                 </ul>   
            </div>
        </div>
        <!-- <div class="x-slide_left"></div> -->
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
            <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
                <ul class="layui-tab-title">
                    <li class="home">
                        <i class="layui-icon">&#xe68e;</i>我的桌面</li></ul>
                <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
                    <dl>
                        <dd data-type="this">关闭当前</dd>
                        <dd data-type="other">关闭其它</dd>
                        <dd data-type="all">关闭全部</dd></dl>
                </div>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe src='./welcome.html' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                    </div>
                </div>
                <div id="tab_show"></div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <style id="theme_style"></style>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
        <script>//百度统计可去掉
            var _hmt = _hmt || []; (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();</script>
    </body>

</html>