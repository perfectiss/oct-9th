<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/30/030
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="base.jsp"/>
</head>
<body>
<div class="container">
    <div class="rows">
        <div class="col-md-4 col-md-offset-3">
            <h3> 学生列表</h3>
        </div>
    </div>
    <div class="rows">
        <div>
            <button id="addStudentButton" class="btn btn-info">
                <span class="glyphicon glyphicon-plus"></span>
                新增
            </button>
            <button id="deleteStudentsButton" class="btn btn-danger">
                <span class="glyphicon glyphicon-trash"></span>
                删除
            </button>
        </div>
    </div>
    <div class="rows">
        <table class="table">
            <tr>
                <td></td>
                <td>学生编号</td>
                <td>学生姓名</td>
                <td>班级</td>
                <td>性别</td>
                <td>年龄</td>
                <td>操作</td>
            </tr>

            <c:forEach items="${pageInfo.list}" var="student">

            <tr>
                <td>
                    <input type="checkbox" name="delStudent" stuId="${student.id}">
                </td>
                <td>${student.stuNum}</td>
                <td>${student.stuName}</td>
                <td>${student.grade.gradeName}</td>
                <td>${student.gender}</td>
                <td>${student.age}</td>
                <td>
                    <button class="btn btn-danger">删除</button>
                </td>
            </tr>
            </c:forEach>
        </table>
    </div>
</div>

<jsp:include page="page.jsp"/>

<%--批量删除学生--%>
<script type="text/javascript">
    $(function () {
        $("#deleteStudentsButton").click(function () {

          var stuIds="";
           $.each($("input:checkbox[name=delStudent]"),function () {
                if(this.checked){
                    stuIds = stuIds + $(this).attr("stuId")+",";
                }
            });
            if (stuIds==null||stuIds.length==0) {
                alert("请选择要删除的学生!");
            }else{
                if(confirm('要删除选中的学生吗?')) {
                    $.get("${pageContext.request.contextPath}/student/doDeleteStudents.controller",
                        {"stuIds":stuIds},function (returnData) {
                            alert(returnData.msg);
                            location.href = location.href;
                        },"json")
                }
            }


        })
    })
</script>

<%--新增学生方法及模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="modalAddStudent">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加学生</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="addStudentForm">
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">学生姓名：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="stuName" placeholder="学生姓名">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-3 control-label">学生年龄：</label>
                        <div class="col-sm-9">
                            <input type="number" class="form-control" name="age" placeholder="学生年龄">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">学生性别：</label>
                        <div class="col-sm-9">
                            <input type="radio"  name="gender" id="gender1" value="男" checked> 男
                            <input type="radio"  name="gender" id="gender2" value="女"> 女
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">所在班级：</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="addStudentSelect" name="grade.id">
                            </select>
                            <input type="hidden"  name="grade.gradeName" id="addGradeName">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="saveAddStudentButton">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<%--新增学生方法--%>
<script>
    $(function () {
        $("#addStudentButton").click(function () {
            appendGradeSelect($("#addStudentSelect"));
            $("#modalAddStudent").modal("show");
        })

        $("#saveAddStudentButton").click(function () {
            $("#addGradeName").val($("#addStudentSelect").find("option:selected").text());
            var student = $("#addStudentForm").serialize();
            $.get("${pageContext.request.contextPath}/student/doAddStudent.controller",student,
            function (returnData) {
                alert(returnData.msg);
                location.href = location.href;
            },"json")

        })
    })
function appendGradeSelect(element,gradeid) {
    element.empty();
    $.get("${pageContext.request.contextPath}/grade/queryAllGrade.controller",
    function (returnData) {
        $.each(returnData,function (i,n) {
            var option="<option value='"+n.id+"'>"+n.gradeName+"</option>";
            element.append(option);
        })
        /*$.each(returnData,function () {
            var option="<option value='"+this.id+"'>"+this.gradeName+"</option>";
            element.append(option);
        })*/
       /* for(var i=0;i<returnData.length;i++){
            var option="<option value='"+returnData[i].id+"'>"+returnData[i].gradeName+"</option>";
            element.append(option);

        }*/
        if(gradeId!=null){
            element.val(gradeId);
        }
    })
}
</script>



</body>
</html>
