<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="debugFile.inc"%>
<!-- PAGE TITLE & BREADCRUMB-->
<div class="row-fluid">
	<h3 class="page-title">产品信息查看</h3>
	<ul class="breadcrumb">
		<li><i class="icon-home"></i> <a class="ajaxify" href="index.jsp">主页</a> <i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">产品信息查看</a> <i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">销售合同登记</a><i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">合同产品登记</a><i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">收款计划</a><i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">采购订单登记</a><i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">订单产品登记</a><i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">付款计划</a></li>
	</ul>
</div>

<div class='portlet-body form'>
	<form name="formSelect" id="form_Select" method="post" action="FindAction!findByCondition">
		<div class="row-fluid">
			<div class="span6">
				<div class="control-group">
					<div class="controls">
						<select id="findCondition" name="findCondition">
						<option value="contractTitle">按合同类型</option>
						<option value="salesName">按合同名称</option>
				</select>
						<input id="className" name="className" type="hidden" value="SalesAgreement" /> 
				<input id="textfield" name="textfield" type="text" />
					</div>
				</div>
			</div>
			<div class="span6">
				<div class="control-group">
					<div class="controls">
						<button id="select" type="button" class="btn btn-primary">查 询</button>
						<button id="Submit" class="btn btn-primary" type="button">高级搜索</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<div class="row-fluid">
	<form id="fom">
		<table>
			<div class="row-fluid">
				<span class="newfont07">选择：<a href="#" id="selectAll">全选</a>-<a href="#" id="unselect">反选</a>
				</span>
				<button class="btn" id="deleteChose" data-action="SalesAgreementAction!deleteSalesAgreement|${url }&method=8">删除所选销售合同</button>
				<a class="btn ajaxify" href="JSP/addSalesAgreement.jsp">添加销售合同</a>
			</div>
			<div class="row-fluid">
				<div class="row-fluid" style="text-align: center; font-size: 20px; background-color: #EEEEEE">销售合同详细列表</div>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>选择</th>
							<th>合同编号</th>
							<th>合同名称</th>
							<th>合同编码</th>
							<th>合同类别</th>
							<th>签约客户</th>
							<th>录入人</th>
							<th>录入时间</th>
							<th>当前状态</th>
							<th>合同总价</th>
							<th>已付费用</th>
							<th>尚欠费用</th>
							<th>是否交付</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator var="sale" value="#request.listObject">
							<tr>
								<td><input type="checkbox" name="delid" value="${sale.id }" /></td>
								<td><a class="ajaxify" href="SalesAgreementAction!edit?salesAgreement.id=${sale.id }">${sale.id}</a></td>
								<td><a class="ajaxify" href="SalesAgreementAction!edit?salesAgreement.id=${sale.id}">${sale.salesName}</a></td>
								<td>${sale.salesCode }</td>
								<td>${sale.contractTitle }</td>
								<td>${sale.contractName }</td>
								<td>${sale.enterPerson }</td>
								<td>${sale.enterDate }</td>
								<td>${sale.currentStatus }</td>
								<td>${sale.tatalPrice }</td>
								<td>${sale.paidPrice }</td>
								<td>${sale.loanPrice }</td>
								<td>${sale.isPaid }</td>
								<td><a class="ajaxify" href="SalesAgreementAction!edit?salesAgreement.id=${sale.id}&method=4">编辑(修改)</a> <a class="deleteOne" href="javascript:void(0)"
									data-action="SalesAgreementAction!deleteSalesAgreement?delid=${sale.id }&method=8|${url }">删除</a></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
			<div class="row-fluid">
				<s:set var="pageCount" value="(#request.totalSize-1)/10+1" />
				<s:set var="url" value="#request.url" />
				<div class="span4" style="margin: 20px 0px 20px 0px;">
					共 <span>${requestScope.pageCount}</span> 页 | 第 <span>${requestScope.currentIndex}</span> 页
				</div>
				<div class="pagination pull-right">
					<ul>
						<li class="active"><a class="ajaxify" href="${url }&index=1">首页</a></li>
						<s:if test='(#request.currentIndex) > 1'>
							<li class="active"><a class="ajaxify" href="${url }&index=${requestScope.currentIndex-1}">上页</a></li>
						</s:if>
						<s:else>
							<li class="disabled"><a href="javascript:;">上页</a></li>
						</s:else>
						<s:if test='(#request.currentIndex) < #pageCount'>
							<li class="active"><a class="ajaxify" href="${url }&index=${requestScope.currentIndex+1}">下页</a></li>
						</s:if>
						<s:else>
							<li class="disabled"><a href="javascript:;">下页</a></li>
						</s:else>
						<li class="active"><a class="ajaxify" href="${url }&index=${pageCount }">末页</a></li>
					</ul>
				</div>
			</div>
		</table>
	</form>
</div>
<script src="js/myAjaxify.js" type="text/javascript"></script>
<script>
	$("#select").click(function(e) {
		e.preventDefault();
		var pageContent = $('.page-content .page-content-body');

		$.ajax({
			url : $('#form_Select').attr('action'),
			data : $('#form_Select').serialize(),
			success : function(res) {
				pageContent.html(res);
			},
			error : function() {
				alert("你输入的有问题");
			}
		});
	});

	
</script>