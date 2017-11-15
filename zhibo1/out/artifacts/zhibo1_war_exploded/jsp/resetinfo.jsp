<%--
  Created by IntelliJ IDEA.
  User: 努力的程序员
  Date: 2017/11/10
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>


<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
         <%--pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<%--<html xmlns="http://www.w3.org/1999/xhtml"><head>--%>
    <%--<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>--%>
    <%--<title>网上商城</title>--%>
    <%--<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>--%>
    <%--<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css"/>--%>

<%--</head>--%>
<%--<body>--%>

<%--<div class="container header">--%>
    <%--<div class="span5">--%>
        <%--<div class="logo">--%>
            <%--<a>--%>
                <%--<img src="${pageContext.request.contextPath}/image/r___________renleipic_01/logo.gif" alt="传智播客">--%>
            <%--</a>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="span9">--%>
        <%--<div class="headerAd">--%>
            <%--<img src="image\r___________renleipic_01/header.jpg" alt="正品保障" title="正品保障" height="50" width="320">--%>
        <%--</div>	</div>--%>
    <%--<%@ include file="menu.jsp" %>--%>
<%--</div><div class="container productContent">--%>
    <%--<div class="span6">--%>
        <%--<div class="hotProductCategory">--%>
            <%--<s:iterator var="c" value="#session.cList">--%>
                <%--<dl>--%>
                    <%--<dt>--%>
                        <%--<a href="${ pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><s:property value="#c.cname"/></a>--%>
                    <%--</dt>--%>
                    <%--<s:iterator var="cs" value="#c.categorySeconds">--%>
                        <%--<dd>--%>
                            <%--<a href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="#cs.csid"/>&page=1"><s:property value="#cs.csname"/></a>--%>
                        <%--</dd>--%>
                    <%--</s:iterator>--%>
                <%--</dl>--%>
            <%--</s:iterator>--%>
        <%--</div>--%>


    <%--</div>--%>

<%--<s:property value="#session.existUser.name"/>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <title>订单页面</title>
    <link href="${pageContext.request.contextPath}/css/common.css"
          rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/cart.css"
          rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/product.css"
          rel="stylesheet" type="text/css" />

</head>
<body>

<div class="container header">
    <div class="span5">
        <div class="logo">
            <a href="./网上商城/index.htm"> <img
                    src="${pageContext.request.contextPath}/image/r___________renleipic_01/logo.gif"
                    alt="传智播客" /> </a>
        </div>
    </div>
    <div class="span9">
        <div class="headerAd">
            <img src="${pageContext.request.contextPath}/image/header.jpg"
                 width="320" height="50" alt="正品保障" title="正品保障" />
        </div>
    </div>
    <%@ include file="menu.jsp"%>
</div>
<s:property value="#session.existUser.uid"/>
<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/userAdmin_userupdate.action" method="post" >
    <input type="hidden" name="uid" value="<s:property value="model.uid"/>" />
    <input type="hidden" name="state" value="<s:property value="model.state"/>" />
    <input type="hidden" name="code" value="<s:property value="model.code"/>" />
    &nbsp;
    <table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
        <tr>
            <td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
                height="26">
                <strong><STRONG>编辑用户</STRONG>
                </strong>
            </td>
        </tr>

        <tr>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                用户名称：
            </td>
            <td class="ta_01" bgColor="#ffffff">
                <input type="text" name="username" value="<s:property value="model.username"/>" id="userAction_save_do_logonName" class="bg"/>
            </td>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                密码：
            </td>
            <td class="ta_01" bgColor="#ffffff">
                <input type="text" name="password" value="<s:property value="model.password"/>" id="userAction_save_do_logonName" class="bg"/>
            </td>
        </tr>
        <tr>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                真实姓名：
            </td>
            <td class="ta_01" bgColor="#ffffff">
                <input type="text" name="name" value="<s:property value="model.name"/>" id="userAction_save_do_logonName" class="bg"/>
            </td>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                邮箱：
            </td>
            <td class="ta_01" bgColor="#ffffff">
                <input type="text" name="email" value="<s:property value="model.email"/>" id="userAction_save_do_logonName" class="bg"/>
            </td>
        </tr>
        <tr>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                电话：
            </td>
            <td class="ta_01" bgColor="#ffffff">
                <input type="text" name="phone" value="<s:property value="model.phone"/>" id="userAction_save_do_logonName" class="bg"/>
            </td>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                地址：
            </td>
            <td class="ta_01" bgColor="#ffffff">
                <input type="text" name="addr" value="<s:property value="model.addr"/>" id="userAction_save_do_logonName" class="bg"/>
            </td>
        </tr>

        <tr>
            <td class="ta_01" style="WIDTH: 100%" align="center"
                bgColor="#f5fafe" colSpan="4">
                <button type="submit" id="userAction_save_do_submit" value="确定" class="button_ok">
                    &#30830;&#23450;
                </button>

                <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
                <button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

                <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
                <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
                <span id="Label1"></span>
            </td>
        </tr>
    </table>
</form>
<%--<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/user/list.jsp" method="post">--%>
    <%--<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">--%>
        <%--<TBODY>--%>
        <%--<tr>--%>
            <%--<td class="ta_01" align="center" bgColor="#afd1f3">--%>
                <%--<strong>用户列表</strong>--%>
            <%--</TD>--%>
        <%--</tr>--%>
        <%--<tr>--%>

        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td class="ta_01" align="center" bgColor="#f5fafe">--%>
                <%--<table cellspacing="0" cellpadding="1" rules="all"--%>
                       <%--bordercolor="gray" border="1" id="DataGrid1"--%>
                       <%--style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">--%>
                    <%--<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">--%>

                        <%--<td align="center" width="17%">--%>
                            <%--用户名称--%>
                        <%--</td>--%>
                        <%--<td align="center" width="17%">--%>
                            <%--真实姓名--%>
                        <%--</td>--%>
                        <%--<td width="7%" align="center">--%>
                            <%--编辑--%>
                        <%--</td>--%>
                        <%--<td width="7%" align="center">--%>
                            <%--删除--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                        <%--<tr onmouseover="this.style.backgroundColor = 'white'"--%>
                            <%--onmouseout="this.style.backgroundColor = '#F5FAFE';">--%>

                            <%--<td style="CURSOR: hand; HEIGHT: 22px" align="center"--%>
                                <%--width="17%">--%>
                                <%--<s:property value="#u.username"/>--%>
                            <%--</td>--%>
                            <%--<td style="CURSOR: hand; HEIGHT: 22px" align="center"--%>
                                <%--width="17%">--%>
                                <%--<s:property value="#u.name"/>--%>
                            <%--</td>--%>
                            <%--<td align="center" style="HEIGHT: 22px">--%>
                                <%--<a href="${ pageContext.request.contextPath }/userAdmin_edit.action?uid=<s:property value="#u.uid"/>">--%>
                                    <%--<img src="${pageContext.request.contextPath}/images/i_edit.gif" border="0" style="CURSOR: hand">--%>
                                <%--</a>--%>
                            <%--</td>--%>

                            <%--<td align="center" style="HEIGHT: 22px">--%>
                                <%--<a href="${ pageContext.request.contextPath }/userAdmin_delete.action?uid=<s:property value="#u.uid"/>">--%>
                                    <%--<img src="${pageContext.request.contextPath}/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">--%>
                                <%--</a>--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                <%--</table>--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--</TBODY>--%>
    <%--</table>--%>
<%--</form>--%>
</body>
</html>
