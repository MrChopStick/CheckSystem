<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <% 
    String id = (String)session.getAttribute("id");
	if(id==null||id.equals(""))
		response.sendRedirect("/CheckSystem/jsp/login.jsp");
	String name = (String)session.getAttribute("name");
	String job = (String)session.getAttribute("job");
%>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>巡检系统-设备管理员</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/dist/css/skins/_all-skins.min.css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue">

<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <!--<span class="logo-mini"><b>A</b>LT</span> -->
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>巡检系统</b></span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
				<li>
                <div class="pull-right">
                  <a href="#" id="signout" class="btn btn-danger btn-lg"><span>退出</span></a>
                </div>
				</li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu">
        <li class="header">功能</li>
        <!-- Optionally, you can add icons to the links -->
         <li><a href="/CheckSystem/jsp/emEquipment.jsp"><i class="fa fa-building"></i> <span>设备列表</span></a></li>
        <li><a href="/CheckSystem/jsp/emPlan.jsp"><i class="fa fa-building"></i> <span>巡检计划</span></a></li>
        <li><a href="/CheckSystem/jsp/emRepair.jsp"><i class="fa fa-building"></i> <span>设备报修</span></a></li>
    </section>
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
		<div class="row">
	        <div class="col-xs-12">
	          <div class="box">
	            <div class="box-header ">
	              <h3 class="box-title">计划列表</h3>
	            </div>
	            <div class="btn-group">
					<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#groupAdd">增加</button>
					<button type="button" class="btn btn-warning">修改</button>
					<button type="button" class="btn btn-warning">删除</button>
				</div>
				<div class="box-body">
					<table id="EquipGroup" class="table table-bordered table-hover" data-page-length="10" data-order='[1,"asc"]'>
				<thead>
                <tr>
                  <th>设备ID</th>
                  <th>设备名称</th>
                  <th>设备状态</th>
                  <th>设备类型</th>  
                </tr>
                </thead>
				<tbody>
                <tr>
                  <td>Trident</td>
                  <td>Internet
                    Explorer 4.0
                  </td>
                  <td>Win 95+</td>
                  <td>X</td>
                </tr>
				<tr>
                  <td>Trident</td>
                  <td>Internet
                    Explorer 4.0
                  </td>
                  <td>Win 95+</td>
                  <td>X</td>
                </tr>
				<tr>
                  <td>Trident</td>
                  <td>Internet
                    Explorer 4.0
                  </td>
                  <td>Win 95+</td>
                  <td>X</td>
                </tr>
				<tr>
                  <td>Trident</td>
                  <td>Internet
                    Explorer 4.0
                  </td>
                  <td>Win 95+</td>
                  <td>X</td>
                </tr>
				<tr>
                  <td>Trident</td>
                  <td>Internet
                    Explorer 4.0
                  </td>
                  <td>Win 95+</td>
                  <td>X</td>
                </tr>
				</tbody>
			</table>
				</div>	
			 </div>
		   
		   	 <div class="box">
	            <div class="box-header ">
	              <h3 class="box-title">计划详情</h3>
	            </div>
	            <div class="btn-group">
					<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#groupAdd">增加</button>
					<button type="button" class="btn btn-warning">修改</button>
					<button type="button" class="btn btn-warning">删除</button>
				</div>
				<div class="box-body">
					<table id="EquipGroup" class="table table-bordered table-hover" data-page-length="10" data-order='[1,"asc"]'>
				<thead>
                <tr>
                  <th>设备ID</th>
                  <th>设备名称</th>
                  <th>设备状态</th>
                  <th>设备类型</th>  
                </tr>
                </thead>
				<tbody>
                <tr>
                  <td>Trident</td>
                  <td>Internet
                    Explorer 4.0
                  </td>
                  <td>Win 95+</td>
                  <td>X</td>
                </tr>
				<tr>
                  <td>Trident</td>
                  <td>Internet
                    Explorer 4.0
                  </td>
                  <td>Win 95+</td>
                  <td>X</td>
                </tr>
				<tr>
                  <td>Trident</td>
                  <td>Internet
                    Explorer 4.0
                  </td>
                  <td>Win 95+</td>
                  <td>X</td>
                </tr>
				<tr>
                  <td>Trident</td>
                  <td>Internet
                    Explorer 4.0
                  </td>
                  <td>Win 95+</td>
                  <td>X</td>
                </tr>
				<tr>
                  <td>Trident</td>
                  <td>Internet
                    Explorer 4.0
                  </td>
                  <td>Win 95+</td>
                  <td>X</td>
                </tr>
				</tbody>
			</table>
				</div>	
			 </div>

		   </div>
		</div>
	</section>
	</div>
</div>
<!-- ./wrapper -->


<!-- jQuery 2.2.3 -->
<script src="${pageContext.request.contextPath}/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath}/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="${pageContext.request.contextPath}/AdminLTE/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/AdminLTE/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${pageContext.request.contextPath}/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/AdminLTE/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/AdminLTE/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/AdminLTE/dist/js/demo.js"></script>
<!-- page script -->

<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance sthe
     user experience. Slimscroll is required when using the
     fixed layout. -->
<script>
	$('#submit').click(function(){
		var EqName = $('#EqName').val();
		var EqNum = $('#EqNum').val();
		var EqInfo = $('#info').val();
		var id=<%=id%>;
		var jsonObject = new Object();
		jsonObject.repair_eqid=EqNum;
		jsonObject.repair_detail=EqInfo;
		jsonObject.report_time =getNowFormatDate();
		jsonObject.repair_inspector_id=id.toString();
		alert(id);
		alert(jsonObject.repair_inspector_id);
		var json=JSON.stringify(jsonObject,null,2);
		alert(JSON.stringify(jsonObject,null,2));
		$.ajax({
			type:'POST',
			url:'/CheckSystem/Repair?Type=Insert&json='+json
			
		}).done(function(data, status){
			if(data=="OK")
				alert("报修成功");
			else
				alert("报修失败");
		}).fail(function(data, status){
			alert("报修失败"+status);
		}).always(function(){
			alert("报修");
		});
		
		
		
		function getNowFormatDate() {
		    var date = new Date();
		    var seperator1 = "-";
		    var seperator2 = ":";
		    var month = date.getMonth() + 1;
		    var strDate = date.getDate();
		    if (month >= 1 && month <= 9) {
		        month = "0" + month;
		    }
		    if (strDate >= 0 && strDate <= 9) {
		        strDate = "0" + strDate;
		    }
		    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
		            + " " + date.getHours() + seperator2 + date.getMinutes()
		            + seperator2 + date.getSeconds();
		    return currentdate;
		}
		
		
	});
</script>
</body>
</html>
