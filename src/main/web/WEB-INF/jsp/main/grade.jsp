<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/28/028
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="base.jsp"/>
    <script>
        $(function () {
            $("button[name=queryGrade]").click(function () {
                var gradeId=$(this).attr("gradeId");

                $.get("${pageContext.request.contextPath}/grade/queryGrade.controller",
                    {"id":gradeId},
                    function (result) {
                        $("#queryGradeName").val(result.gradeName);

                        $("#queryDetails").val(result.details);
                        var date=new Date(result.createDate);
                        $("#queryCrateDate").val(date.toLocaleDateString());
                    })
                $("#modalGrade").modal("show");
            })
        })
    </script>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-4">
            <h4>班级列表</h4>
        </div>
    </div>
    <div class="row">
        <button class="btn btn-info" name="addGrade">新增</button>
        <button class="btn btn-danger">删除</button>
    </div>
    <div class="row">
        <table class="table">
            <tr>
                <th></th>
                <th>班级名称</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageInfo.list}" var="grade">
                <tr>
                    <th>${grade.id}</th>
                    <th>${grade.gradeName}</th>
                    <th>
                        <fmt:formatDate value="${grade.createDate}" type="date" dateStyle="medium"/>
                    </th>
                    <th>
                        <button class="btn btn-info" name="queryGrade" gradeId="${grade.id}">详情</button>
                        <button class="btn btn-danger" name="deleteGrade" gradeId="${grade.id}">删除</button>
                        <button class="btn btn-default" name="updateGrade" gradeId="${grade.id}">修改</button>
                    </th>
                </tr>
            </c:forEach>

        </table>
    </div>
</div>

<jsp:include page="page.jsp"/>

<div class="modal fade" tabindex="-1" role="dialog" id="modalGrade">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">班级详情</h4>
            </div>
            <div class="modal-body">
                <table class="table">
                    <tr>
                        <td>班级名称</td>
                        <td>
                            <input type="text" id="queryGradeName">
                        </td>
                    </tr>
                    <tr>
                        <td>创建时间</td>
                        <td>
                            <input type="text" id="queryDetails">
                        </td>
                    </tr>
                    <tr>
                        <td>班级详情</td>
                        <td>
                            <input type="text" id="queryCrateDate">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<%--删除班级方法--%>

<script>
    $(function () {
        $("button[name=deleteGrade]").click(function () {
            var id = $(this).attr("gradeId");
            if (confirm("确认删除该班级?")) {
            $.get("${pageContext.request.contextPath}/grade/deleteGrade.controller",
                {"id":id},function (returnData) {
                    alert(returnData.msg);
            location.href = location.href;
                },"json")
            }
        })
    })
</script>

<%--新增班级及模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="modalAddGrade">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加班级</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="addGradeForm">
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">班级名称：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="addGradeName" name="gradeName" placeholder="班级名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">班级描述：</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" rows="3"  name="details"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="saveAddGradeButton">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
    $(function () {
        
    $("button[name=addGrade]").click(function () {
        $("#modalAddGrade").modal("show");
    })

    $("#saveAddGradeButton").click(function () {
        var grade = $("#addGradeForm").serialize();

        $.get("${pageContext.request.contextPath}/grade/addGrade.controller",
            grade,function (returnData) {
                alert(returnData.msg);
        location.href=location.href;
            },"json")
    })
    })
</script>

<%--修改班级模态框及方法--%>
<div class="modal fade" tabindex="-1" role="dialog" id="modalUpdateGrade">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加班级</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="updateGradeForm">
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">班级名称：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="updateGradeName" name="gradeName" readonly>
                            <input type="hidden" id="updateGradeId" name="id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">班级描述：</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" rows="3" id="updateDetails" name="details"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="saveUpdateGradeButton">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
    $(function () {
        $("button[name=updateGrade]").click(function () {
            var gradeId=$(this).attr("gradeId");
            $.get("${pageContext.request.contextPath}/grade/queryGrade.controller",
                {"id":gradeId},
                function (result) {
                    $("#updateGradeName").val(result.gradeName);

                    $("#updateDetails").val(result.details);
                    $("#updateGradeId").val(result.id);
                })
            $("#modalUpdateGrade").modal("show");
        })
        $("#saveUpdateGradeButton").click(function () {
            var grade = $("#updateGradeForm").serialize();

            $.get("${pageContext.request.contextPath}/grade/updateGrade.controller",
            grade,function (returnData) {
                    alert(returnData.msg);
                    $("#modalUpdateGrade").modal("hide");
                },"json")
        })
    })
</script>
</body>
</html>
