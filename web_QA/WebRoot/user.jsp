<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
base href="<%=basePath%>">
<head>
    <title>AI-复习助手  V.2</title>
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
	<meta name="description" content="app, web app, responsive, responsive layout, admin, admin panel, admin dashboard, flat, flat ui, ui kit, AngularJS, ui route, charts, widgets, components" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	  <link rel="stylesheet" href="lib/css/bootstrap.css" type="text/css" />
	  <link rel="stylesheet" href="lib/css/animate.css" type="text/css" />
	  <link rel="stylesheet" href="lib/css/simple-line-icons.css" type="text/css" />
	  <link rel="stylesheet" href="lib/css/font.css" type="text/css" />
	  <link rel="stylesheet" href="lib/css/app.css" type="text/css" />
</head>

<body class="flat-blue">
<script type="text/javascript">var cpro_id = "u837382";</script>
<script src="http://cpro.baidustatic.com/cpro/ui/f.js" type="text/javascript"></script>
    <div class="app-container">
        <div class="row content-container">
            <nav class="navbar navbar-default navbar-fixed-top navbar-top">
                <div class="container-fluid">
                    <div class="navbar-header" style="height:68px;">
                        <button type="button" class="navbar-expand-toggle">
                            <i class="fa fa-bars icon"></i>
                        </button>
                        <ol class="breadcrumb navbar-breadcrumb">
                            <li class="active">个人中心</li>
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
                                    <img src="img/profile/picjumbo.com_HNCK4153_resize.jpg" class="profile-img">
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
                            <li class="active">
                                <a href="user.jsp">
                                    <span class="icon fa fa-tachometer"></span><span class="title">个人中心</span>
                                </a>
                            </li>
        	        <li class=" panel panel-default dropdown">
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

                            
                            
                           <li class=" panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-form">
                                    <span class="icon fa fa-file-text-o"></span><span class="title">个性化生成</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-form" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="upload.jsp">题库生成</a>
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
            <div class="copyrights">Collect from <a href="#" >© 2018 Copyright.</a></div>
            <!-- Main Content -->
            <div class="container-fluid">

                <div class="side-body padding-top">
	<div class="app app-header-fixed" id="app">
    <!-- content -->
    <div class="app-content">
      <div ui-butterbar></div>
      <a href class="off-screen-toggle hide" data-toggle="class:off-screen" data-target=".app-aside" ></a>
      <div class="app-content-body fade-in-up">
        <!-- COPY the content from "tpl/" -->
          <div class="hbox hbox-auto-xs hbox-auto-sm">
            <div class="col">
              <div style="background:url(img/c4.jpg) center center; background-size:cover">
                <div class="wrapper-lg bg-white-opacity">
                  <div class="row m-t">
                    <div class="col-sm-7">
                      <a href class="thumb-lg pull-left m-r">
                        <img src="img/profile/profile-1.jpg" class="img-circle">
                      </a>
                      <div class="clear m-b">
                        <div class="m-b m-t-sm">
                          <span class="h3 text-black">Double_X</span>
                          <small class="m-l">HUNAN, Chinese</small>
                        </div>
                        <p class="m-b">
                          <a href class="btn btn-sm btn-bg btn-rounded btn-default btn-icon"><i class="fa fa-twitter"></i></a>
                          <a href class="btn btn-sm btn-bg btn-rounded btn-default btn-icon"><i class="fa fa-facebook"></i></a>
                          <a href class="btn btn-sm btn-bg btn-rounded btn-default btn-icon"><i class="fa fa-google-plus"></i></a>
                        </p>
                        <a href class="btn btn-sm btn-success btn-rounded">Follow</a>
                      </div>
                    </div>
                    <div class="col-sm-5">
                      <div class="pull-right pull-none-xs text-center">
                        <a href class="m-b-md inline m">
                          <span class="h3 block font-bold">4</span>
                          <small>上传文档数</small>
                        </a>
                        <a href class="m-b-md inline m">
                          <span class="h3 block font-bold">10</span>
                          <small>题库数</small>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
        <!-- PASTE above -->
      </div>
    </div>
    <!-- /content -->
  </div>
					<div style="float:left;width:30%">
						<div class="row">
							<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12" style="width:80%">
								<a href="pair_list">
									<div class="card yellow summary-inline">
										<div class="card-body">
											<i class="icon fa fa-comments fa-4x"></i>
											<div class="content">
												<div class="title">复习</div>
												<div class="sub-title" style="margin-top:5px">良好的记忆是一遍又一遍的磨砺</div>
											</div>
											<div class="clear-both"></div>
										</div>
									</div>
								</a>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12" style="width:80%">
								<a href="table.jsp">
									<div class="card green summary-inline">
										<div class="card-body">
											<i class="icon fa fa-tags fa-4x"></i>
											<div class="content">
												<div class="title">自测</div>
												<div class="sub-title" style="margin-top:5px">试试你的水平吧</div>
											</div>
											<div class="clear-both"></div>
										</div>
									</div>
								</a>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12" style="width:80%">
                            <a href="#">
                                <div class="card blue summary-inline">
                                    <div class="card-body">
                                        <i class="icon fa fa-share-alt fa-4x"></i>
                                        <div class="content">
                                            <div class="title">分享</div>
                                            <div class="sub-title" style="margin-top:5px">分享你的链接</div>
                                        </div>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </a>
                        </div>
						</div>
					</div>
                    </div>
					<div style="float:left;margin-left:30px;width:60%">
					<div class="row  no-margin-bottom">
                            <div class="card card-success">
                                <div class="card-header">
                                    <div class="card-title">
                                        <div class="title"><i class="fa fa-comments-o"></i> 最近上传文档</div>
                                    </div>
                                    <div class="clear-both"></div>
                                </div>
                                <div class="card-body no-padding">
                                    <ul class="message-list">
                                        <a href="#">
                                            <li>
                                                <img src="img/profile/profile-1.jpg" class="profile-img pull-left">
                                                <div class="message-block">
                                                    <div><span class="username">Double_X</span> <span class="message-datetime">1 min ago</span>
                                                    </div>
                                                    <div class="message">历史.txt</div>
                                                </div>
                                            </li>
                                        </a>
                                        <a href="#">
                                            <li>
                                                <img src="img/profile/profile-1.jpg" class="profile-img pull-left">
                                                <div class="message-block">
                                                    <div><span class="username">Double_X</span> <span class="message-datetime">2 hour ago</span>
                                                    </div>
                                                    <div class="message">历史.pdf</div>
                                                </div>
                                            </li>
                                        </a>
                                        <a href="#">
                                            <li>
                                                <img src="img/profile/profile-1.jpg" class="profile-img pull-left">
                                                <div class="message-block">
                                                    <div><span class="username">Double_X</span> <span class="message-datetime">1 day ago</span>
                                                    </div>
                                                    <div class="message">政治.doc</div>
                                                </div>
                                            </li>
                                        </a>
                                        <a href="#" id="message-load-more">
                                            <li class="text-center load-more">
                                                <i class="fa fa-refresh"></i> 加载更多...
                                            </li>
                                        </a>
                                    </ul>
                                </div>
                            </div>
                        </div>
					</div>
                    
                    </div>
                </div>
            </div>
        </div>

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
            <script type="text/javascript" src="js/index.js"></script>
			<!-- jQuery -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/jquery/bootstrap.js"></script>
  <script type="text/javascript">
    +function ($) {
      $(function(){
        // class
        $(document).on('click', '[data-toggle^="class"]', function(e){
          e && e.preventDefault();
          console.log('abc');
          var $this = $(e.target), $class , $target, $tmp, $classes, $targets;
          !$this.data('toggle') && ($this = $this.closest('[data-toggle^="class"]'));
          $class = $this.data()['toggle'];
          $target = $this.data('target') || $this.attr('href');
          $class && ($tmp = $class.split(':')[1]) && ($classes = $tmp.split(','));
          $target && ($targets = $target.split(','));
          $classes && $classes.length && $.each($targets, function( index, value ) {
            if ( $classes[index].indexOf( '*' ) !== -1 ) {
              var patt = new RegExp( '\\s' + 
                  $classes[index].
                    replace( /\*/g, '[A-Za-z0-9-_]+' ).
                    split( ' ' ).
                    join( '\\s|\\s' ) + 
                  '\\s', 'g' );
              $($this).each( function ( i, it ) {
                var cn = ' ' + it.className + ' ';
                while ( patt.test( cn ) ) {
                  cn = cn.replace( patt, ' ' );
                }
                it.className = $.trim( cn );
              });
            }
            ($targets[index] !='#') && $($targets[index]).toggleClass($classes[index]) || $this.toggleClass($classes[index]);
          });
          $this.toggleClass('active');
        });

        // collapse nav
        $(document).on('click', 'nav a', function (e) {
          var $this = $(e.target), $active;
          $this.is('a') || ($this = $this.closest('a'));
          
          $active = $this.parent().siblings( ".active" );
          $active && $active.toggleClass('active').find('> ul:visible').slideUp(200);
          
          ($this.parent().hasClass('active') && $this.next().slideUp(200)) || $this.next().slideDown(200);
          $this.parent().toggleClass('active');
          
          $this.next().is('ul') && e.preventDefault();

          setTimeout(function(){ $(document).trigger('updateNav'); }, 300);      
        });
      });
    }(jQuery);
  </script>
</body>

</html>
