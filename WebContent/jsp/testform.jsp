<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="http://localhost:8080/CheckSystem/TestLogin" method="GET" name="Loginform">
			<table style="#CCCCCC solid; border-radius:1px" align="center" cellpadding="2px" border="0" cellspacing="15px">
				<tr>
					<td class="text">用户名:</td>
					<td><input name="Username" type="text" class="textbox"></td>
				</tr>
				<tr>
					<td class="text">密 码：</td>
					<td><input name="Password" type="password" class="textbox"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="登 陆" class="btn-submit" id="submitBtn">
						<!--给按钮增添超链接-->
					</td>
				</tr>
			</table>
		</form>
</body>
</html>