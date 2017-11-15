<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
<!--开课列表-->
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
		<script type="text/javascript">
			function addProduct(){
				window.location.href = "${pageContext.request.contextPath}/adminProduct_addProduct.action";
			}
		</script>
	</HEAD>
	<body>
		<br>
		<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/user/list.jsp" method="post">
			<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
				<TBODY>
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3">
							<strong>商品列表</strong>
						</TD>
					</tr>
					<tr>
						<td class="ta_01" align="right">
							<button type="button" id="add" name="add" value="添加" class="button_add" onclick="addProduct()">
&#28155;&#21152;
</button>

						</td>
					</tr>
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
								bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

									<td align="center" width="18%">
										序号
									</td>
									<td align="center" width="17%">
										商品图片
									</td>
									<td align="center" width="17%">
										商品名称
									</td>
									<td align="center" width="17%">
										商品价格
									</td>
									<td align="center" width="17%">
										是否热门
									</td>
									<td width="7%" align="center">
										编辑
									</td>
									<td width="7%" align="center">
										删除
									</td>
								</tr>
									<s:iterator var="p" value="clist" status="status">
										<s:iterator var="per" value="#session.teams" status="status">
											<s:if test="#per.pid == #p.pid">
												<tr onmouseover="this.style.backgroundColor = 'white'"
													onmouseout="this.style.backgroundColor = '#F5FAFE';">
													<td style="CURSOR: hand; HEIGHT: 22px" align="center"
														width="18%">
														<s:property value="#status.count"/>
													</td>
													<td style="CURSOR: hand; HEIGHT: 22px" align="center"
														width="17%">
														<img width="40" height="45" src="${ pageContext.request.contextPath }/<s:property value="#p.image"/>">
													</td>
													<td style="CURSOR: hand; HEIGHT: 22px" align="center"
														width="17%">
														<s:property value="#p.pname"/>
													</td>
													<td style="CURSOR: hand; HEIGHT: 22px" align="center"
														width="17%">
														<s:property value="#p.shop_price"/>
													</td>
													<td style="CURSOR: hand; HEIGHT: 22px" align="center"
														width="17%">
														<s:if test="#p.is_hot==1">
															是
														</s:if>
														<s:else>
															否
														</s:else>
													</td>
													<td align="center" style="HEIGHT: 22px">
														<a href="${ pageContext.request.contextPath }/adminProduct_editproduct.action?pid=<s:property value="#p.pid"/>&uid=<s:property value="#session.existUser.uid"/>">
															<img src="${pageContext.request.contextPath}/images/i_edit.gif" border="0" style="CURSOR: hand">
														</a>
													</td>

													<td align="center" style="HEIGHT: 22px">
														<a href="${ pageContext.request.contextPath }/adminProduct_userdelete.action?pid=<s:property value="#p.pid"/>">
															<img src="${pageContext.request.contextPath}/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
														</a>
													</td>
												</tr>

											</s:if>
											<s:else>

											</s:else>


										</s:iterator>





									</s:iterator>	
							</table>
						</td>
					</tr>
					<tr align="center">
						<td colspan="7">
							第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页 
							<s:if test="pageBean.page != 1">
								<a href="${ pageContext.request.contextPath }/adminProduct_findAlllist.action?page=1&uid=<s:property value="#session.existUser.uid"/>">首页</a>|
								<a href="${ pageContext.request.contextPath }/adminProduct_findAlllist.action?page=<s:property value="pageBean.page-1"/>&uid=<s:property value="#session.existUser.uid"/>">上一页</a>|
							</s:if>
							<s:if test="pageBean.page != pageBean.totalPage">
								<a href="${ pageContext.request.contextPath }/adminProduct_findAlllist.action?page=<s:property value="pageBean.page+1"/>&uid=<s:property value="#session.existUser.uid"/>">下一页</a>|
								<a href="${ pageContext.request.contextPath }/adminProduct_findAlllist.action?page=<s:property value="pageBean.totalPage"/>&uid=<s:property value="#session.existUser.uid"/>">尾页</a>|
							</s:if>
						</td>
					</tr>
				</TBODY>
			</table>
		</form>
<%--<s:iterator var="p" value="pageBean.list" status="status">--%>
	<%--asdf--%>
	<%--<s:property value="#p.pid"/>--%>
<%--</s:iterator>--%>

<%--<s:iterator var="per" value="team" status="status">--%>
	<%--asdfd--%>
	<%--<s:property value="#per.pid"/>--%>
<%--</s:iterator>--%>


		<%--<s:iterator var="per" value="#session.teams" status="status">--%>
			<%--asdfddd--%>
			<%--<s:property value="#per.pid"/>--%>
		<%--</s:iterator>--%>
	</body>
</HTML>

