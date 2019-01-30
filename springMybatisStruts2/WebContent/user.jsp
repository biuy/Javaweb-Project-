<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
  	<base href="<%=basePath%>">
  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>下载中心/个人主页</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">  

    <link href="css/messenger.css" rel="stylesheet">    
    <link href="css/messenger-theme-future.css" rel="stylesheet">    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="css/header.css" rel="stylesheet">
    <link href="css/user.css" rel="stylesheet">
    <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
  </head>

  <body>
    <div class="container-fluid">
    <header>
        <div class="row col-12">
          <p class="col-6 blog-header-left blog-header-logo text-center">下载中心 ——个人主页</p>
         <div class="col-6 blog-header-right  text-center">
            <p class="text-muted">欢迎来到下载中心<a class="text-user text-login" href="usignout.action"><s:property value="#session.name" default="请登录"/>,退出登录</a></p>
          </div>
        </div>
        <div class="row col-12 blog-bar">
          <div class="col-1"></div>
          <div class="col-6">
             <ul class="nav">
               <li class="nav-item">
                <a class="nav-link active text-user" href="fuploadlist.action">历史上传</a>
              </li>
              </li>
              <li class="nav-item">
                <a class="nav-link text-user" href="user.jsp">上传文件</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-user" href="uindex.action">更多下载</a>
              </li>
            </ul>
          </div>
          <div class="col-1"></div>
          <div class="col-4">
            <form class="form-inline mt-2">
              <input type="text" class="form-control" name="search">
              <input type="button" class="btn btn-primary" name="dosearch" value="搜索">
            </form>
          </div>

        </div>    
      </header>
      
      <div class="container-fluid">
        
        <div class="row col-12" style="padding-top:20px">
          <div class="col-1"></div>
          <div class="col-2">
            <div class="list-group" id="list-tab" role="tablist">
              <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">上传文档</a>
              <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">上传视频</a>
              <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">上传图片</a>
            </div>
          </div>
          <div class="col-8">
          	<div class="tab-content" id="nav-tabContent">
              <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">                                      
	                <h4 class="form-upload">上传文档</h4>
	                <hr width="100%">
					<s:fielderror/> 
	                <form class="form-signin" method="post" enctype="multipart/form-data" action="fdoc.action">
	                  文件选择：<s:file name="file" class="form-control"/>
	                  文件类型：<select name="filesort" class="form-control">
								<option value="考试资料">考试资料
								<option value="通知文档">通知文档
								<option value="实验报告">实验报告
						</select>
	                  文件描述：
	                  <textarea name="fileintro" class="form-control" rows="3" style="width:100%" placeholder="不超过50字"></textarea>                   
	                  <button class="btn btn-lg btn-primary btn-block" id="check" type="submit">提交</button>
	                </form>                       
	          </div>
	           
              <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
            	<h4 class="form-upload">上传视频</h4>
	                <hr width="100%">
	                 <s:fielderror/>
	                <form class="form-signin" method="post" enctype="multipart/form-data" action="fvideo.action">
	                  文件选择：<s:file name="file" class="form-control"/>  
	                  文件类型：<select name="filesort" class="form-control">
								<option value="其他">其他
						</select>
	                  文件描述：
	                  <textarea name="fileintro" class="form-control" rows="3" style="width:100%" placeholder="不超过50字"></textarea>                   
	                  <button class="btn btn-lg btn-primary btn-block" id="check" type="submit">提交</button>
	                </form>
	            	
	    		 
	   			  
              </div>
              <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">
              	<h4 class="form-upload">上传图片</h4>
	                <hr width="100%">
	                 <s:fielderror/>
	                <form class="form-signin" method="post" enctype="multipart/form-data" action="fpic.action">
	                  文件选择：<s:file name="file" class="form-control"/>  
	                  文件类型：<select name="filesort" class="form-control">
								<option value="其他">其他
						</select>
	                  文件描述：
	                  <textarea name="fileintro" class="form-control" rows="3" style="width:100%" placeholder="不超过50字"></textarea>                   
	                  <button class="btn btn-lg btn-primary btn-block" id="check" type="submit">提交</button>
	                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript" src="js/jquery-3.3.1.slim.min.js"></script>
    <script type="text/javascript" src="js/scripts.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/messenger.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.js"></script>
    <script type="text/javascript" src="js/jquery.htmlClean.js"></script>
  </body>
</html>