<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>设备管理</title>
<script language="javascript" type="text/javascript">
    function $(id) { 
        return document.getElementById(id);
    }
	//
    function addPlan() { 
        var z; 
        var i=$("EquId").value; 
        for (var j=1;j<$("mytable").rows.length;j++)   {
            if(parseInt(i)>=parseInt($("mytable").rows[j].cells[0].getElementsByTagName("input")[0].value))   
            {
                z=j;
            }                 
        } 
        var tableRow=$("mytable").insertRow(z+1);
		
        var Cell_0=tableRow.insertCell(0); 
        Cell_0.innerHTML='<input value="'+$("EquId").value+'"  readonly="true"/>';
        Cell_0.className="s1";
        var Cell_1=tableRow.insertCell(1);
        Cell_1.innerHTML='<input value="'+$("EquName").value+'"  readonly="true"/>';
        Cell_1.className="s2";
        var Cell_2=tableRow.insertCell(2);
        Cell_2.innerHTML='<input value="'+$("EquGroup").value+'"  readonly="true"/>';
        Cell_2.className="s3";
		var Cell_3=tableRow.insertCell(3);
        Cell_3.innerHTML='<input value="'+$("EquType").value+'"  readonly="true"/>';
        Cell_3.className="s5";
		var Cell_4=tableRow.insertCell(4);
        Cell_4.innerHTML='<input value="'+$("EquState").value+'"  readonly="true"/>';
        Cell_4.className="s6";
		
        var Cell_5=tableRow.insertCell(5);
        Cell_5.innerHTML="<a href='#' onclick='Del(this.parentNode,this.parentNode.parentNode.rowIndex)'>å é¤</a>";
        Cell_5.className="s4";
        var Cell_6=tableRow.insertCell(6);
        Cell_6.innerHTML="<a href='#' onclick='edit(this.parentNode.parentNode)' class='edit'>ä¿®æ¹</a>";
        Cell_6.className="s5";
    }
 
    function Del(obj,val) { 
        var a=window.confirm("æ¨ç¡®å®è¦å é¤åï¼"); 
        if(a)  {
            $("mytable").deleteRow(val);
        }  else  {
            window.alert("æªå é¤ï¼");
        }
    }
     
    function edit(obj) {
        var inp = obj.getElementsByTagName("input");
        for (var i=0,len=inp.length;i<len;i++)
        {
            inp[i].readOnly=false;
        }
    }
    </script>
</head>

<body>
  
 	<p>动态生成的列表</p>
 	<table border="1">
 		<tr>
 			<th>设备号</th> <th>设备名</th> <th>设备所属组</th> <th>设备所属类型</th> <th>设备状态</th> <th>操作</th>
 		</tr>
	 	<%
	 		for(int i=0;i<10;i++)
	 		{
	 			out.println("<tr>");
	 			for(int j=0;j<6;j++){
	 				out.print("<td>空调</td>");
	 			}
	 			out.print("\n</tr>\n");
	 		}
	 	%>
 	
 	</table>
 	
 	
 
    </body>
</html>

