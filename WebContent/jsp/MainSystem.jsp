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
  <link rel="stylesheet" type="text/css" href="../css/MainSystem.css">
  <script type="text/javascript" src="../js/mainsystem.js"></script>
<title>巡检管理系统</title>
</head>

	<%@page import="servlet.Unit" %>
	<%@page import="servlet.DB_act" %>
	<%
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		String username = request.getParameter("username").trim();
		String name=request.getParameter("name");
		String job=request.getParameter("job");
		String power=request.getParameter("power");
		session.setAttribute("username", username);
	%>
<body>
	
	<div id="header" class="header">
		<div id="header-left" class="header-left">
			<div class="main-title">巡检管理系统</div>
		</div>
		<div id="header-right" class="header-right">
			</br>
			<%out.println(name+"&nbsp&nbsp&nbsp&nbsp"+job);%>
			</br>
			</br>
			<a id="signout" class="easyui-linkbutton"  style="width:110px;height:20px">退    出</a>
		</div>
	</div>
	<div id="content" class="content easyui-layout">
		<div data-options="region:'west',title:'菜单',split:true" style="width:200px;">
			<ul id="main-menu" class="easyui-tree" style="font-size:20px">   
	
			</ul>  
		</div>   

		<div data-options="region:'center',title:'主页'" style="padding:5px;">
			<div>
				hrlll
			</div>
		</div> 
		
	</div>
	<div id="footer" class="footer">
	</div>
	
</body>
</html>