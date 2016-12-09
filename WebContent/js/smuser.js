//全局变量
var managerList;
var departmentList = new Object();
var departmentTable ;
var staffTable;
$(document).ready(function(){
	
	getDepartmentList();
	staffTable = getStaffTable();
	//选中点击项
    $('#department_list tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            //$(this).removeClass('selected');
        }else {
        	departmentTable.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
        var selectDeData =  departmentTable.row('.selected').data();
        //alert(selectDeData[0]);
        staffTable.ajax.url('/CheckSystem/Department?Type=GetStaffList&departmentId='+selectDeData[0]).load();
        /*
        $.ajax({
       	 type:'POST',
   		 url:'/CheckSystem/Department?Type=Get',
   		 async:false
       }).done(function(data,status){
       	//alert(data);
       	departmentList=JSON.parse(data);
       	departmentTable = getDepartmentTable();
       }).fail(function(data,status){
       	//alert(data);
       }).always(function(){
       	//alert("获取部门列表");
       });*/
        
        
    } );
    
    $('#staff_list tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            //$(this).removeClass('selected');
        }else {
        	staffTable.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
        var selectDeData =  departmentTable.row('.selected').data();
        //alert(selectDeData[0]);
        //staffTable.ajax.url('/CheckSystem/Department?Type=GetStaffList&departmentId='+selectDeData[0]).load();
        /*
        $.ajax({
       	 type:'POST',
   		 url:'/CheckSystem/Department?Type=Get',
   		 async:false
       }).done(function(data,status){
       	//alert(data);
       	departmentList=JSON.parse(data);
       	departmentTable = getDepartmentTable();
       }).fail(function(data,status){
       	//alert(data);
       }).always(function(){
       	//alert("获取部门列表");
       });*/
        
        
    } );
    
    //添加部门对话框
    $('#addDe').click(function(){
    	getDepartmentManagerList('#AddDeManager');
    	$('#modalAddDe').modal("show");
    });
    //修改部门对话框
    $('#updateDe').click(function(){
    	getDepartmentManagerList('#UpdateDeManager');
        var selectDeData =  departmentTable.row('.selected').data();
        if(selectDeData){
        	alert(selectDeData[0]);
        	$('#UpdateDeNum').val(selectDeData[0]);
        	$('#UpdateDeName').val(selectDeData[1]);
        	$('#UpdateDeManager').val(selectDeData[2]);
        	$('#modalUpdateDe').modal("show");
        }
        else{
        	alert("没有选中");
        }
    	
    });
    /*
    $('#sureAddDe').click(function(){
    	
    	//$('#AddManagerId').val(managerList[$('#AddDeManager').get(0).selectedIndex][0]);
    	$('#AddManagerId').val(2016003);
    	var deNum = $('#AddDeNum').val();
    	var deName = $('#AddDeName').val();
    	//var deManager =managerList[$('#AddDeManager').get(0).selectedIndex][0] ;
    	alert("添加部门"+deNum+deName+$('#AddManagerId').val());
    	$('#formAddDepartmet').submit();
    });
    */
    //确定添加部门逻辑
    
    $('#sureAddDe').click(function(){
    	var deNum = $('#AddDeNum').val();
    	var deName = $('#AddDeName').val();
    	var deManager =managerList[$('#AddDeManager').get(0).selectedIndex][0] ;
    	var jsonObj = new Object();
    	jsonObj.departmentId=deNum;
    	jsonObj.departmentName=deName;
    	jsonObj.managerId=deManager;
    	//alert(jsonObj.toString());
    	//alert(JSON.stringify(jsonObj,null,2));
    	var json=JSON.stringify(jsonObj,null,2);
    	$.ajax({
    		 type:"post",
    		 url:'/CheckSystem/Department?Type=Insert&json='+json,
    		// async:false
    	}).done(function(data,status){
    		//alert("添加成功"+data);
    	}).fail(function(data,status){
    		//alert("添加失败"+status+data);
    	}).always(function(){
    		//alert("添加部门");
    	});
    });
    $('#sureUpdateDe').click(function(){
    	alert("修改部门");
    	var deNum = $('#UpdateDeNum').val();
    	var deName = $('#UpdateDeName').val();
    	var deManager =managerList[$('#UpdateDeManager').get(0).selectedIndex][0] ;
    	var jsonObj = new Object();
    	jsonObj.departmentId=deNum;
    	jsonObj.departmentName=deName;
    	jsonObj.managerId=deManager;
    	var json=JSON.stringify(jsonObj,null,2);
    	alert(json);
    	$.ajax({
    		 type:"post",
    		 url:'/CheckSystem/Department?Type=Update&json='+json
    	}).done(function(data,status){
    		alert("修改成功"+data);
    	}).fail(function(data,status){
    		alert("修改失败"+status+data);
    	}).always(function(){
    		alert("修改部门");
    	});
    	alert("修改部门完成");
    });
    
    
    
	//departmentTable.ajax.reload();
    //给行绑定选中事件
    /*
    var selectDeData =  departmentTable.row('.selected').data();
    if(selectDeData){
    	
    	alert(selectDeData[0]);
    }
    else
    	alert("没有选中部门");
    $('#department_list tbody').on( 'click', 'tr', function () {
       if ($(this).hasClass('selected')) {
           $(this).removeClass('selected');
       }
       else {
           table.$('tr.selected').removeClass('selected');
           $(this).addClass('selected');
       }
   } );
 */       
 });
//初始化部门列表
function getDepartmentTable(){
	return $('#department_list').DataTable( {
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
	    data:departmentList

	});
}


function getDepartmentList(){
    $.ajax({
    	 type:'POST',
		 url:'/CheckSystem/Department?Type=Get',
		// async:false
    }).done(function(data,status){
    	//alert(data);
    	departmentList=JSON.parse(data);
    	departmentTable = getDepartmentTable();
    }).fail(function(data,status){
    	//alert(data);
    }).always(function(){
    	//alert("获取部门列表");
    });
	
}

function getDepartmentManagerList(managerListOption){
	$.ajax({
		 type:'POST',
		 url:'/CheckSystem/Department?Type=GetManagerList',
		// async:false
	}).done(function(data,status){
		//alert(data+"获取部门成功");
		managerList=JSON.parse(data);
		$(managerListOption).empty();
		for(var i=0; i<managerList.length; i++){
			var option = "<option>"+managerList[i][1]+"  ID"+managerList[i][0]+"</option>";
			$(managerListOption).append(option);
		}
	}).fail(function(data,status){
		//alert(status);
	}).always(function(){
		//alert("获取部门管理员");
	});
}
function getStaffTable(){
	return $('#staff_list').DataTable( {
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
	  "ajax": {
      	  "url":'/CheckSystem/Department?Type=GetStaffList&departmentId=-1',
          "type": "POST"
        }
	});
}











