<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="servlet.*, java.sql.ResultSetMetaData,java.sql.SQLException,org.json.JSONArray,org.json.JSONObject" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<%
//获取部门列表
String departmentList = new String();
Unit unit = Unit.getUnit();
ResultSetMetaData meta;
String query= "select * from department";
try
{
	unit.rs = unit.st.executeQuery(query);
	meta = unit.rs.getMetaData();
	JSONObject departmentObject = new JSONObject();
	JSONArray departmentArray = new JSONArray();
	while(unit.rs.next())
	{
		JSONArray tempArray = new JSONArray();
		for(int i=1; i<3; i++)
		{
			tempArray.put(unit.rs.getString(i));
		}
		Unit getManager = Unit.getUnit();
		getManager.rs = getManager.st.executeQuery("select staff_name from staff where staff_id="+unit.rs.getString(3));
		if(getManager.rs.next())
			System.out.println(getManager.rs.getString(1));
		else
			System.out.println("没有结果");
		tempArray.put(getManager.rs.getString(1));
		getManager.close();
		departmentArray.put(tempArray);
	}
	//departmentObject.put("data", departmentArray);
	departmentList = departmentArray.toString();
	unit.close();
} 
catch (SQLException e)
{
	e.printStackTrace();
}


%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/select/css/select.bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/select/css/select.dataTables.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/select/css/select.foundation.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/select/css/select.semanticui.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/select/css/select.jqueryui.min.css">
  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/dist/css/skins/_all-skins.min.css">
 
<title>Insert title here</title>
</head>
<body>
		<div class="row">
	        <div class="col-xs-9">
	          <div class="box">
	            <div class="box-header ">
	              <h3 class="box-title">部门列表</h3>
	            </div>
	            <div class="btn-group">
					<button id="addDe" type="button" class="btn btn-warning">增加</button>
					<button id="updateDe" type="button" class="btn btn-warning">修改</button>
					<button id="deleteDe" type="button" class="btn btn-warning">删除</button>
				</div>
				<div class="box-body">
					<table id="department_list" class="table table-bordered table-hover" data-page-length="10">
				<thead>
                <tr>
                  <th>编号</th>
                  <th>部门</th>
                  <th>管理员</th>  
                </tr>
                </thead>
				<tbody>
                
				</tbody>
			</table>
				</div>	
			 </div>
		   </div>
		</div>

<!-- modal -->
<div class="modal fade" id="modalAddDe" tabindex="-1" role="dialog" aria-labelledby="groupAdd" aria-hidden="true">
	<div class="modal-dialog">
		<div class="box box-primary">
			<div class="box-header with-border">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="box-title" id="checkListTitle">添加部门</h4>
			</div>
			<!-- 内容 -->
			<!-- 提交表单 -->
			<form role="form" id="formAddDepartmet"  action="/CheckSystem/AddDepartment" method="post">
				<div class="box-body">
					<div class="form-group" id = "checkList">
						<label>部门编号</label>
						<input id="AddDeNum"  name="departmentId" type="text" class="form-control"/>
						<label>部门名称</label>
						<input id="AddDeName" name="departmentName" type="text" class="form-control"/>
						<input id="AddManagerId" name="managerId" type="hidden">
						<label>管理员</label>
						<select id="AddDeManager" class="form-control select2">
						</select>
					</div>
				</div>
				<div class="box-footer">
					<button type="button" class="btn pull-right btn-default" data-dismiss="modal">关闭</button>
					<button id="sureAddDe" type="button" class="btn btn-info pull-right"">提交</button>
				</div>
			</form>
		</div>
	</div>
</div>
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
<script src="${pageContext.request.contextPath}/AdminLTE/plugins/select/js/dataTables.select.js"></script>
<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/smuser.js"></script> -->
<script type="text/javascript">
departmentTable=$('#department_list').DataTable( {
    "paging": true,
	"lengthChange": false,
	"searching": false,
	"select":true,
	"ordering": false,
	"info": false,
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
    data:<%=departmentList%>
});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/smuser.js"></script>
</body>
</html>