<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/htmleaf-demo.css">
<link rel="stylesheet" type="text/css" href="../css/nav.css">
<link rel="stylesheet" type="text/css" href="../fonts/iconfont.css">
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"  src="../js/nav.js"></script>
<div id="top_bg">
	<div class="top">
		<a class="logo_l" href="/" title="返回首页"></a>
		<!--导航开始-->
		<div class="nav_z">
			<ul id="navul" class="cl">
				<s:if test="#session.existUser == null">
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						<a href="${ pageContext.request.contextPath }/user_loginPage.action">登录</a></li>
					<li id="headerRegister" class="headerRegister"
						style="display: list-item;"><a href="${ pageContext.request.contextPath }/user_registPage.action">注册</a>
					</li>
				</s:if>
				<s:else>
					<li id="headerRegister" class="headerRegister" style="display: list-item;">
						<a href="${ pageContext.request.contextPath }/user_quit.action">退出</a>
					</li>

					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						<a href="${pageContext.request.contextPath}/adminProduct_findAlllist.action?page=1&uid=<s:property value="#session.existUser.uid"/>">我要开课</a>

					</li>
					<li id="headerRegister" class="headerRegister" style="display: list-item;">
						<a href="${ pageContext.request.contextPath }/order_userfindByUid.action?uid=<s:property value="#session.existUser.uid"/>">我的课程</a>
					</li>
					<li >
						<a href="${ pageContext.request.contextPath }/userAdmin_useredit.action?uid=<s:property value="#session.existUser.uid"/>">个人信息</a>
					</li>
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						<s:property value="#session.existUser.name"/>
					</li>

				</s:else>
			</ul>
		</div>
		</div>
</div>
<%--导航栏start--%>
<div class="nav" id="daohangtiao">
	<div class="nav-top">
		<div id="mini" style="border-bottom:1px solid rgba(255,255,255,.1)"><img src="images/mini.png" ></div>
	</div>
	<ul class="tabContent" style="display: block;">
		<s:iterator var="c" value="#session.cList">
			<li class="nav-item">
				<a href="javascript:;"><i class="my-icon nav-icon icon_1"></i><span><s:property value="#c.cname"/></span><i class="my-icon nav-more"></i></a>
					<%--<a href="${ pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>" target="_blank"><img src="${pageContext.request.contextPath}/<s:property value="#p.image"/>" data-original="http://storage.shopxx.net/demo-image/3.0/201301/4a51167a-89d5-4710-aca2-7c76edc355b8-thumbnail.jpg" style="display: block;"></a>									</li>--%>
				<ul>
					<s:iterator var="cs" value="#c.categorySeconds">
						<li>
							<a href="javascript:;"><span>
								<a href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="#cs.csid"/>&page=1"><s:property value="#cs.csname"/></a>
                                </span>
							</a>
						</li>
					</s:iterator>
				</ul>
			</li>

		</s:iterator>
	</ul>
</div>
<%--导航栏end--%>

<%--<div class="span24 ">--%>

	<%--<ul class="mainNav ">--%>
		<%--<s:iterator var="c" value="#session.cList">--%>
			<%--<li>--%>
				<%--<a href="${ pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><s:property value="#c.cname"/>--%>
				<%--</a> |--%>
			<%--</li>--%>
		<%--</s:iterator>--%>
<%--</div>--%>
<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
<script>window.jQuery || document.write('<script src="../js/jquery-1.11.0.min.js"><\/script>')</script>
<script type="text/javascript" src="../js/nav.js"></script>
<script  type="text/javascript">
    $(".navbg").capacityFixed();
</script>