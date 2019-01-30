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
      <div class="container-fluid row">
      	<div class="col-2"></div>
      	<div class="col-8">
      		<table class="table">
			 	<thead>
				  <tr>
					<th scope="col">文件名</th>
				    <th scope="col">文件类型</th>
					<th scope="col">文件简介</th>
					<th scope="col">上传时间</th>
				  </tr>
				</thead>
				<tbody>
				  <s:iterator value="files">             
			      <tr>	             		        	     	
			      <td><a href="/spring5<s:property value="filedir"/>/<s:property value="filename"/>" download="<s:property value="filename"/>"><s:property value="filename"/></a></td>
			      <td><s:property value="filesort"/></td>
			      <td><s:property value="fileintro"/></td>
			      <td><s:property value="updatetime"/></td>    				
			      </tr>
			      </s:iterator>	 
				  </tbody>
			    </table>
	  	  </div>   
     	  <div class="col-2"></div>
      
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
      
      
 