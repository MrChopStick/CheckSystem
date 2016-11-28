<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>设备组2</title>
<script language="javascript" type="text/javascript">
    function $(id) { 
        return document.getElementById(id);
    }
	//添加计划
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
        Cell_5.innerHTML="<a href='#' onclick='Del(this.parentNode,this.parentNode.parentNode.rowIndex)'>删除</a>";
        Cell_5.className="s4";
        var Cell_6=tableRow.insertCell(6);
        Cell_6.innerHTML="<a href='#' onclick='edit(this.parentNode.parentNode)' class='edit'>修改</a>";
        Cell_6.className="s5";
    }
 
    function Del(obj,val) { 
        var a=window.confirm("您确定要删除吗？"); 
        if(a)  {
            $("mytable").deleteRow(val);
        }  else  {
            window.alert("未删除！");
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
    <table id="mytable" bordercolor="#6699FF" cellspacing="0px" border="1px">
    <caption>设备组2</caption>
        <tr>
            <td class="s_top">设备号</td>
            <td class="s_top">设备名</td>
            <td class="s_top">设备所属组</td>
            <td class="s_top">设备所属类型</td>
            <td class="s_top">设备状态</td>
            <td class="s_top" colspan="2">操作</td>
        </tr>
        <tr>
            <td class="s1"><input value="1" readonly/></td>
            <td class="s2"><input value="空调" readonly/></td>
            <td class="s3"><input value="暂无" readonly/></td>
            <td class="s5"><input value="暂无" readonly/></td>
            <td class="s6"><input value="暂无" readonly/></td>
            <td class="s4"><a href="#" onclick='Del(this.parentNode,this.parentNode.parentNode.rowIndex)'>删除</a></td>
            <td class="s5"><a href="#" onclick='edit(this.parentNode.parentNode)'>修改</a></td>
        </tr>
        <tr>
            <td class="s1"><input value="2" readonly/></td>
            <td class="s2"><input value="空调" readonly/></td>
            <td class="s3"><input value="暂无" readonly/></td>
            <td class="s5"><input value="暂无" readonly/></td>
            <td class="s6"><input value="暂无" readonly/></td>
            <td class="s4"><a href="#" onclick='Del(this.parentNode,this.parentNode.parentNode.rowIndex)'>删除</a></td>
            <td class="s5"><a href="#" onclick='edit(this.parentNode.parentNode)'>修改</a></td>
        </tr>
        <tr>
            <td class="s1"><input value="3" readonly/></td>
            <td class="s2"><input value="空调" readonly/></td>
            <td class="s3"><input value="暂无" readonly/></td>
            <td class="s5"><input value="暂无" readonly/></td>
            <td class="s6"><input value="暂无" readonly/></td>
            <td class="s4"><a href="#" onclick='Del(this.parentNode,this.parentNode.parentNode.rowIndex)'>删除</a></td>
            <td class="s5"><a href="#" onclick='edit(this.parentNode.parentNode)'>修改</a></td>
        </tr>
    </table>
 
    <span class="span1">设备号</span><input id="EquId" type="text"/>
    <br>
    <span class="span1">设备名</span><input id="EquName" type="text"/>
    <br>
    <span class="span1">设备所属组</span><input id="EquGroup" type="text"/>
    <br>
    <span class="span1">设备所属类型</span><input id="EquType" type="text"/>
    <br>
    <span class="span1">设备状态</span><input id="EquState" type="text"/>
    <br>
    <input class="but" type="button" value="添加计划" onclick="addPlan()"/>
 
    </body>
</html>

