<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
    <title>AI-复习助手 V.2</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="lib/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/themes/flat-blue.css">
</head>

<body class="flat-blue landing-page">
    <nav class="navbar navbar-inverse navbar-fixed-top  navbar-affix" role="navigation" data-spy="affix" data-offset-top="60">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="welcome.jsp">
                    <div class="icon fa fa-paper-plane"></div>
                    <div class="title">AI-复习助手 V.2</div>
                </a>
            </div>
            <div id="navbar" class="navbar-collapse collapse " aria-expanded="true">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="user.jsp">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>
    <div class="jumbotron app-header">
        <div class="container">
            <h2 class="text-center"><i class="app-logo fa fa-connectdevelop fa-5x color-white"></i><div class="color-white">AI-复习助手 V.2</div></h2>
            <p class="text-center color-white app-description"></p>
            <p class="text-center"><a class="btn btn-primary btn-lg app-btn" href="login.jsp" role="button">登陆</a></p>
        </div>
    </div>
    <div class="container-fluid app-content-a">
        <div class="container">        <div class="row text-center">
            <div class="col-md-4 col-sm-6">
                <span class="fa-stack fa-lg fa-5x">
                  <i class="fa fa-circle-thin fa-stack-2x"></i>
                  <i class="fa fa-twitter fa-stack-1x"></i>
                </span>
                <h2>复习中心</h2>
                <p>包括智能题库，自评自测，更新，让你的复习全程无忧，更专业，更具体</p>
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-md-4 col-sm-6">
                <span class="fa-stack fa-lg fa-5x">
                  <i class="fa fa-circle-thin fa-stack-2x"></i>
                  <i class="fa fa-inbox fa-stack-1x"></i>
                </span>
                <h2>个性化生成</h2>
                <p>通过用户上传的文档，后台智能的生成题库，生成的内容更细节，让你更快的复习</p>
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-md-4 col-sm-6">
                <span class="fa-stack fa-lg fa-5x">
                  <i class="fa fa-circle-thin fa-stack-2x"></i>
                  <i class="fa fa-comments-o fa-stack-1x"></i>
                </span>
                <h2>智能小Q</h2>
                <p>一个简易的APP，让你可以随时通过关键字查看你的智能题库，更贴心，更懂你</p>
            </div>
            <!-- /.col-lg-4 -->
        </div>
        </div>
    </div>
 
    <div class="container-fluid app-content-b contact-us">
        <div class="container">
            <div class="row featurette">
                <div class="col-md-6"><h2 class="color-white contact-us-header">联系我们</h2>
                <p class="color-white contact-us-description">如果有更好的算法或者是对于界面的优化建议，请联系我们可爱的程序员哦</p></div>
                <div class="col-md-6">
                    <form>

                        <div class="row">
                            <div class="col-sm-6"><input id="name" name="name" type="text" class="form-control" placeholder="Full Name"> </div>
                            <div class="col-sm-6"><input id="email" name="email" type="email" class="form-control" placeholder="Email address"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12"><textarea id="message" name="message" class="form-control" placeholder="Your Message" rows="5"></textarea></div>
                        </div>
                        <div>
                            <button id="contact-submit" type="submit" class="btn btn-success pull-right">Send</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- /END THE FEATURETTES -->
    <!-- FOOTER -->
    <footer class="app-footer">
      <div class="container">
        <p class="text-muted">&copy; 2018, Double_X</p>
      </div>
    </footer>
    <!-- Javascript Libs -->
    <script type="text/javascript" src="lib/js/jquery.min.js"></script>
    <script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="lib/js/Chart.min.js"></script>
    <script type="text/javascript" src="lib/js/bootstrap-switch.min.js"></script>
    <script type="text/javascript" src="lib/js/jquery.matchHeight-min.js"></script>
    <script type="text/javascript" src="lib/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="lib/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="lib/js/select2.full.min.js"></script>
    <script type="text/javascript" src="lib/js/ace/ace.js"></script>
    <script type="text/javascript" src="lib/js/ace/mode-html.js"></script>
    <script type="text/javascript" src="lib/js/ace/theme-github.js"></script>
    <!-- /.container -->
</body>

</html>
