
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
    <title>AI-复习助手 V.2 </title>

	<script type="text/javascript"> 
function add(){ 
		 var yuansu = document.getElementById('q1');
			if(yuansu.style.visibility == "visible"){
			  yuansu.style.visibility = "hidden";
				}else{
			  yuansu.style.visibility = "visible";
		 }
	    
				} 

function add1(){ 
		 var yuansu = document.getElementById('q2');
			if(yuansu.style.visibility == "visible"){
			  yuansu.style.visibility = "hidden";
				}else{
			  yuansu.style.visibility = "visible";
		 }
	    
} 

function add2(){ 
		 var yuansu = document.getElementById('q3');
			if(yuansu.style.visibility == "visible"){
			  yuansu.style.visibility = "hidden";
				}else{
			  yuansu.style.visibility = "visible";
		 }
	    
} 

function add3(){ 
		 var yuansu = document.getElementById('q4');
			if(yuansu.style.visibility == "visible"){
			  yuansu.style.visibility = "hidden";
				}else{
			  yuansu.style.visibility = "visible";
		 }
	    
} 
function add4(){ 
		 var yuansu = document.getElementById('q5');
			if(yuansu.style.visibility == "visible"){
			  yuansu.style.visibility = "hidden";
				}else{
			  yuansu.style.visibility = "visible";
		 }
	    
} 
function add5(){ 
		 var yuansu = document.getElementById('q6');
			if(yuansu.style.visibility == "visible"){
			  yuansu.style.visibility = "hidden";
				}else{
			  yuansu.style.visibility = "visible";
		 }
	    
} 
function add6(){ 
		 var yuansu = document.getElementById('q7');
			if(yuansu.style.visibility == "visible"){
			  yuansu.style.visibility = "hidden";
				}else{
			  yuansu.style.visibility = "visible";
		 }
	    
} 
function add7(){ 
		 var yuansu = document.getElementById('q8');
			if(yuansu.style.visibility == "visible"){
			  yuansu.style.visibility = "hidden";
				}else{
			  yuansu.style.visibility = "visible";
		 }
	    
} 
function add8(){ 
		 var yuansu = document.getElementById('q9');
			if(yuansu.style.visibility == "visible"){
			  yuansu.style.visibility = "hidden";
				}else{
			  yuansu.style.visibility = "visible";
		 }
	    
} 
function add9(){ 
		 var yuansu = document.getElementById('q0');
			if(yuansu.style.visibility == "visible"){
			  yuansu.style.visibility = "hidden";
				}else{
			  yuansu.style.visibility = "visible";
		 }
	    
} 

</script>





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

<body class="flat-blue">
    <div class="app-container">
        <div class="row content-container">
            <nav class="navbar navbar-default navbar-fixed-top navbar-top">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-expand-toggle">
                            <i class="fa fa-bars icon"></i>
                        </button>
                        <ol class="breadcrumb navbar-breadcrumb">
                            <li>复习中心</li>
                            <li class="active">自评自测</li>
                        </ol>
                        <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                            <i class="fa fa-th icon"></i>
                        </button>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                            <i class="fa fa-times icon"></i>
                        </button>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-comments-o"></i></a>
                            <ul class="dropdown-menu animated fadeInDown">
                                <li class="title">
                                    Notification <span class="badge pull-right">0</span>
                                </li>
                                <li class="message">
                                    No new notification
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown danger">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-star-half-o"></i> 4</a>
                            <ul class="dropdown-menu danger  animated fadeInDown">
                                <li class="title">
                                    Notification <span class="badge pull-right">4</span>
                                </li>
                                <li>
                                    <ul class="list-group notifications">
                                        <a href="#">
                                            <li class="list-group-item">
                                                <span class="badge">1</span> <i class="fa fa-exclamation-circle icon"></i> new registration
                                            </li>
                                        </a>
                                        <a href="#">
                                            <li class="list-group-item">
                                                <span class="badge success">1</span> <i class="fa fa-check icon"></i> new orders
                                            </li>
                                        </a>
                                        <a href="#">
                                            <li class="list-group-item">
                                                <span class="badge danger">2</span> <i class="fa fa-comments icon"></i> customers messages
                                            </li>
                                        </a>
                                        <a href="#">
                                            <li class="list-group-item message">
                                                view all
                                            </li>
                                        </a>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown profile">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Emily Hart <span class="caret"></span></a>
                            <ul class="dropdown-menu animated fadeInDown">
                                <li class="profile-img">
                                    <img src="../../img/profile/picjumbo.com_HNCK4153_resize.jpg" class="profile-img">
                                </li>
                                <li>
                                    <div class="profile-info">
                                        <h4 class="username">Emily Hart</h4>
                                        <p>emily_hart@email.com</p>
                                        <div class="btn-group margin-bottom-2x" role="group">
                                            <button type="button" class="btn btn-default"><i class="fa fa-user"></i> Profile</button>
                                            <button type="button" class="btn btn-default"><i class="fa fa-sign-out"></i> Logout</button>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="side-menu sidebar-inverse">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="side-menu-container">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="welcome.jsp">
                                <div class="icon fa fa-paper-plane"></div>
                                <div class="title">AI-复习助手 V.2</div>
                            </a>
                            <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                                <i class="fa fa-times icon"></i>
                            </button>
                        </div>
                        <ul class="nav navbar-nav">
                            <li>
                                <a href="user.jsp">
                                    <span class="icon fa fa-tachometer"></span><span class="title">个人中心</span>
                                </a>
                            </li>
                         
                            <li class="active panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-table">
                                    <span class="icon fa fa-table"></span><span class="title">复习中心</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-table" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                              <li><a href="pair_list">智能题库</a>
                                            </li>
										
                                             <li>
                                             		<a href="table.jsp">自评自测</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-form">
                                    <span class="icon fa fa-file-text-o"></span><span class="title">个性化生成</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-form" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="upload.jsp">生成题库</a>
                                            </li>

                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <!-- Dropdown-->
                        
                            <!-- Dropdown-->
                         
                            <!-- Dropdown-->
                       
                            <li>
                                <a href="license.jsp">
                                    <span class="icon fa fa-thumbs-o-up"></span><span class="title">上传协议</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>
            </div>
            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                     <div class="page-title">
                        <span class="title">自评自测</span>
                        <div class="description">随机生成概率最大的问题.</div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="card">
           
                                <div class="card-body">
                   
                  
                                    <div class="row">
                                        <div class="col-sm-12 col-md-6" style="margin-left:311px;width:60%">
                                            <div class="sub-title">开始 检测吧 ！！</div>
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>序号</th>
                                                          <th>问题</th>
                                                        <th>查看答案</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="active">
                                                          <th scope="row">1</th>
                                                        <td>什么是中国境内已知的最早的人类？</td>
                                                        <td><a  onclick="add();">点击查看</a></td>
                                                        <td style="visibility: hidden;" id="q1" >元谋人生活在距今约一百七十万年，是中国境内已知的最早的人类。</td>
                                                    </tr>
                                                    <tr>
                                                         <th scope="row">2</th>
                                                        <td>什么时候中国开始出现铁具？</td>
                                                        <td><a onclick="add1();">点击查看</a></td>
                                                        <td style="visibility: hidden;" id="q2" >春秋时期中国开始出现铁具。</td>
                                                    </tr>
                                                    <tr class="success">
                                                        <th scope="row">3</th>
                                                        <td>山顶洞人是否掌握光和钻孔技术?</td>
                                                        <td><a  onclick="add2();">点击查看</a></td>
                                                        <td style="visibility: hidden;" id="q3" >山顶洞人用打造石器，但已掌握光和钻孔技术。</td>
                                                    </tr>
                                                    <tr>
                                                         <th scope="row">4</th>
                                                        <td>什么是人和动物的根本区别？</td>
                                                        <td><a onclick="add3();">点击查看</a></td>
                                                        <td style="visibility: hidden;" id="q4" >会不会制造工具是人和动物的根本区别。</td>
                                                    </tr>
                                                    <tr class="info">
                                                         <th scope="row">5</th>
                                                        <td>春秋时期第一霸主是谁</td>
                                                        <td><a onclick="add4();">点击查看</a></td>
                                                        <td style="visibility: hidden;" id="q5" >春秋时期第一个霸主是齐桓公。</td>
                                                    </tr>
                                                   
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                 
                </div>
            </div>
        </div>
        <footer class="app-footer">
            <div class="wrapper">
                <span class="pull-right">2.1 <a href="#"><i class="fa fa-long-arrow-up"></i></a></span> © 2018 Copyright.
            </div>
        </footer>
    <div>
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
    <!-- Javascript -->
    <script type="text/javascript" src="js/app.js"></script>
</body>

</html>
