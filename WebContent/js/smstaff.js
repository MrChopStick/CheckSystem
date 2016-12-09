
var departmentList;


$(document).ready(function(){
	
	var staffTable = getStaffTable();
	 $('#staff_list tbody').on( 'click', 'tr', function () {
	        if ( $(this).hasClass('selected') ) {
	        }else {
	        	staffTable.$('tr.selected').removeClass('selected');
	            $(this).addClass('selected');
	        }
	        var selectDeData =  departmentTable.row('.selected').data();	        
	    } );
	 
	 $('#add-staff-button').click(function(){
		 getDepartmentList();
		 $('#modalAddStaff').modal('show');
		 
	 });
	 $('#sureAddStaff').click(function(){
		 var id=$('#AddStaffId').val();
		 var name=$('#AddStaffName').val();
		 var job=$('#AddStaffJob').get(0).selectedIndex;
		 var department=departmentList[$('#AddStaffDepartment').get(0).selectedIndex][0];
		 var phone = $('#AddStaffPhone').val();
		 var pwd=$('#AddStaffPwd').val();
		 var power=$('#AddStaffDepartment').options[$('#AddStaffDepartment').get(0).selectedIndex].text
	 });
	
});
function getStaffTable(){
	return $('#staff_list').DataTable( {
	    "paging": true,
		"lengthChange": false,
		"searching": true,
		"select":true,
		"ordering": true,
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
	  "ajax": {
      	  "url":'/CheckSystem/Department?Type=GetStaffList&departmentId=all',
          "type": "POST"
        }
	});
}

function getDepartmentList(){
    $.ajax({
   	 type:'POST',
		 url:'/CheckSystem/Department?Type=Get',
   }).done(function(data,status){
   	//alert(data);
   	departmentList=JSON.parse(data);
   	$('#AddStaffDepartment').empty();
   	for(var i=0;i<departmentList.length;i++){
   		var option = "<option>"+departmentList[i][1]+"</option>";
   		$('#AddStaffDepartment').append(option);
   	}
   }).fail(function(data,status){
   	//alert(data);
   }).always(function(){
   	//alert("获取部门列表");
   });
	
}