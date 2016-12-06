<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    String id = (String)session.getAttribute("id");
	if(id==null||id.equals(""))
		response.sendRedirect("/CheckSystem/jsp/login.jsp");
	String name = (String)session.getAttribute("name");
	String job = (String)session.getAttribute("job");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>巡检系统-巡检人</title>
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
        <li><a href="/CheckSystem/jsp/staff_task.jsp"><i class="fa fa-user"></i> <span>巡检任务</span></a></li>
        <li><a href="/CheckSystem/jsp/staff_check_log.jsp"><i class="fa fa-archive"></i> <span>巡检记录</span></a></li>
        <li><a href="/CheckSystem/jsp/staff_repair.jsp"><i class="fa fa-building"></i> <span>设备报修</span></a></li>
    </section>
  </aside>

  <div class="content-wrapper">
    <section class="content">
		<div class="row">
	        <div class="col-xs-12">
	          <div class="box">
	            <div class="box-header ">
	              <h3 class="box-title">今日任务</h3>
	            </div>
				<div class="box-body">
					<table id="CheckTask" class="table table-bordered table-hover" data-page-length="1">
						<thead>
		                <tr>
		                  <th>编号</th>
		                  <th>设备编号</th>
		                  <th>设备名</th>
		                  <th>开始时间</th>
		                  <th>结束时间</th>
		                </tr>
		                </thead>
				  </table>
		     	</div>
		     </div>
			</div>
		</div>
	</section>
	</div>
</div>
<!-- modal -->
<div class="modal fade" id="CheckItem" tabindex="-1" role="dialog" aria-labelledby="groupAdd" aria-hidden="true">
	<div class="modal-dialog">
		<div class="box box-primary">
			<div class="box-header with-border">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="box-title" id="checkListTitle">检查项</h4>
			</div>
			<!-- 内容 -->
			<!-- 提交表单 -->
			<form role="form">
			<div class="box-body">
				<div class="form-group" id = "checkList">
				</div>
			</div>
			<div class="box-footer">
				<button type="button" class="btn pull-right btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" class="btn btn-info pull-right">提交</button>
			</div>
			</form>
		</div>
	</div>
</div>
<!-- REQUIRED JS SCRIPTS -->

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
$(document).ready(function(){
	var tableData = new Object();
	var tableListItem = new Array();
	var tableListItemCheckList = new Array();
$.ajax({
	 type:'POST',
	 url:'/CheckSystem/Task?Type=Get',
	 dataType:'json',
	 data:'{\"inspector_id\":'+'\"'+123123123+'\",'+'\"staff_passwd\":'+'\"'+1234+'\"}'
	 
}).done(function(data, status){
	 tableData = data; 
	 var num=1;
	 for(var i=0; i < data.planList.length; i++){
		 for(var j=0; j < data.planList[i].tasklist.length; j++){
			 var tempArray = new Array();
			 tempArray.push(num);
			 tempArray.push(data.planList[i].tasklist[j].cd_eq_id);
			 tempArray.push(data.planList[i].tasklist[j].eq_name);
			 tempArray.push(data.planList[i].task_start_time);
			 tempArray.push(data.planList[i].task_dead_time);
			 tableListItem.push(tempArray);
			 num++;
			 var checkList = data.planList[i].tasklist[j].checkList;
			 tableListItemCheckList.push(checkList);
		 }
	 }
	 var table = $('#CheckTask').DataTable( {
		    "paging": true,
			"lengthChange": false,
			"searching": false,
			"ordering": false,
			"info": false,
			"select": 'single',
			"autoWidth": false,
			"pagingType":   "full_numbers",
			language: {
		        "sProcessing": "处理中...",
		        "sLengthMenu": "显示 _MENU_ 项结果",
		        "sZeroRecords": "没有匹配结果",
		        "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
		        "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
		        "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
		        "sInfoPostFix": "",
		        "sSearch": "搜索:",
		        "sUrl": "",
		        "sEmptyTable": "表中数据为空",
		        "sLoadingRecords": "载入中...",
		        "sInfoThousands": ",",
		        "oPaginate": {
		            "sFirst": "首页",
		            "sPrevious": "上页",
		            "sNext": "下页",
		            "sLast": "末页"
		        },
		        "oAria": {
		            "sSortAscending": ": 以升序排列此列",
		            "sSortDescending": ": 以降序排列此列"
		        }
		    },
		    data: tableListItem
		} );
	 
	 $('#CheckTask tbody').on('click', 'tr', function () {
	        var data = table.row( this ).data();
	        //alert(tableListItemCheckList[data[0]-1][0].check_name);
	        $('#checkListTitle').text("设备编号: "+data[1]+" 设备名: "+data[2]);
	        $('#checkList').text("");
	        for(var i=0; i < tableListItemCheckList[data[0]-1].length; i++){
	        	
	        	var label = "<label >"+tableListItemCheckList[data[0]-1][i].check_name+"</label>";
	        	var input = "<input type=\"text\" class=\"form-control\">"
	        	
	        	$('#checkList').append(label);
	        	$('#checkList').append(input);
	        }
	        $('#CheckItem').modal('show')
	    });
	 
}).fail(function(data, status){
}).always(function(){
});
});
</script>
</body>
</html>
