<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>系统管理</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/dist/css/skins/skin-blue.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/datatables/dataTables.bootstrap.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/DataTables-1.10.12/extensions/Select/css/select.bootstrap.min.css"/>
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue">
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <!--<span class="logo-mini"><b>A</b>LT</span> -->
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>系统管理</b></span>
    </a>
	
    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
				<li>
                <div class="pull-right">
                  <a href="#" class="btn btn-danger btn-lg"><span>退出</span></a>
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
        <li >
        	<a href="#"><i class="fa fa-building"></i> <span>用户管理</span></a>
       		<ul class="treeview-menu">
				<li><a href="/CheckSystem/jsp/smStaff.jsp"><i class="fa fa-circle-o"></i>人员</a></li>
				<li><a href="/CheckSystem/jsp/smDepart.jsp"><i class="fa fa-circle-o"></i>部门</a></li> 
			</ul>
        	
        </li>
       
        <li class="active treeview">
        	<a href="#"><i class="fa fa-building"></i> <span>设备管理</span></a>
        	<ul class="treeview-menu">
					<li><a href="smEquipGroup.jsp"><i class="fa fa-circle-o"></i>设备组</a></li>
					<li><a href="smEquipList.jsp"><i class="fa fa-circle-o"></i>全部设备</a></li> 
			</ul>
        </li>
        <li>
        	<a href="/CheckSystem/jsp/smCheckitem.jsp"><i class="fa fa-building"></i> <span>巡检项目</span></a>
        </li>
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
              <h3 class="box-title">设备组信息</h3>
            </div>
			<div class="btn-group">
			<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#group"  id="btnAddGroup">增加</button>
			<button type="button" class="btn btn-warning" disabled="disabled" data-toggle="modal" data-target="#group"  id="btnChangeGroup">修改</button>
			<button type="button" class="btn btn-warning" disabled="disabled" id="btnDeleteGroup" data-toggle="modal" data-target="#deleteGroup">删除</button>
			</div>
			<div class="box-body">
				<table id="equipGroup" class="table table-bordered table-hover" data-page-length="10">
				<thead>
                <tr>
                  <th>组号</th>
                  <th>设备组名称</th>
                  <th>管理员工号</th>
                  <th>管理员姓名</th>
                </tr>
                </thead>
				<tfoot>
				<tr>
                  <th>组号</th>
                  <th>设备组名称</th>
                  <th>管理员工号</th>
                  <th>管理员姓名</th>
                </tr>
				</tfoot>
			</table>
	</div>
	</div>
	</div>
	</div>
    <!-- /.content -->
  <!-- content -->
      <!-- Your Page Content Here -->
   <div class="box">
            <div class="box-header ">
              <h3 class="box-title">设备表</h3>
            </div>
			<div class="btn-group">
			<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#list" id="btnAddEquip" disabled="disabled">增加</button>
			<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#list" disabled="disabled" id="btnChangeEquip">修改</button>
			<button type="button" class="btn btn-warning" disabled="disabled" id="btnDeleteEquip" data-toggle="modal" data-target="#deleteGroup">删除</button>
			</div>
			<div class="box-body">
				<table id="equipList" class="table table-bordered table-hover" data-page-length="10">
				<thead>
                <tr>
                  <th>设备编号</th>
                  <th>设备名称</th>
                  <th>类型编号</th>
                  <th>设备类型</th> 
                  <th>设备组编号</th>
                </tr>
                </thead>
				<tfoot>
				  <tr>
				  <th>设备编号</th>
                  <th>设备名称</th>
                  <th>类型编号</th>
                  <th>设备类型</th>
                  <th>设备组编号</th>
                  </tr>
				</tfoot>
			</table>
		</div>
	</div>
	</section>
	</div>
</div>
<!-- ./wrapper -->

<!-- 设备组modal -->
<div class="modal fade" id="group" tabindex="-1" role="dialog" aria-labelledby="group" aria-hidden="true" data-backdrop=false>
	<div class="modal-dialog">
		<div class="box box-primary">
			<div class="box-header with-border">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="box-title">增加设备组</h4>
			</div>
			<!-- 内容 -->
			<!-- 提交表单 -->
			<form role="form" id="groupForm">
			<div class="modal-body">
				<div class="form-group">
					<label for="groupName">设备组名称</label>
					<input type="text" class="form-control" placeholder="设备组名称" id="groupName">
					<label for="department">部门</label>
					<select class="form-control" id="department">
				    </select>
					<label for="groupManager">管理员</label>
					<select class="form-control" id="manager">
				    </select>
				</div>
			</div>
			<div class="box-footer">
				<button type="button" class="btn pull-right btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" id="group_submit" class="btn btn-info pull-right">提交</button>
			</div>
			</form>
		</div>
	</div>
</div>
<!-- 设备表List-->
<div class="modal fade" id="list" tabindex="-1" role="dialog" aria-labelledby="list" aria-hidden="true" data-backdrop=false>
	<div class="modal-dialog">
		<div class="box box-primary">
			<div class="box-header with-border">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="box-title" id="list">增加设备</h4>
			</div>
			<!-- 内容 -->
			<!-- 提交表单 -->
			<form role="form" id="listForm">
			<div class="modal-body">
				<div class="form-group">
					<label for="equip">设备名称</label>
					<input type="text" class="form-control" placeholder="设备名称" id="equipName">
					<label for="equipType">设备类型</label>
					<select class="form-control" id="equipType">
				    </select>
					<label for="equipGroup">设备所属组</label>
					<select class="form-control" id="groupSelect">
				    </select>
				    <input type="hidden" id="hidden">
				    <input type="hidden" id="hidEquip">
				</div>
			</div>
			<div class="box-footer">
				<button type="button" class="btn pull-right btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" id="equipSubmit" class="btn btn-info pull-right">提交</button>
			</div>
			</form>
		</div>
	</div>
</div>

<!-- 删除提示 -->
<div class="modal fade" id="deleteGroup" tabindex="-1" role="dialog" aria-labelledby="deleteGroup" aria-hidden="true" data-backdrop=false>
	<div class="modal-dialog">
		<div class="box box-Danger">
			<div class="box-header with-border">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<!-- 内容 -->
			<div class="modal-body">
				<dl>
					<dt>删除</dt>
					<dd><p class="text-yellow">123123</p></dd>
				</dl>
			</div>
			<div class="box-footer">
				<button type="button" class="btn pull-right btn-default" data-dismiss="modal">关闭</button>
				<button type="button" id="deleteGroupAck" class="btn btn-info pull-right">确认</button>
			</div>
		</div>
	</div>
</div>

 
<div class="modal fade" id="information" tabindex="-1" role="dialog" aria-labelledby="information" aria-hidden="true" data-backdrop=false>
	<div class="modal-dialog">
		<div class="box box-Danger">
			<!-- 内容 -->
			<div class="modal-body">
					<p class="text-red">123123</p>
			</div>
			<div class="box-footer">
				<button type="button" class="btn pull-right btn-default" data-dismiss="modal">关闭</button>
				<button type="button" data-dismiss="modal" class="btn btn-info pull-right">确认</button>
			</div>
		</div>
	</div>
</div>

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.2.3 -->
<script src="${pageContext.request.contextPath}/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath}/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/AdminLTE/dist/js/app.min.js"></script>

<script src="${pageContext.request.contextPath}/AdminLTE/plugins/DataTables-1.10.12/media/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/AdminLTE/plugins/DataTables-1.10.12/media/js/dataTables.bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/AdminLTE/plugins/DataTables-1.10.12/extensions/Select/js/dataTables.select.min.js"></script>

<script src="${pageContext.request.contextPath}/AdminLTE/dist/js/demo.js"></script>
<script>
var equipGroup;
var equipList;
	$(function (){
		equipGroup=$("#equipGroup").DataTable(
		{
			"paging": true,
			"lengthChange": false,
			"searching": false,
			"ordering": true,
			"info": false,
			"select": 'single',
			"autoWidth": false,
			"fixedColumns": {
				"leftColumns": 1,
				"rightColums": 2
			},
			"ajax": {
				"url":"/CheckSystem/equipGroup?type=getAll",
				"type":"GET"
			},
			"language":{
				"emptyTable":" 无数据",
				"loadingRecords":"加载中，请稍等~",
				"processing":"处理中~",
				"search":"搜索",
				"zeroRecords":"没有找到内容，请检查输入是否正确",
				"paginate":{
					"first":"第一页",
					"last":"最后一页",
					"next":"下一页",
					"previous":"上一页"
				},
				"aria":{
					"sortAscending":":升序排列 ",
					"sortDescending":":降序排列"
				}
			}
		
		}
		);
		equipList=$("#equipList").DataTable(
		{
				"paging":true,
				"lengthChange": false,
				"searching": true,
				"ordering": true,
				"info":false,
				"select": 'single',
				"autoWidth": false,
				"columnDefs":[{
					"targets":2,
					"visible":false
				}],
				"language":{
					"emptyTable":" 无数据",
					"loadingRecords":"加载中，请稍等~",
					"processing":"处理中~",
					"search":"搜索",
					"zeroRecords":"没有找到内容，请检查输入是否正确",
					"paginate":{
						"first":"第一页",
						"last":"最后一页",
						"next":"下一页",
						"previous":"上一页"
					},
					"aria":{
						"sortAscending":":升序排列 ",
						"sortDescending":":降序排列"
					}
				}
		}
		);
		equipGroup.on("dblclick","tbody tr",function(){
				equipGroup.row(this).select();
				var groupId=equipGroup.row(this).data();
				$("#hidden").val(groupId[0]);
				$("#btnAddEquip").attr("disabled",false);
				equipList.ajax.url("/CheckSystem/equipGroup?type=getList&groupId="+groupId[0]).load();
			});
		//翻页的时候取消选择
		equipGroup.on("page",function(){
			equipGroup.row(".selected").deselect();
		});
		//禁止使用修改和删除
		equipGroup.on("deselect",function(){
			$("#btnChangeGroup").attr("disabled",true);
			$("#btnDeleteGroup").attr("disabled",true);
		});
		//恢复修改和删除按钮
		equipGroup.on("select",function(){
			$("#btnChangeGroup").attr("disabled",false);
			$("#btnDeleteGroup").attr("disabled",false);
			var info=equipGroup.row(".selected").node();
			var groupId=$(info).children().eq(0).html();
			if($("#equipList tr").length==3&&$("#hidden").val()!=groupId){
				$("#btnAddEquip").attr("disabled",true);
			}else
				{
				$("#btnAddEquip").attr("disabled",false);
				}
		});
		//翻页取消选择
		equipList.on("page",function(){
			equipList.row(".selected").deselect();
		});
		//禁止使用修改和删除
		equipList.on("deselect",function(){
			$("#btnChangeEquip").attr("disabled",true);
			$("#btnDeleteEquip").attr("disabled",true);
		});
		//恢复修改和删除按钮
		equipList.on("select",function(){
			$("#btnChangeEquip").attr("disabled",false);
			$("#btnDeleteEquip").attr("disabled",false);
			var info=equipList.row(".selected").node();
			var equipId=$(info).children().eq(0).html();
			$("#hidEquip").val(equipId);
			
		});
		$("#department").change(function(){
				$("#manager").empty();
				var groupId=$("#department").val();
				$.getJSON("/CheckSystem/Staff?type=getStaff","id="+groupId,function(response){          //获取部门内人员的列表
					var opts=[];
					$.each(response,function(key,value){
						opts.push("<option value='"+value.id+"'>"+value.text+"</option>");
						});
					$("#manager").append(opts.join(""));
				});	
		});
		
		$("#btnAddGroup").click(function(){
				$("#groupName").val("");
				$("#department").empty();
				$("#manager").empty();
				group_Add();
				$("#groupForm").off("submit");
				$("#groupForm").submit(function()
				{
					$("#btnChangeGroup").attr("disabled",true);
					$("#btnDeleteGroup").attr("disabled",true);
					var data={};
					data['groupName']=$("#groupName").val();
					data['manager']=$("#manager").val();
					if(data['groupName']==undefined)
					{
						alert("设备组名称不能为空");
						return false;
					}
					if(data['manager']==undefined)
					{
						alert("设备管理员不能为空");
						return false;
					}
					$.ajax({
						url:"/CheckSystem/equipGroup?type=add",
						data:data,
						dataType:"text",
						success:function(data){
							$("#information p").html(data);
							$("#group").modal("hide");
							$("#information").modal("show");
							equipGroup.ajax.reload();
							}
					});
					return false;
				}
				);
		});
		$("#btnChangeGroup").click(function(){
				$("#groupName").val("");
				$("#department").empty();
				$("#manager").empty();
				group_Change();
				$("#groupForm").off("submit");
				$("#groupForm").submit(function(){
					$("#btnChangeGroup").attr("disabled",true);
					$("#btnDeleteGroup").attr("disabled",true);
					var data={};
					data['groupName']=$("#groupName").val();
					data['manager']=$("#manager").val();
					if(data['groupName']=="")
					{
						alert("设备组名称不能为空");
						return false;
					}
					if(data['manager']==undefined)
					{
						alert("设备管理员不能为空");
						return false;
					}
					var info=equipGroup.row(".selected").node();
					var groupId=$(info).children().eq(0).html();
					data['groupId']=groupId;
					$.ajax({
						url:"/CheckSystem/equipGroup?type=modify",
						data:data,
						dataType:"text",
						success:function(data){
							$("#information p").html(data);
							$("#group").modal("hide");
							$("#information").modal("show");
							equipGroup.ajax.reload();
							}
					});
					return false;
				});
		});
		$("#btnDeleteGroup").click(function(){
				var info=equipGroup.row(".selected").node();
				var str=$(info).children().eq(1).html()+"设备组?";
				$("#deleteGroup .text-yellow").html(str);
				$("#deleteGroupAck").off("click");
				$("#deleteGroupAck").click(function(){
					$("#btnChangeGroup").attr("disabled",true);
					$("#btnDeleteGroup").attr("disabled",true);
					var data={};
					data["type"]="delete";
					data["groupId"]=$(info).children().eq(0).html();
					$.ajax({
						url:"/CheckSystem/equipGroup",
						data:data,
						dataType:"text",
						success:function(data){							
						$("#information p").html(data);
						$("#deleteGroup").modal("hide");
						$("#information").modal("show");
						equipGroup.ajax.reload();}
					})
				});
		});
		$("#btnAddEquip").click(function(){
				$("#equipName").val("");
				$("#equipType").empty();
				$("#groupSelect").empty();
				equip_Add();
				$("#listForm").off("submit");
				$("#listForm").submit(function(){
					$("#btnChangeEquip").attr("disabled",true);
					$("#btnDeleteEquip").attr("disabled",true);
					var data={};
					data["equipName"]=$("#equipName").val();
					if(data["equipName"]=="")
					{
						alert("设备名不能为空");
						return false;
					}
					data["equipType"]=$("#equipType").val();
					if(data["equipType"]==undefined)
					{
						alert("设备类型不能为空");
						return false;
					}
					data["groupId"]=$("#groupSelect").val();
					if(data["groupId"]==undefined)
					{
						alert("设备组不能为空");
						return false;
					}
					$.ajax({
						url:"/CheckSystem/equip?type=addEquip",
						data:data,
						dataType:"text",
						success:function(da){
							$("#information p").html(da);
							$("#list").modal("hide");
							$("#information").modal("show");
							equipList.ajax.url("/CheckSystem/equipGroup?type=getList&groupId="+data["groupId"]).load();
							}
					});
					return false;
				});
		});
		$("#btnChangeEquip").click(function(){
			$("#equipName").val("");
			$("#equipType").empty();
			$("#groupSelect").empty()
			equipChange();
			$("#listForm").off("submit");
			$("#listForm").submit(function(){
				$("#btnChangeEquip").attr("disabled",true);
				$("#btnDeleteEquip").attr("disabled",true);
				var data={};
				data["equipName"]=$("#equipName").val();
				if(data["equipName"]=="")
				{
					alert("设备名不能为空");
					return false;
				}
				data["equipType"]=$("#equipType").val();
				if(data["equipType"]==undefined)
				{
					alert("设备类型不能为空");
					return false;
				}
				data["groupId"]=$("#groupSelect").val();
				if(data["groupId"]==undefined)
				{
					alert("设备组不能为空");
					return false;
				}
				data["equipId"]=$("#hidEquip").val();
				$.ajax({
					url:"/CheckSystem/equip?type=changeEquip",
					data:data,
					dataType:"text",
					success:function(da){
						$("#information p").html(da);
						$("#list").modal("hide");
						$("#information").modal("show");
						equipList.ajax.url("/CheckSystem/equipGroup?type=getList&groupId="+data["groupId"]).load();
						}
				});
				return false;
			});
		});
		$("#btnDeleteEquip").click(function(){
			var info=equipList.row(".selected").node();
			var str=$(info).children().eq(1).html()+"设备?";
			$("#deleteGroup .text-yellow").html(str);
			$("#deleteGroupAck").off("click");
			$("#deleteGroupAck").click(function(){
				$("#btnChangeEquip").attr("disabled",true);
				$("#btnDeleteEquip").attr("disabled",true);
				var data={};
				data["type"]="deleteEquip";
				data["equipId"]=$("#hidEquip").val();
				$.ajax({
					url:"/CheckSystem/equip",
					data:data,
					dataType:"text",
					success:function(da){
					$("#information p").html(da);
					$("#deleteGroup").modal("hide");
					$("#information").modal("show");equipList.ajax.url("/CheckSystem/equipGroup?type=getList&groupId="+$("#hidden").val()).load();}
				});
			});
		});
	});
	//弹出内容的初始化
	function equipChange(){
		$("#groupSelect").attr("disabled",false);
		$("#list h4").text("修改设备");
		var data=equipList.row(".selected").data();
		$("#equipName").val(data[1]);
		$.getJSON("/CheckSystem/equip","type=getType",function(resp){
			var opts=[];
			$.each(resp,function(key,value){
				opts.push("<option value='"+value.id+"'>"+value.text+"</option>");
			});
			$("#equipType").append(opts.join(""));
			$("#equipType option[value='"+data[2]+"']").attr("selected",true);
		});
		$.getJSON("/CheckSystem/equipGroup","type=getAll",function(resp){
			var opts=[];
			$.each(resp.data,function(key,value){
				opts.push("<option value='"+value[0]+"'>"+value[1]+"</option>");
			});
			$("#groupSelect").append(opts.join(""));
			$("#groupSelect option[value='"+data[4]+"']").attr("selected",true);
		});
	}
	function equip_Add(){
		$("#list h4").text("增加设备");
		$.getJSON("/CheckSystem/equip","type=getType",function(resp){
			var opts=[];
			$.each(resp,function(key,value){
				opts.push("<option value='"+value.id+"'>"+value.text+"</option>");
			});
			$("#equipType").append(opts.join(""));
		});
		$.getJSON("/CheckSystem/equipGroup","type=getAll",function(resp){
			var opts=[];
			$.each(resp.data,function(key,value){
				opts.push("<option value='"+value[0]+"'>"+value[1]+"</option>");
			});
			$("#groupSelect").append(opts.join(""));
			var man=$("#hidden").val();
			$("#groupSelect option[value='"+man+"']").attr("selected",true);
			$("#groupSelect").attr("disabled",true);
		});
	}
	function group_Add()
	{
		$("#group h4").text("增加设备组");
		$.getJSON("/CheckSystem/Staff?type=getDepartment",function(resp){                                  //获取部门列表
			var opts=[];
			$.each(resp,function(key,value){
				opts.push("<option value='"+value.id+"'>"+value.text+"</option>");
			});
			$("#department").append(opts.join("")); 
			$.getJSON("/CheckSystem/Staff?type=getStaff","id="+resp[0].id,function(response){          //获取部门内人员的列表
				var opts=[];
				$.each(response,function(key,value){
					opts.push("<option value='"+value.id+"'>"+value.text+"</option>");
					});
				$("#manager").append(opts.join(""));
			});			
		});
	}
	function group_Change()
	{
		var index=equipGroup.row(".selected").node();
		var depart=$(index).children().eq(0).html();
		var man=$(index).children().eq(2).html();
		var data={};
		data['id']=depart;
		$("#group h4").text("修改设备组");
		$("#groupName").val($(index).children().eq(1).html());
		$.ajax({
			url:"/CheckSystem/Staff?type=getDepartment",
			method:"GET",
			dataType:"json",
			success:function(resp){
				var opts=[];
				$.each(resp,function(key,value){
					opts.push("<option value='"+value.id+"'>"+value.text+"</option>");
				});
				$("#department").append(opts.join("")); 
				$("#department option[value='"+depart+"']").attr("selected",true);
			}
		});
		$.ajax({
			url:"/CheckSystem/Staff?type=getStaff",
			method:"GET",
			dataType:"json",
			data:data,
			success:function(resp){
				var opts=[];
				$.each(resp,function(key,value){
					opts.push("<option value='"+value.id+"'>"+value.text+"</option>");
				});
				$("#manager").append(opts.join("")); 
				$("#manager option[value='"+man+"']").attr("selected",true);
			}
		});
	}

</script>
</body>
</html>
