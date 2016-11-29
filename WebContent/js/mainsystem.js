$(document).ready(function(){
	$("#signout").click(function(){
		alert("quit");
		$('#main-menu').tree({
			data: [{    
			    "id": 1,    
			    "text": "系统管理",        
			    "children": [{    
			        "id": 11,    
			        "text": "角色"   
			    },{    
			        "id": 12,    
			        "text": "系统公告"   
			    }]    
			},{    
			    "id": 2,    
			    "text": "基础数据",    
			    "children":[{
			        "id":21,
			        "text":"区域管理"
			    },{
			        "id":22,
			        "text":"检查项目"
			    }]
			}]  
		});		
	});
	$('#main-menu').tree({
		onClick: function(node){
			alert(node.text+'id'+node.id);  // 在用户点击的时候提示
		}
	});
	
});
function quit()
{
	window.alert("quit");
}