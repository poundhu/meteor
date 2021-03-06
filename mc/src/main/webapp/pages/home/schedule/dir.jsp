﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	request.setAttribute("ctx", path);

	request.setAttribute("isDebug", "0");
	request.setAttribute("iFrameId", "scheduleProjectFrame");
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>流星-实时数据开发平台</title>
		
		<!-- header js css -->
		<%@include file="../../../commons/import_header_js_css.html"%>
		
		<SCRIPT type="text/javascript">
			$(function () {
				// form input trim
				$('form input').bind("blur",function(){ this.value = this.value.trim(); });
			});
		</SCRIPT>
	</head>

	<body>
		<!-- 在在dynamic-page.js中，切换皮肤需求引用 -->
		<input type="hidden" id="ctx" value="${ctx}">

		<div class="container-fluid">
			<div class="row-fluid">
				
				<div id="content">
				
					<div id="breadcrumb_div" name="breadcrumb_div">
						<ul class="breadcrumb">
							<li>任务和目录操作/</span></li>
							<li>${fileId}</li>
						</ul>
					</div>
					
					<!-- 创建任务 -->
					<div> <%@include file="../file_and_dir/file_creator_body.html"%> </div>
					
					<!-- 创建子目录 -->
					<div > <hr /> <%@include file="../file_and_dir/dir_creator_body.html"%> </div>
					
					<!-- 更改目录名称 -->
					<div > <hr /> <%@include file="../file_and_dir/dir_rename_body.html"%> <hr /> </div>
					
					<!-- 移动目录 -->
					<div> <%@include file="../file_and_dir/dir_move_body.html"%> </div>
					
					<!-- 删除目录 -->
					<div> <%@include file="../file_and_dir/dir_delete_body.html"%> </div>
				</div>
				
			</div>
		</div>
		
		<!-- fixedAtPageButtomToAutoFitPage -->
		<%@include file="../../../commons/fixedAtPageButtomToAutoFitPage.html"%>
		
		<!-- plug-in components js -->
		<%@include file="../../../commons/import_all_plugin_js.html"%>
		
		<!-- our custom commons js -->
		<%@include file="../../../commons/import_all_custom_js.html"%>

		<script type="text/javascript" >

			$(function () {
				<!-- defFileSysTree 初始化的js 注意：这里是dir的，不是 file的 ！！ -->
				<%@include file="../def_file_sys_tree/dir_tree_js_init.html"%>
				
				
				<%@include file="../file_and_dir/file_creator_js_init.html"%>
			});
			 
			<!-- defFileSysTree 普通常用的js，为该tree而特有的，此处  dir 与 file的 都要有！！ -->
			<%@include file="../def_file_sys_tree/dir_tree_js.html"%>
			<%@include file="../def_file_sys_tree/file_tree_js.html"%>
			 
			/** defFileSysTreeOnClick 需要实现，相当于实现接口中的方法 */
			function defFileSysTreeOnClick(event, treeId, treeNode) {
			}
			
			/** 重新设置页面高度 */
			function onLoadWindowSelf() {
				// reSetIFrameHeight("${iFrameId}");
				onLoadWindowParent();
			}
			
			/** window.onload */
			window.onload = function (){
				// alert("call: window.onload");
				onLoadWindowSelf();
			} 
		</script>

	</body>
</html>
