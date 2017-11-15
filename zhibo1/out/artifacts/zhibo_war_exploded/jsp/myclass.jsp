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
<head>
    <title>我的课程</title>
</head>
<body>
<%--<tr>--%>
    <%--<th>课程名</th>--%>
    <%--<s:iterator var="c" value="#session.classes">--%>
    <%--<th><s:property value="#c.productname"/> </th>--%>
<%--</s:iterator>--%>
<%--</tr>--%>
<%--<tr>--%>
    <%--<th>老师名</th>--%>
    <%--<s:iterator var="c" value="#session.classes">--%>
        <%--<th><s:property value="#c.teachname"/> </th>--%>
    <%--</s:iterator>--%>
<%--</tr>--%>
<%--<tr>--%>
    <%--<th>分数</th>--%>
    <%--<s:iterator var="c" value="#session.classes">--%>
    <%--<s:if test="#c.grade == null">--%>
     <%--<th>尚未评价</th>--%>
    <%--</s:if>--%>
        <%--<s:else>--%>
        <%--<th><s:property value="#c.grade"/> </th>--%>
        <%--</s:else>--%>
    <%--</s:iterator>--%>
<%--</tr>--%>
<%--<tr>--%>
    <%--<th>直播状态</th>--%>
    <%--<s:iterator var="c" value="#session.classes">--%>
        <%--<s:if test="#c.is_hot == 0">--%>
        <%--<th>没有直播 </th>--%>
        <%--</s:if>--%>
        <%--<s:else>--%>
        <%--<th>正在直播 </th>--%>
        <%--</s:else>--%>
    <%--</s:iterator>--%>
<%--</tr>--%>


<s:iterator var="c" value="#session.classes">
    <th>课程名</th>
    <th><s:property value="#c.productname"/> </th>
    <th>老师名</th>
    <th><s:property value="#c.teachname"/> </th>
</s:iterator>
</body>
</html>
