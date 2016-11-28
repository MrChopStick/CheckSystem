<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 引入JQuery -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui/jquery.min.js"></script>
  <!-- 引入EasyUI -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui/jquery.easyui.min.js"></script>
  <!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
  <!-- 引入EasyUI的样式文件-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-easyui/themes/default/easyui.css" type="text/css"/>
  <!-- 引入EasyUI的图标样式文件-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-easyui/themes/icon.css" type="text/css"/>
  <script>	
    function $(id) { 
        return document.getElementById(id);
    }
	
	//添加计划
    function addPlan() { 
    	
        var z=$("mytable").rows.length;//当前表格行数
       //window.alert($("mytable").rows[z-1].cell[0].getElementsByTagName("input")[0].value);
		//var LastPlan_id=$("mytable").rows[z-1].cell[0].getElementsByTagName("input")[0].value;//获取最后一行的计划编号 
		//var NewPlan_id=$("#Plan_name")[0].value; //获取新增计划编号的值
		window.alert($("#Plan_name"));
		window.alert("NewPlan_name");
		window.alert(z+"h");
		
		if(NewPlan_id==null||NewPlan_name==null||NewPlan_cycle==null||NewPlan_start_date==null||NewPlan_start_time==null||
		NewPlan_end_time==null||NewInspector_id==null||NewManager_id==null||NewPlan_state==null||NewPlan_note==null){
			window.alert("请完善计划内容");
		}
		else if(NewPlan_id<=LastPlan_id){
			alert("编号不合法，请重新输入！");
		}
		else{
        var NewRow=$("mytable").insertRow(z);
		
        var Cell_0=NewRow.insertCell(0);//
        Cell_0.innerHTML=NewPlan_id;
        Cell_0.className="Plan_id";
        var Cell_1=NewRow.insertCell(1);//
        Cell_1.innerHTML=NewPlan_name;
        Cell_1.className="Plan_name";
        var Cell_2=NewRow.insertCell(2);//
        Cell_2.innerHTML=NewPlan_cycle;
        Cell_2.className="Plan_cycle";
        var Cell_3=NewRow.insertCell(3);//
		Cell_3.innerHTML=NewPlan_start_date;
        Cell_3.className="Plan_start_date";
		var Cell_4=NewRow.insertCell(4);//
        Cell_4.innerHTML=NewPlan_start_time;
        Cell_4.className="Plan_start_time";
        var Cell_5=NewRow.insertCell(5);//
        Cell_5.innerHTML=NewPlan_end_time;
        Cell_5.className="Plan_end_time";
        var Cell_6=NewRow.insertCell(6);//
        Cell_6.innerHTML=NewInspector_id;
        Cell_6.className="Inspector_id";
        var Cell_7=NewRow.insertCell(7);//
		Cell_7.innerHTML=NewManager_id;
        Cell_7.className="Manager_id";
		var Cell_8=NewRow.insertCell(8);//
        Cell_8.innerHTML=NewPlan_state;
        Cell_8.className="Plan_state";
        var Cell_9=NewRow.insertCell(9);//
        Cell_9.innerHTML=NewPlan_note;
        Cell_9.className="Plan_note";
		
		var Cell_10=NewRow.insertCell(10);
        Cell_10.innerHTML="<a href='#' onclick='Del(this.parentNode,this.parentNode.parentNode.rowIndex)'>删除</a>";
        Cell_10.className="Delete";
        var Cell_11=NewRow.insertCell(11);
        Cell_11.innerHTML="<a href='#' onclick='edit(this.parentNode.parentNode)' class='edit'>修改</a>";
        Cell_11.className="Modify";
    }
	}

    function Del(obj,val) { 
        var a=window.confirm("您确定要删除吗？"); 
        if(a)  {
            $("mytable").deleteRow(val);
        }  else  {
            window.alert("未删除！");
        }
    }
     
    function Mod(obj) {
        var inp = obj.getElementsByTagName("input");
        for (var i=0,len=inp.length;i<len;i++)
        {
            inp[i].readOnly=false;
        }
    }
    </script>

    <title>动态表格</title>
</head>

<body>
<div style="margin:20px 0;"></div>
    <table id="mytable" bordercolor="#6699FF" cellspacing="0px" border="1px"><caption>巡检计划管理</caption>
            <td class="s_top">计划编号</td>
            <td class="s_top">计划名称</td>
            <td class="s_top">计划周期</td>
            <td class="s_top">计划开始日期</td>
            <td class="s_top">计划开始时间</td>
            <td class="s_top">计划截止时间</td>
            <td class="s_top">巡检人员编号</td>
            <td class="s_top">计划制定者编号</td>
            <td class="s_top">计划状态</td>
            <td class="s_top">计划备注</td>
            <td class="s_top" colspan="2">操作</td>
        </tr>
        <tr>
            <td class="Plan_id"><input type="text" value="1" readonly/></td>
            <td class="Plan_name"><input type="text" value="日常巡检计划" readonly/></td>
            <td class="Plan_cycle">
            <select class="easyui-combobox" name="state" style="width:200px;">
		<option value="oneday">一天</option>
        <option value="oneweek">一周</option>
		<option value="onemonth">一个月</option>
		<option value="threemonths">三个月</option>
		<option value="halfyear">半年</option>
		<option value="oneyear">一年</option>
        </select></td>
            <td class="Plan_start_date"><input class="easyui-datebox" data-options="sharedCalendar:'#cc'" type="text" readonly/></td>
            <td class="Plan_start_time">
            <select class="easyui-combobox" name="state" style="width:200px;">
		<option value="7">7:00</option>
        <option value="8">8:00</option>
		<option value="9">9:00</option>
		<option value="10">10:00</option>
		<option value="11">11:00</option>
		<option value="12">12:00</option>
		<option value="13">13:00</option>
		<option value="14">14:00</option>
        <option value="15">15:00</option>
		<option value="16">16:00</option>
		<option value="17">17:00</option>
		<option value="18">18:00</option>
        </select></td>
            <td class="Plan_end_time">
            <select class="easyui-combobox" name="state" style="width:200px;">
		<option value="7">7:00</option>
        <option value="8">8:00</option>
		<option value="9">9:00</option>
		<option value="10">10:00</option>
		<option value="11">11:00</option>
		<option value="12">12:00</option>
		<option value="13">13:00</option>
		<option value="14">14:00</option>
        <option value="15">15:00</option>
		<option value="16">16:00</option>
		<option value="17">17:00</option>
		<option value="18">18:00</option>
        </select></td>
            <td class="Inspector_id"><input type="text" value="1" readonly/></td>
            <td class="Manager_id"><input type="text" value="1" readonly/></td>
            <td class="Plan_state"><input type="text" value="1" readonly/></td>
            <td class="Plan_note"><input type="text" value="1" readonly/></td>
            <td class="Delete"><a href="#" onclick='Del(this.parentNode,this.parentNode.parentNode.rowIndex)'>删除</a></td>
            <td class="Modify"><a href="#" onclick='Mod(this.parentNode.parentNode)'>修改</a></td>
        </tr>
        <tr>
            <td class="Plan_id"><input type="text" value="2" readonly/></td>
            <td class="Plan_name"><input type="text" value="保养计划" readonly/></td>
            <td class="Plan_cycle">
            <select class="easyui-combobox" name="state" style="width:200px;">
		<option value="oneday">一天</option>
        <option value="oneweek">一周</option>
		<option value="onemonth">一个月</option>
		<option value="threemonths">三个月</option>
		<option value="halfyear">半年</option>
		<option value="oneyear">一年</option>
        </select></td>
            <td class="Plan_start_date"><input class="easyui-datebox" data-options="sharedCalendar:'#cc'" type="text" value="1" readonly/></td>
            <td class="Plan_start_time">
            <select class="easyui-combobox" name="state" style="width:200px;">
		<option value="7">7:00</option>
        <option value="8">8:00</option>
		<option value="9">9:00</option>
		<option value="10">10:00</option>
		<option value="11">11:00</option>
		<option value="12">12:00</option>
		<option value="13">13:00</option>
		<option value="14">14:00</option>
        <option value="15">15:00</option>
		<option value="16">16:00</option>
		<option value="17">17:00</option>
		<option value="18">18:00</option>
        </select></td>
            <td class="Plan_end_time">
            <select class="easyui-combobox" name="state" style="width:200px;">
		<option value="7">7:00</option>
        <option value="8">8:00</option>
		<option value="9">9:00</option>
		<option value="10">10:00</option>
		<option value="11">11:00</option>
		<option value="12">12:00</option>
		<option value="13">13:00</option>
		<option value="14">14:00</option>
        <option value="15">15:00</option>
		<option value="16">16:00</option>
		<option value="17">17:00</option>
		<option value="18">18:00</option>
        </select></td>
            <td class="Inspector_id"><input type="text" value="1" readonly/></td>
            <td class="Manager_id"><input type="text" value="1" readonly/></td>
            <td class="Plan_state"><input type="text" value="1" readonly/></td>
            <td class="Plan_note"><input type="text" value="1" readonly/></td>
            <td class="Delete"><a href="#" onclick='Del(this.parentNode,this.parentNode.parentNode.rowIndex)'>删除</a></td>
            <td class="Modify"><a href="#" onclick='Mod(this.parentNode.parentNode)'>修改</a></td>
        </tr>
        <tr>
            <td class="Plan_id"><input type="text" value="3" readonly/></td>
            <td class="Plan_name"><input type="text" value="精密保养计划" readonly/></td>
            <td class="Plan_cycle">
            <select class="easyui-combobox" name="state" style="width:200px;">
		<option value="oneday">一天</option>
        <option value="oneweek">一周</option>
		<option value="onemonth">一个月</option>
		<option value="threemonths">三个月</option>
		<option value="halfyear">半年</option>
		<option value="oneyear">一年</option>
        </select></td>
            <td class="Plan_start_date"><input class="easyui-datebox" data-options="sharedCalendar:'#cc'" type="text" value="1" readonly/></td>
            <td class="Plan_start_time">
            <select class="easyui-combobox" name="state" style="width:200px;">
		<option value="7">7:00</option>
        <option value="8">8:00</option>
		<option value="9">9:00</option>
		<option value="10">10:00</option>
		<option value="11">11:00</option>
		<option value="12">12:00</option>
		<option value="13">13:00</option>
		<option value="14">14:00</option>
        <option value="15">15:00</option>
		<option value="16">16:00</option>
		<option value="17">17:00</option>
		<option value="18">18:00</option>
        </select></td>
            <td class="Plan_end_time">
            <select class="easyui-combobox" name="state" style="width:200px;">
		<option value="7">7:00</option>
        <option value="8">8:00</option>
		<option value="9">9:00</option>
		<option value="10">10:00</option>
		<option value="11">11:00</option>
		<option value="12">12:00</option>
		<option value="13">13:00</option>
		<option value="14">14:00</option>
        <option value="15">15:00</option>
		<option value="16">16:00</option>
		<option value="17">17:00</option>
		<option value="18">18:00</option>
        </select></td>
            <td class="Inspector_id"><input type="text" value="1" readonly/></td>
            <td class="Manager_id"><input type="text" value="1" readonly/></td>
            <td class="Plan_state"><input type="text" value="1" readonly/></td>
            <td class="Plan_note"><input type="text" value="1" readonly/></td>
            <td class="Delete"><a href="#" onclick='Del(this.parentNode,this.parentNode.parentNode.rowIndex)'>删除</a></td>
            <td class="Modify"><a href="#" onclick='Mod(this.parentNode.parentNode)'>修改</a></td>
        </tr>
    </table><div id="cc" class="easyui-calendar"></div>
    
 <!--添加计划-->
      <!--<span class="span1">计划编号</span><input id="Plan_id" type="text"/>-->
    <br>
    <span class="span1">计划名称</span><input id="Plan_name" type="text"/>
    <br><br>
    <span class="span1">计划周期</span><select class="easyui-combobox" name="state" style="width:200px;">
		<option value="oneday">一天</option>
        <option value="oneweek">一周</option>
		<option value="onemonth">一个月</option>
		<option value="threemonths">三个月</option>
		<option value="halfyear">半年</option>
		<option value="oneyear">一年</option>
        </select>
    <br><br>
    <span class="span1">计划开始日期</span><input class="easyui-datebox" data-options="sharedCalendar:'#cc'" id="Plan_start_date" type="text"/>
    <br><br>
    <span class="span1">计划开始时间</span><td class="Plan_start_time">
            <select class="easyui-combobox" name="state" style="width:200px;">
		<option value="7">7:00</option>
        <option value="8">8:00</option>
		<option value="9">9:00</option>
		<option value="10">10:00</option>
		<option value="11">11:00</option>
		<option value="12">12:00</option>
		<option value="13">13:00</option>
		<option value="14">14:00</option>
        <option value="15">15:00</option>
		<option value="16">16:00</option>
		<option value="17">17:00</option>
		<option value="18">18:00</option>
        </select>
    <br><br>
    <span class="span1">计划截至时间</span>
            <select class="easyui-combobox" name="state" style="width:200px;">
		<option value="7">7:00</option>
        <option value="8">8:00</option>
		<option value="9">9:00</option>
		<option value="10">10:00</option>
		<option value="11">11:00</option>
		<option value="12">12:00</option>
		<option value="13">13:00</option>
		<option value="14">14:00</option>
        <option value="15">15:00</option>
		<option value="16">16:00</option>
		<option value="17">17:00</option>
		<option value="18">18:00</option>
        </select>
    <br><br>
    <span class="span1">巡检人员编号</span><input id="Inspector_id" type="text"/>
    <br><br>
    <span class="span1">计划制定者编号</span><input id="Manager_id" type="text"/>
    <br><br>
    <span class="span1">计划状态</span><input id="Plan_state" type="text"/>
    <br><br>
    <span class="span1">计划备注</span><input id="Plan_note" type="text"/>
    <br><br>
    <input class="but" type="button" value="添加计划" onclick="addPlan()"/>
    </body>
</html>
