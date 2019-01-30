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

    <title>下载中心DownloadCenter</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">  

    <link href="css/messenger.css" rel="stylesheet">    
    <link href="css/messenger-theme-future.css" rel="stylesheet">    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <link href="css/header.css" rel="stylesheet">
    <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
  </head>

  <body>
    <div class="container-fluid">
      <header>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="d-block w-100" src="images/2.jpg" alt="First slide">
              <div class="carousel-caption d-none d-md-block" style="color:white">
                <a class="text-user" style="color:white;font-size:1.5em" href="fdoclist.action">文档下载</a>
                <p>上传与下载文档资料的分享平台。</p>
              </div>
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="images/3.jpg" alt="Second slide">
              <div class="carousel-caption d-none d-md-block" style="color:black">
                <a class="text-user" style="color:black;font-size:1.5em" href="fvideolist.action">视频下载</a>
                <p>分享影视作品与记录下的快乐瞬间。</p>
              </div>
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="images/1.jpg" alt="Third slide">
              <div class="carousel-caption d-none d-md-block" style="color:white">
                <a class="text-user" style="color:white;font-size:1.5em" href="fpiclist.action">图片下载</a>
                <p>图片素材分享平台。</p>
              </div>
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
        <div class="row col-12">
          <p class="col-6 blog-header-left blog-header-logo text-center">下载中心 Download Center</p>
          <div class="col-6 blog-header-right  text-center">
            <p class="text-muted">查看下载或上传文件,<a class="text-user text-login" href="user.jsp"><s:property value="#session.name" default="请登录"/></a></p>
          </div>
        </div>

        <div class="row col-12 blog-bar">
          <div class="col-1"></div>
          <div class="col-6">
            <ul class="nav">
              <li class="nav-item">
                <a class="nav-link active text-user" href="fdoclist.action">Document 文档</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-user" href="fvideolist.action">Video 视频</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-user" href="fpiclist.action">Picture 图片</a>
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
        <div class="row col-12">
          <div class="col-3" style="padding-left:0;margin-bottom:300px">
            <nav class="navbar navbar-light">
              <span class="navbar-brand mb-0 h1">  Latest      最新上传</span>
            </nav>
            <ol class="list-group text-center">
          	  <s:iterator value="files"> 
              <li class="list-group-item text-center">
              	<s:property value="fileintro"/>：
              	<a class="text-tb" href="/spring5<s:property value="filedir"/>/<s:property value="filename"/>" download="<s:property value="filename"/>">
              		<s:property value="filename"/></a>              		
              </li>
              </s:iterator>	 
            </ol>
          </div>
          <div class="col-9">
            <nav style="padding-top:30px">
              <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <a class="nav-item text-user nav-link active" id="nav-doc-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-doc" aria-selected="true">文件显示</a>
                <a class="nav-item text-user nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">文件上传</a>
                <a class="nav-item text-user nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">文件下载</a>
              </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
              <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                <div class="card-deck-wrapper container">
                  <div class="card-deck">                                  
                    <div class="card">
                      <div class="card-block card-list">
                        <table class="table">
						 	<thead>
							  <tr>
								<th scope="col">文件名</th>
							    <th scope="col">类型</th>
								<th scope="col">简介</th>
								<th scope="col">时间</th>
							  </tr>
							</thead>
							<tbody>
							<tr>
							<td>filename</td>
							<td>filetype</td>
							<td>fileintro</td>
							<td>uploadtime</td>
							</tr>
							</tbody>
			  			</table>
                      </div>
                      <div class="card-footer">文件以表格形式展现</div>
                    </div>
                    <div class="card">
                      <div class="card-header">
                        <h4>下载文件</h4>
                      </div>
                      <div class="card-block card-list">
                        <ul>
                          <li><a href="fdoclist.action">文档上传</a></li>
                          <li><a href="fvideolist.action">视频上传</a></li>
                          <li><a href="fpiclist.action">图片上传</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">            	
              	<div class="card-deck-wrapper container">
                  <div class="card-deck">
                    
                   	<div class="card">
                      <div class="card-block card-list">
                       		<p class="blog-header-logo">登录后点击上方昵称，进入个人主页，可在“上传文件”栏实现不同类型图片上传。</p>
                      </div>
                    </div>
                    
                    <div class="card">
                      <div class="card-header">
                        <h4>下载文件</h4>
                      </div>
                      <div class="card-block card-list">
                        <ul>
                          <li><a href="fdoclist.action">文档上传</a></li>
                          <li><a href="fvideolist.action">视频上传</a></li>
                          <li><a href="fpiclist.action">图片上传</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                <div class="card-deck-wrapper container">
                  <div class="card-deck">
                    
                   	<div class="card">
                      <div class="card-block card-list">
                       		<p class="blog-header-logo">下载时仅仅有当前tomcat启用时上传后的文件，其他文件可能下载无效</p>
                      </div>
                    </div>
                   
                    <div class="card">
                      <div class="card-header">
                        <h4>下载文件</h4>
                      </div>
                      <div class="card-block card-list">
                        <ul>
                          <li><a href="fdoclist.action">文档上传</a></li>
                          <li><a href="fvideolist.action">视频上传</a></li>
                          <li><a href="fpiclist.action">图片上传</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>


      </div>
    </div>
    <footer class="foot-wrap container-fluid">
      <div class="container">
        <div class="row">
          <div class="col-4">
            <div class="widget">
              <h4 class="title"><i class="fa fa-home"></i> About</h4>
              <ul>
                <li><a href="#">ustc</a></li>
              </ul>
            </div>
          </div>
          <div class="col-4">
            <div class="widget">
              <h4 class="title"><i class="fa fa-desktop"></i> Friendly links</h4>
              <ul>
                <li><a href="#">ustc</a></li>
                <li><a href="#">ustc</a></li>
              </ul>
            </div>
          </div>
          <div class="col-4">
            <div class="widget">
            <h4 class="title"><i class="fa fa-envelope"></i> Contact me</h4>
              <ul>
                <li><a href="#">mobile:xxxxxx</a></li>
                <li><a href="#">email:xxxxx@</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <div class="copyright">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <span>Copyright@</span>  
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
