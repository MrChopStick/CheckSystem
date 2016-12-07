<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- AdminLTE form -->
    <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="../AdminLTE/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../AdminLTE/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../AdminLTE/dist/css/skins/_all-skins.min.css">
  
  	<script src="../js/jquery.js"></script>	
	<script src="../js/login.js"></script>
  
  
  <link rel="stylesheet" type="text/css" href="../css/login.css">
  <script type="text/javascript" src="../js/login.js"></script>
<title>login</title>
</head>
<body style="width:100%;height:100%">

	    <div style="width:300px;float:right;margin-right:320px;margin-top:160px">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">系统登录</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="/CheckSystem/Login?Type=WebGet" method="POST" id="loginform" >
              <div class="box-body">
                <div class="form-group">
                  <label for="username">用户名</label>
                  <input type="text" class="form-control" id="username" name="username" placeholder="用户名">
                </div>
                <div class="form-group">
                  <label for="password">密码</label>
                  <input type="password" class="form-control" id="password" name="password" placeholder="密码">
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
              
                 <button type="reset"  class="btn btn-default" style="float:right">重置</button>
                 <input type="button" id="login-form-submit" class="btn btn-primary" value="登录"  style="float:right;margin-right:20px">
              </div>
            </form>
          </div>
          <!-- /.box -->
          </div>
            
    <!-- jQuery 2.2.3 -->
	<script src="../AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="../AdminLTE/bootstrap/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="../AdminLTE/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="../AdminLTE/dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../AdminLTE/dist/js/demo.js"></script>

</body>
</html>