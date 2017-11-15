<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="span10 last">
	<div class="topNav clearfix">
		<ul>
			<s:if test="#session.existUser == null">
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/user_loginPage.action">登录</a>|</li>
			<li id="headerRegister" class="headerRegister"
				style="display: list-item;"><a href="${ pageContext.request.contextPath }/user_registPage.action">注册</a>|
			</li>
			</s:if>
			<s:else>
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<s:property value="#session.existUser.name"/>
				|</li>
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<%--<a href="${pageContext.request.contextPath}/adminProduct_addProduct.action">我要开课</a>|--%>
					<a href="${pageContext.request.contextPath}/adminProduct_findAlllist.action?page=1">我要开课</a>|

			</li>
			<li id="headerRegister" class="headerRegister" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/order_userfindByUid.action?uid=<s:property value="#session.existUser.uid"/>">我的课程</a>|
			</li>

				<li id="headerRegister" class="headerRegister" style="display: list-item;">
					<a href="${ pageContext.request.contextPath }/user_quit.action">退出</a>|
				</li>
			<li >
				<a href="${ pageContext.request.contextPath }/userAdmin_useredit.action?uid=<s:property value="#session.existUser.uid"/>">个人信息</a>
			</li>
			</s:else>
		
			<li><a>课程中心</a> |</li>
			<li><a>选课指南</a> |</li>
			<li><a>关于我们</a></li>
		</ul>
	</div>
	<div class="cart">
		<a href="${ pageContext.request.contextPath }/cart_myCart.action">购物车</a>
	</div>
	<div class="phone">
		客服热线: <strong>18224484784</strong>
	</div>
</div>
<div class="span24">
	<ul class="mainNav">
		<li><a href="${ pageContext.request.contextPath }/index.action">首页</a> |</li>
		<s:iterator var="c" value="#session.cList">
			<li><a href="${ pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><s:property value="#c.cname"/></a> |</li>
		</s:iterator>

	</ul>
</div>