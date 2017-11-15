<%--&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: 努力的程序员--%>
  <%--Date: 2017/11/11--%>
  <%--Time: 3:47--%>
  <%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
         <%--pageEncoding="UTF-8"%>--%>
<%--<%@ taglib uri="/struts-tags"  prefix="s"%>--%>
<%--<html>--%>
<%--<head>--%>
    <%--<title>我的课程</title>--%>
<%--</head>--%>

<%--<body>--%>
<%--&lt;%&ndash;<tr>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<th>课程名</th>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<s:iterator var="c" value="#session.classes">&ndash;%&gt;--%>
    <%--&lt;%&ndash;<th><s:property value="#c.productname"/> </th>&ndash;%&gt;--%>
<%--&lt;%&ndash;</s:iterator>&ndash;%&gt;--%>
<%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;<tr>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<th>老师名</th>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<s:iterator var="c" value="#session.classes">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<th><s:property value="#c.teachname"/> </th>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</s:iterator>&ndash;%&gt;--%>
<%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;<tr>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<th>分数</th>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<s:iterator var="c" value="#session.classes">&ndash;%&gt;--%>
    <%--&lt;%&ndash;<s:if test="#c.grade == null">&ndash;%&gt;--%>
     <%--&lt;%&ndash;<th>尚未评价</th>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</s:if>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<s:else>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<th><s:property value="#c.grade"/> </th>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</s:else>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</s:iterator>&ndash;%&gt;--%>
<%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;<tr>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<th>直播状态</th>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<s:iterator var="c" value="#session.classes">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<s:if test="#c.is_hot == 0">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<th>没有直播 </th>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</s:if>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<s:else>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<th>正在直播 </th>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</s:else>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</s:iterator>&ndash;%&gt;--%>
<%--&lt;%&ndash;</tr>&ndash;%&gt;--%>

<%--<tr>--%>
    <%--<th>课程名</th>--%>
    <%--<th>老师名</th>--%>
    <%--<th>分数</th>--%>
    <%--<th>直播状态</th>--%>
<%--</tr>--%>
<%--<s:iterator var="c" value="#session.classes">--%>
    <%--<tr>--%>
    <%--<th><s:property value="#c.productname"/> </th>--%>
    <%--<th><s:property value="#c.teachname"/> </th>--%>
        <%--<s:if test="#c.grade == null">--%>
        <%--<th>尚未评价</th></s:if>--%>
        <%--<s:else> <th><s:property value="#c.grade"/></th></s:else>--%>
        <%--<s:if test="#c.is_hot == 0">--%>
            <%--<th>没有直播</th></s:if>--%>
        <%--<s:else> <th>正在直播</th></s:else>--%>
    <%--</tr>--%>
    <%--<form action="savehome" method="post" enctype="multipart/form-data" >--%>
        <%--<input type="text" value="<s:property value="#c.productname"/>">--%>
        <%--<input type="file" name="homework" />--%>
        <%--<input type="text" value="<s:property value="#session.existUser.name"/>">--%>
        <%--<input id="uphowk" type="submit" value="提交作业" />--%>
    <%--</form>--%>
    <%--<br>--%>
<%--</s:iterator>--%>
<%--</body>--%>
<%--</html>--%>


<%--
  Created by IntelliJ IDEA.
  User: 努力的程序员
  Date: 2017/11/11
  Time: 3:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<html>
<style>
    html, body{height: 100%}
</style>
<head>
    <script src="../js/echarts.js"></script>
    <title>我的课程</title>
</head>

<body onload="init()">


<tr>
    <th>课程名</th>
    <th>老师名</th>
    <th>分数</th>
    <th>直播状态</th>
    <br>
</tr>
<s:iterator var="c" value="#session.classes">
    <tr>
        <th><s:property value="#c.productname"/> </th>
        <th><s:property value="#c.teachname"/> </th>
        <s:if test="#c.grade == null">
            <th>尚未评价</th></s:if>
        <s:else> <th><s:property value="#c.grade"/></th></s:else>
        <s:if test="#c.is_hot == 0">
            <th>没有直播</th></s:if>
        <s:else> <th>正在直播</th></s:else>
    </tr>
    <form action="savehome" method="post" enctype="multipart/form-data" >
        <input type="text" name="produvtname"value="<s:property value="#c.productname"/>">
        <input type="file" name="homework" />
        <input type="text" name="username" value="<s:property value="#session.existUser.uid"/>">
        <input id="uphowk" type="submit" value="提交作业" />
    </form>
    <form action="chat" method="post" enctype="multipart/form-data">
        <input type="submit" value="观看直播">
    </form>
    <br>
</s:iterator>
<div id="main" style="width:80%;height: 80%;"></div>
<s:property value="#session.existUser.uid"/>
<input type="hidden" id="sessionname" value="<s:property value="#session.existUser.uid"/>">
</body>
</html>

<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/show_echarts.js"></script>


