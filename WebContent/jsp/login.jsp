<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 引入JQuery -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui/jquery.min.js"></script>
  <script type="text/javascript" src="../js/jquery.js"></script>
  <!-- 引入EasyUI -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui/jquery.easyui.min.js"></script>
  <!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
  <!-- 引入EasyUI的样式文件-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-easyui/themes/default/easyui.css" type="text/css"/>
  <!-- 引入EasyUI的图标样式文件-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-easyui/themes/icon.css" type="text/css"/>
  <link rel="stylesheet" type="text/css" href="../css/login.css">
  <script type="text/javascript" src="../js/login.js"></script>
<title>login</title>
</head>
<body style="width:100%;height:100%">
    <form id="login-form" name="loginform" action="./MainSystem.jsp" method="POST">
	 <div id="login-form-panel" class="easyui-panel" title="系统登录" style="width:400px;padding:30px 60px">
		<div style="margin-bottom:20px">
			<div>用户名:</div>
			<input class="easyui-textbox" type="text" id="username" name="username" style="width:100%;height:40px">
		</div>
		<div style="margin-bottom:20px"> 
			<div>密码:</div>
			<input class="easyui-textbox" id="password" name="password" type="password" style="width:100%;height:40px">
		</div>
		<div>
			<a id="login-form-submit" class="easyui-linkbutton"  style="width:100%;height:40px" >登       录</a>
		</div>
		<input type ="hidden" id="name" name="name">
		<input type ="hidden" id="phone" name="phone">
		<input type ="hidden" id="job" name="job">
		<input type ="hidden" id="power" name="power">
	 </div>
	</form>
</body>
</html>