
$(document).ready(function(){
			$("#login-form-submit").click(function(){
				var username=document.getElementById("username").value;//获取用户名
				 var password=document.getElementById("password").value;//获取密码
				 var form=document.getElementById("login-form");

				 var bFlag=true;//
				 
				 if(username==""&&password==""){
					 window.alert("请输入用户名和密码！");
					 bFlag=false;
				 }
				 else if(username==""){
					 window.alert("请输入用户名！");
					 bFlag=false;
				 }
				 else if(password==""){
					 window.alert("请输入密码！");
					 bFlag=false;
				 }
				 else{
					 //form.submit();
					 var dataT='{\"staff_id\":'+'\"'+username+'\",'+'\"staff_passwd\":'+'\"'+password+'\"}';
					 window.alert(dataT);
					 $.ajax({
						 type:'POST',
						 url:'http://localhost:8080/CheckSystem/Login',
						 dataType:'json',
						 data:'{\"staff_id\":'+'\"'+username+'\",'+'\"staff_passwd\":'+'\"'+password+'\"}'
						 
					 }).done(function(data, status){
						 window.alert("done"+data.staff_name);
						 $('#name').val(data.staff_name);
						 $('#phone').val(data.staff_phone);
						 $('#job').val(data.staff_job);
						 $('#power').val(data.staff_power);
						 
						 form.submit();
					 }).fail(function(data, status){
						 window.alert("fail");
					 }).always(function(){
						 window.alert("hello");
					 });
				}
			});
});
    
function Submit() {
	 var username=document.getElementById("username").value;//获取用户名
	 var password=document.getElementById("password").value;//获取密码
	 var form=document.getElementById("login-form");

	 var bFlag=true;//
	 
	 if(username==""&&password==""){
		 window.alert("请输入用户名和密码！");
		 bFlag=false;
	 }
	 else if(username==""){
		 window.alert("请输入用户名！");
		 bFlag=false;
	 }
	 else if(password==""){
		 window.alert("请输入密码！");
		 bFlag=false;
	 }
	 else{
		 //form.submit();
		 var dataT='{\"staff_id\":'+'\"'+username+'\",'+'\"staff_passwd\":'+'\"'+password+'\"}';
		 window.alert(dataT);
		 $.ajax({
			 type:'POST',
			 url:'http://localhost:8080/CheckSystem/Login',
			 dataType:'json',
			 data:'{\"staff_id\":'+'\"'+username+'\",'+'\"staff_passwd\":'+'\"'+password+'\"}'
			 
		 }).done(function(data, status){
			 window.alert("done"+data.staff_name);
			 $('#name').val(data.staff_name);
			 $('#phone').val(data.staff_phone);
			 $('#job').val(data.staff_job);
			 $('#power').val(data.staff_power);
			 
			 form.submit();
		 }).fail(function(data, status){
			 window.alert("fail");
		 }).always(function(){
			 window.alert("hello");
		 });
	}
	 return bFlag;
}
    
    
    
    
    
    
    
    
    
    
    