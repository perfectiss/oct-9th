<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/28/028
  Time: 9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    
    <script>
        $(function () {
            $("li>a").click(function () {
                var pageNum = $(this).attr("pageNum");
                var url = location.href.split("?")[0];
                location.href = url+"?pageNum="+pageNum;
            })
        })
    </script>
</head>
<body>

<div class="container">
    <div class="rows">
            共${pageInfo.pages}页,共${pageInfo.total}条数据,当前第${pageInfo.pageNum} 页
    </div>
    <div class="rows">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li <c:if test="${pageInfo.isFirstPage}">class="disabled"</c:if>>
                    <a href="#" pageNum="1">
                        首页
                    </a>
                </li>
                <li <c:if test="${pageInfo.hasPreviousPage==false}">class="disabled"</c:if>>

                    <a href="#" aria-label="Previous" pageNum="${pageInfo.prePage}">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

                <c:forEach var="no" items="${pageInfo.navigatepageNums}">
                    <li <c:if test="${pageInfo.pageNum==no}">class="active"</c:if>><a href="#" pageNum="${no}">${no}</a></li>
                </c:forEach>
                <li <c:if test="${pageInfo.hasNextPage==false}">class="disabled"</c:if>>
                    <a href="#" aria-label="Next" pageNum="${pageInfo.nextPage}">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>

                <li <c:if test="${pageInfo.isLastPage}">class="disabled"</c:if>>
                    <a href="#" pageNum="${pageInfo.pages}">
                        末页
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>

</body>
</html>
