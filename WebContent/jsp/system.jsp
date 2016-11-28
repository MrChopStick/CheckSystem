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
  
<title>巡检系统</title>
</head>
<body>
	<div >
		<p style="width:100%;height:100px;font-size:40px">巡检管理系统</p>
	</div>
	<div class="easyui-layout" style="width:400px;height:200px;">
	
		<div region="west" split="true" title="Navigator" style="width:150px;">
			<p style="padding:5px;margin:0;">Select language:</p>
			<ul>
				<li><a href="javascript:void(0)" onclick="showcontent('java')">Java</a></li>
				<li><a href="javascript:void(0)" onclick="showcontent('cshape')">C#</a></li>
				<li><a href="javascript:void(0)" onclick="showcontent('vb')">VB</a></li>
				<li><a href="javascript:void(0)" onclick="showcontent('erlang')">Erlang</a></li>
			</ul>
		</div>
		<div id="content" region="center" title="Language" style="padding:5px;">
		</div>
	</div>
</body>
</html>