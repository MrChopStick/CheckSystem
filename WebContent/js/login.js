// JavaScript Document
    function checkdata()
    {
		 var username=Loginform.Username.value;//获取用户名
		 var password=Loginform.Password.value;//获取密码
		 
		 var bFlag=true;//
		 
		 if(username==""){
			 alert("请输入姓名！");
			 bFlag=false;
		 }
		 else if(password==""){
			 alert("请输入密码！");
			 bFlag=false;
		 }
		 else if(username=="root"&&password=="123"){
			 window.open('EquiManag.html');
		 }
		 else if(username=="root"&&password=="456"){
			 window.open('DeptManag.html');
		 }
		 else if(username=="root"&&password=="789"){
			 window.open('SysManag.html');
		 }
		 return bFlag;
    }
    
    $(document).ready(function(){
    	$("#submitBtn").css("background-color","#B2E0FF");
    	$("#submitBtn").click(function(){
    		var jqxhr = $.ajax('http://localhost:8080/CheckSystem/TestLogin?key="val"', {
    		    dataType: 'text'
    		}).done(function (data) {
    			if(data=="1")
    				{
    			
    					window.location.href="/CheckSystem/EquiGroup2.html";
    				}
    				
    			else
    				alert("密码错误");
    		}).fail(function (xhr, status) {
    		    alert("失败"+status);
    		}).always(function () {
    		});
        });
    	 
    });
    
    
    
    
    
    
    
    
    
    
    
    
    
    