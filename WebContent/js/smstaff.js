
var departmentList;
var staffTable

$(document).ready(function(){
	
	 staffTable = getStaffTable();
	 $('#staff_list tbody').on( 'click', 'tr', function () {
	        if ( $(this).hasClass('selected') ) {
	        }else {
	        	staffTable.$('tr.selected').removeClass('selected');
	            $(this).addClass('selected');
	        }
	      	        
	    } );
	 
	 $('#add-staff-button').click(function(){
		 getDepartmentList('#AddStaffDepartment');
		 $('#modalAddStaff').modal('show');
		 
	 });
	 
	 $('#delete-staff-button').click(function(){
		 var selectDeData =  staffTable.row('.selected').data();
		 if(selectDeData){
			 $.getJSON('/CheckSystem/Staff?type=deleteStaff', {
				   id:selectDeData[0]
				}).done(function (data) {
				    alert(data.info);
				    if(data.info=="删除成功"){
				    	 window.location.reload();
				    }
				});
		 }
		 else{
			 alert("没有选中");
		 }
	 });
	 
	 
	 $('#update-staff-button').click(function(){
		  getDepartmentList('#UpdateStaffDepartment');
		  var selectDeData =  staffTable.row('.selected').data();
		  var selectJob=document.getElementById('UpdateStaffJob');
		  var selectDepartment = document.getElementById('UpdateStaffDepartment');
		 if(selectDeData){
			$('#UpdateStaffId').val(selectDeData[0]);
			$('#UpdateStaffName').val(selectDeData[1]);
			$('#UpdateStaffPhone').val(selectDeData[3]);
			$('#UpdateStaffPwd').val(selectDeData[5]);
			
			for(var i=0;i<selectJob.options.length; i++){
				if(selectDeData[2]==selectJob.options[i].text){
					selectJob.selectedIndex=i;
					break;
				}
			}
			$('#modalUpdateStaff').modal('show'); 
		 }
		 else{
			alert("没有选中"); 
		 }
	 });
	 $('#sureUpdateStaff').click(function(){
		
		 var id=$('#UpdateStaffId').val();
		 var x=document.getElementById("UpdateStaffJob");
		 var name=$('#UpdateStaffName').val();
		 var power=$('#UpdateStaffJob').get(0).selectedIndex;
		 var department=departmentList[$('#UpdateStaffDepartment').get(0).selectedIndex][0];
		 var phone = $('#UpdateStaffPhone').val();
		 var pwd=$('#UpdateStaffPwd').val();
		 var job = x.options[power].text;
		 
		 $.getJSON('/CheckSystem/Staff?type=updateStaff', {
			   id:id,
			   name:name,
			   job:job,
			   department:department,
			   phone:phone,
			   pwd:pwd,
			   power:power
			}).done(function (data) {
			    alert(data.info);
			    if(data.info=="修改成功"){
			    	 $('#modalAddStaff').modal('hide');	
			    	 window.location.reload();
			    }
			});
		 
		 
	 });
	 
	 
	 
	 $('#sureAddStaff').click(function(){
		 var x=document.getElementById("AddStaffJob");
		 var id=$('#AddStaffId').val();
		 var name=$('#AddStaffName').val();
		 var power=$('#AddStaffJob').get(0).selectedIndex;
		 var department=departmentList[$('#AddStaffDepartment').get(0).selectedIndex][0];
		 var phone = $('#AddStaffPhone').val();
		 var pwd=$('#AddStaffPwd').val();
		 var job = x.options[power].text;
		 var jsonObj = new Object();
		 
		 jsonObj.id=id;
		 jsonObj.name=name;
		 jsonObj.job=job;
		 jsonObj.department = department;
		 jsonObj.phone = phone;
		 jsonObj.pwd = pwd;
		 jsonObj.power = power;
		 var json =JSON.stringify(jsonObj,null,2);
		 alert(json);
		 
		 $.getJSON('/CheckSystem/Staff?type=addStaff', {
			   id:id,
			   name:name,
			   job:job,
			   department:department,
			   phone:phone,
			   pwd:pwd,
			   power:power
			}).done(function (data) {
			    alert(data.info);
			    if(data.info=="添加成功"){
			    	 $('#modalAddStaff').modal('hide');	
			    	 window.location.reload();
			    }
			});
		 
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

function getDepartmentList(select){
    $.ajax({
   	 type:'POST',
		 url:'/CheckSystem/Department?Type=Get',
   }).done(function(data,status){
   	departmentList=JSON.parse(data);
   	$(select).empty();
   	for(var i=0;i<departmentList.length;i++){
   		var option = "<option>"+departmentList[i][1]+"</option>";
   		$(select).append(option);
   	}
   	
    var selectDeData =  staffTable.row('.selected').data();
    var selectDepartment = document.getElementById('UpdateStaffDepartment');
    if(selectDeData)
		for(var i=0;i<departmentList.length; i++){		
			if(selectDeData[4]==departmentList[i][1]){
				selectDepartment.selectedIndex=i;
				break;
			}
		}
   	
   }).fail(function(data,status){
   }).always(function(){
   });
	
}