<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="servlet.*, java.sql.ResultSetMetaData,java.sql.SQLException,org.json.JSONArray,org.json.JSONObject" %>
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
 <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/DataTables-1.10.12/media/css/dataTables.bootstrap.css"/>
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
        <li>
        	<a href="smStaff.jsp"><i class="fa fa-building"></i> <span>用户管理</span></a>
       		<ul class="treeview-menu">
				<li><a href="/CheckSystem/jsp/smStaff.jsp"><i class="fa fa-circle-o"></i>人员</a></li>
				<li><a href="/CheckSystem/jsp/smDepart.jsp"><i class="fa fa-circle-o"></i>部门</a></li> 
			</ul>
        	
        </li>
       
        <li>
        	<a href="smEquipGroup.jsp"><i class="fa fa-building"></i> <span>设备管理</span></a>
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
              <h3 class="box-title">设备类型</h3>
            </div>
			<div class="btn-group">
			<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#type"  id="btnAddType">增加</button>
			<button type="button" class="btn btn-warning" disabled="disabled" data-toggle="modal" data-target="#type"  id="btnChangeType">修改</button>
			<button type="button" class="btn btn-warning" disabled="disabled" id="btnDeleteType" data-toggle="modal" data-target="#delete">删除</button>
			</div>
			<div class="box-body">
				<table id="typeList" class="table table-bordered table-hover" data-page-length="10">
				<thead>
                <tr>
                  <th>类型编号</th>
                  <th>类型名称</th>
                </tr>
                </thead>
				<tfoot>
				<tr>
                  <th>类型组号</th>
                  <th>类型名称</th>
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
              <h3 class="box-title">巡检项目列表</h3>
            </div>
			<div class="btn-group">
			<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#list" id="btnAddCheck" disabled="disabled">增加</button>
			<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#list" disabled="disabled" id="btnChangeCheck">修改</button>
			<button type="button" class="btn btn-warning" disabled="disabled" id="btnDeleteCheck" data-toggle="modal" data-target="#delete">删除</button>
			</div>
			<div class="box-body">
				<table id="checkList" class="table table-bordered table-hover" data-page-length="10">
				<thead>
                <tr>
                  <th>巡检项编号</th>
                  <th>巡检项名称</th>
                  <th>巡检项描述</th>
                  <th>巡检项数据类型编号</th>
                  <th>巡检项数据类型</th> 
                </tr>
                </thead>
				<tfoot>
				  <tr>
				  <th>巡检项编号</th>
                  <th>巡检项名称</th>
                  <th>巡检项描述</th>
                  <th>巡检项数据类型编号</th>
                  <th>巡检项数据类型</th> 
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
<div class="modal fade" id="type" tabindex="-1" role="dialog" aria-labelledby="type" aria-equipType="true" data-backdrop=false>
	<div class="modal-dialog">
		<div class="box box-primary">
			<div class="box-header with-border">
				<button type="button" class="close" data-dismiss="modal" aria-equipType="true">&times;</button>
				<h4 class="box-title">增加设备类型</h4>
			</div>
			<!-- 内容 -->
			<!-- 提交表单 -->
			<form role="form" id="typeForm">
			<div class="modal-body">
				<div class="form-group">
					<label for="typeName">设备类型名称</label>
					<input type="text" class="form-control" placeholder="设备类型名称" id="typeName">
				</div>
			</div>
			<div class="box-footer">
				<button type="button" class="btn pull-right btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" id="typeSubmit" class="btn btn-info pull-right">提交</button>
			</div>
			</form>
		</div>
	</div>
</div>

<!-- 设备表List-->
<div class="modal fade" id="list" tabindex="-1" role="dialog" aria-labelledby="list" aria-equipType="true" data-backdrop=false>
	<div class="modal-dialog">
		<div class="box box-primary">
			<div class="box-header with-border">
				<button type="button" class="close" data-dismiss="modal" aria-equipType="true">&times;</button>
				<h4 class="box-title" id="list">增加巡检项</h4>
			</div>
			<!-- 内容 -->
			<!-- 提交表单 -->
			<form role="form" id="checkForm">
			<div class="modal-body">
				<div class="form-group">
					<input type="hidden" id="checkId">
					<label for="equipTypeName">设备类型</label>
					<input type="text" id="equipTypeName" class="form-control" disabled="disabled">
					<label for="equip">巡检项名称</label>
					<input type="text" class="form-control" placeholder="巡检项名称" id="checkName">
					<input type="hidden" id="equipType">
					<label for="checkDescription">巡检项描述</label>
					<input type="text" class="form-control" placeholder="巡检项目描述,可为空" id="checkDescription">
					<label for="dataType">巡检项数据类型</label>
					<select class="form-control" id="dataType">
					<option value="1">手动输入</option>
					<option value="2">勾选</option>
					</select>
				</div>
			</div>
			<div class="box-footer">
				<button type="button" class="btn pull-right btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" id="checkSubmit" class="btn btn-info pull-right">提交</button>
			</div>
			</form>
		</div>
	</div>
</div>

<!-- 删除提示 -->
<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="delete" aria-equipType="true" data-backdrop=false>
	<div class="modal-dialog">
		<div class="box box-Danger">
			<div class="box-header with-border">
				<button type="button" class="close" data-dismiss="modal" aria-equipType="true">&times;</button>
			</div>
			<!-- 内容 -->
			<div class="modal-body">
				<dl>
					<dt>删除</dt>
					<dd><p class="text-yellow">padding</p></dd>
				</dl>
			</div>
			<div class="box-footer">
				<button type="button" class="btn pull-right btn-default" data-dismiss="modal">关闭</button>
				<button type="button" id="deleteAck" class="btn btn-info pull-right">确认</button>
			</div>
		</div>
	</div>
</div>

 
<div class="modal fade" id="information" tabindex="-1" role="dialog" aria-labelledby="information" aria-equipType="true" data-backdrop=false>
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
<script src="dist/js/app.min.js"></script>

<script src="${pageContext.request.contextPath}/AdminLTE/plugins/DataTables-1.10.12/media/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/AdminLTE/plugins/DataTables-1.10.12/media/js/dataTables.bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/AdminLTE/plugins/DataTables-1.10.12/extensions/Select/js/dataTables.select.min.js"></script>  

<script src="dist/js/demo.js"></script>
<script>
var typeList;
var checkList;
	$(function (){
		typeList=$("#typeList").DataTable(
		{
			"paging": true,
			"lengthChange": false,
			"searching": false,
			"ordering": true,
			"info": false,
			"select": 'single',
			"autoWidth": false,
			"ajax": {
				"url":"/CheckSystem/equip?type=getEquipType",
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
		checkList=$("#checkList").DataTable(
		{
				"paging":true,
				"lengthChange": false,
				"searching": true,
				"ordering": true,
				"info":false,
				"select": 'single',
				"autoWidth": false,
				"columnDefs":[{
					"targets":3,
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
		typeList.on("dblclick","tbody tr",function(){
				typeList.row(this).select();
				var typeId=typeList.row(this).data();
				$("#equipType").val(typeId[0]);
				$("#equipTypeName").val(typeId[1]);
				$("#btnAddCheck").attr("disabled",false);
				checkList.ajax.url("/CheckSystem/equip?type=getCheckList&typeId="+typeId[0]).load();
			});
		//翻页的时候取消选择
		typeList.on("page",function(){
			typeList.row(".selected").deselect();
			$("#btnChangeType").attr("disabled",true);
			$("#btnDeleteType").attr("disabled",true);
		});
		//禁止使用修改和删除
		typeList.on("deselect",function(){
			$("#btnChangeType").attr("disabled",true);
			$("#btnDeleteType").attr("disabled",true);
		});
		//恢复修改和删除按钮
		typeList.on("select",function(){
			$("#btnChangeType").attr("disabled",false);
			$("#btnDeleteType").attr("disabled",false);
			var info=typeList.row(".selected").data();
			var typeId=info[0];
			if($("#checkList tr").length==3&&$("#equipType").val()!=typeId){
				$("#btnAddCheck").attr("disabled",true);
			}else
				{
				$("#btnAddCheck").attr("disabled",false);
				}
		});
		//翻页取消选择
		checkList.on("page",function(){
			checkList.row(".selected").deselect();
		});
		//禁止使用修改和删除
		checkList.on("deselect",function(){
			$("#btnChangeCheck").attr("disabled",true);
			$("#btnDeleteCheck").attr("disabled",true);
		});
		//恢复修改和删除按钮
		checkList.on("select",function(){
			$("#btnChangeCheck").attr("disabled",false);
			$("#btnDeleteCheck").attr("disabled",false);
			var info=checkList.row(".selected").data();
			var checkId=info[0];
			$("#checkId").val(checkId);
			
		});
		$("#btnAddType").click(function(){
			$("#typeName").val("");
			$("#typeForm").off("submit");
			$("#typeForm").submit(function(){
				$("#btnChangeType").attr("disabled",true);
				$("#btnDeleteType").attr("disabled",true);
				var data={};
				data["type"]="addEquipType";
				data["typeName"]=$("#typeName").val();
				if(data["typeName"]=="")
				{
					alert("请输入设备名称!");
					return false;
				}
				$.ajax({
					url:"/CheckSystem/equip",
					data:data,
					dataType:"text",
					contentType:"application/x-www-form-urlencoded; charset=UTF-8",
					success:function(da){
						$("#information p").html(da);
						$("#type").modal("hide");
						$("#information").modal("show");
						typeList.ajax.reload();
					}
				});
				return false;
			});
		});
		$("#btnChangeType").click(function(){
			var info=typeList.row(".selected").data();
			$("#typeName").val(info[1]);
			$("#typeForm").off("submit");
			$("#typeForm").submit(function(){
				$("#btnChangeType").attr("disabled",true);
				$("#btnDeleteType").attr("disabled",true);
				var data={};
				data["type"]="changeEquipType";
				data["typeName"]=$("#typeName").val();
				alert(data["typeName"]);
				data["typeId"]=info[0];
				if(data["typeName"]=="")
				{
					alert("请输入设备名称!");
					return false;
				}
				$.ajax({
					url:"/CheckSystem/equip",
					data:data,
					dataType:"text",
					contentType:"application/x-www-form-urlencoded; charset=UTF-8",
					success:function(da){
						$("#information p").html(da);
						$("#type").modal("hide");
						$("#information").modal("show");
						typeList.ajax.reload();
					}
				});
				return false;
			});
			
		});
		$("#btnDeleteType").click(function(){
				var info=typeList.row(".selected").data();
				var str=info[1]+"设备组?";
				$("#delete .text-yellow").html(str);
				$("#deleteAck").off("click");
				$("#deleteAck").click(function(){
					$("#btnChangeType").attr("disabled",true);
					$("#btnDeleteType").attr("disabled",true);
					var data={};
					data["type"]="deleteEquipType";
					data["typeId"]=info[0];
					$.ajax({
						url:"/CheckSystem/equip",
						data:data,
						dataType:"text",
						contentType:"application/x-www-form-urlencoded; charset=UTF-8",
						success:function(da){							
						$("#information p").html(da);
						$("#delete").modal("hide");
						$("#information").modal("show");
						typeList.ajax.reload();}
					})
				});
		});
		$("#btnAddCheck").click(function(){
				$("#checkName").val("");
				$("#checkDescription").val("");
				$("#list h4").text("增加设备");
				$("#checkForm").off("submit");
				$("#checkForm").submit(function(){
					$("#btnChangeCheck").attr("disabled",true);
					$("#btnDeleteCheck").attr("disabled",true);
					var data={};
					data["checkName"]=$("#checkName").val();
					if(data["checkName"]=="")
					{
						alert("巡检项目不能为空");
						return false;
					}
					data["typeId"]=$("#equipType").val();
					if(data["typeId"]=="")
					{
						alert("设备类型不能为空");
						return false;
					}
					data["checkDescription"]=$("#checkDescription").val();
					if(data["checkDescription"]=="")
					{
						data["checkDescription"]="无";
					}
					data["dataType"]=$("#dataType").val();
					if(data["dataType"]==undefined)
					{
						alert("请选择数据类型");
						return false;
					}
					$.ajax({
						url:"/CheckSystem/equip?type=addCheck",
						data:data,
						dataType:"text",
						success:function(da){
							$("#information p").html(da);
							$("#list").modal("hide");
							$("#information").modal("show");
							checkList.ajax.url("/CheckSystem/equip?type=getCheckList&typeId="+data["typeId"]).load();
							}
					});
					return false;
				});
		});
		$("#btnChangeCheck").click(function(){
			$("#checkName").val("");
			$("#checkDescription").val("");
			checkChange();
			$("#checkForm").off("submit");
			$("#checkForm").submit(function(){
				$("#btnChangeCheck").attr("disabled",true);
				$("#btnDeleteCheck").attr("disabled",true);
				var data={};
				data["checkName"]=$("#checkName").val();
				if(data["checkName"]=="")
				{
					alert("巡检项名称不能为空");
					return false;
				}
				data["typeId"]=$("#equipType").val();
				if(data["typeId"]=="")
				{
					alert("设备类型不能为空");
					return false;
				}
				data["checkDescription"]=$("#checkDescription").val();
				if(data["checkDescription"]=="")
				{
					data["checkDescription"]="无";
				}
				data["checkId"]=$("#checkId").val();
				data["dataType"]=$("#dataType").val();
				if(data["dataType"]==undefined)
				{
					alert("请选择数据类型");
					return false;
				}
				$.ajax({
					url:"/CheckSystem/equip?type=changeCheck",
					data:data,
					dataType:"text",
					success:function(da){
						$("#information p").html(da);
						$("#list").modal("hide");
						$("#information").modal("show");
						checkList.ajax.url("/CheckSystem/equip?type=getCheckList&typeId="+data["typeId"]).load();
						}
				});
				return false;
			});
		});
		$("#btnDeleteCheck").click(function(){
			var info=checkList.row(".selected").data();
			var str=info[1]+"巡检项?";
			$("#delete .text-yellow").html(str);
			$("#deleteAck").off("click");
			$("#deleteAck").click(function(){
				$("#btnChangeCheck").attr("disabled",true);
				$("#btnDeleteCheck").attr("disabled",true);
				var data={};
				data["type"]="deleteCheck";
				data["checkId"]=$("#checkId").val();
				$.ajax({
					url:"/CheckSystem/equip",
					data:data,
					dataType:"text",
					success:function(da){
					$("#information p").html(da);
					$("#delete").modal("hide");
					$("#information").modal("show");checkList.ajax.url("/CheckSystem/equip?type=getCheckList&typeId="+$("#equipType").val()).load();}
				});
			});
		});
	});
	//弹出内容的初始化
	function checkChange(){
		$("#list h4").text("修改设备");
		var data=checkList.row(".selected").data();
		$("#checkName").val(data[1]);
		$("#checkDescription").val(data[2]);
		$("#dataType option[value='"+data[3]+"']").attr("selected",true);
	}
	function group_Add()
	{
		$("#group h4").text("增加设备");
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
		var index=typeList.row(".selected").node();
		var depart=$(index).children().eq(0).html();
		var man=$(index).children().eq(2).html();
		var data={};
		data['id']=depart;
		$("#group h4").text("修改设备");
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
