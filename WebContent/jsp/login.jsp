<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 引入JQuery -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui/jquery.min.js"></script>
  <!-- 引入EasyUI -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui/jquery.easyui.min.js"></script>
  <!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
  <!-- 引入EasyUI的样式文件-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-easyui/themes/default/easyui.css" type="text/css"/>
  <!-- 引入EasyUI的图标样式文件-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-easyui/themes/icon.css" type="text/css"/>
      <script>
	function Submit() {
	 var username=document.getElementById("username").value;//获取用户名
	 var password=document.getElementById("password").value;//获取密码

	 var bFlag=true;//
	 
	 if(username==""&&password==""){
		 alert("请输入用户名和密码！");
		 bFlag=false;
	 }
	 else if(username==""){
		 alert("请输入用户名！");
		 bFlag=false;
	 }
	 else if(password==""){
		 alert("请输入密码！");
		 bFlag=false;
	 }
	 else{
		 
	}
	 /*
	 else if(username=="root"&&password=="123"){
		 window.open('EquiManag.html');
	 }
	 else if(username=="root"&&password=="456"){
		 window.open('DeptManag.html');
	 }
	 else if(username=="root"&&password=="789"){
		 window.open('SysManag.html');
	 }*/
	 
	 return bFlag;
 }
	</script>
<title>login</title>
</head>
<body style="width:100%;height:100%">
	<h2>巡检系统登录</h2>
    <form name="Loginform" action="./CheckLogin.jsp" method="POST">
	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" title="Register" style="width:400px;padding:30px 60px">
		<div style="margin-bottom:20px">
			<div>用户名:</div>
			<input class="easyui-textbox" id="username" style="width:100%;height:32px">
		</div>
		<div style="margin-bottom:20px"> 
			<div>密码:</div>
			<input class="easyui-textbox" id="password" style="width:100%;height:32px">
		</div>
		<div>
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" style="width:100%;height:32px" onClick="Submit()">登录</a>
		</div>
		<button type="submit">login</button>
	</div>
	</form>
</body>
</html>