<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="admin_header.jsp"%>

<!-- /top navigation -->

<!-- page content -->
<div class="right_col" role="main">
<%
    if (session.getAttribute("userType") != null) {
        String userType = session.getAttribute("userType").toString();
        if (!userType.equals("1")&&!userType.equals("2")) {
            request.getRequestDispatcher("/login").forward(request, response);
        }
    } else {
        request.getRequestDispatcher("/login").forward(request, response);
    }
%>
    <div class="">

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">

                    <div class="x_content">
                        <span class="section" style="font-size: 12px; font-style: italic; color: red"><b>Note:</b> Mandatory number of questions for each category is 10</span>
                        <table class="table table-striped projects">
                            <thead>
                                <tr>
                                    <th style="width: 20%">Subject</th>
                                    <th>Number of Questions</th>
                                    <th>Status</th>
                                    <th style="width: 20%">Options</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${categories}" var="clist">
                                    <tr>
                                        <td>
                                            <a>${clist.getCategory()}</a>
                                        </td>
                                        <td>
                                            ${clist.getCountQues()}
                                        </td>
                                        <td>
                                            <%--<c:set var="status" scope="session" value="${clist.getIscomplete()}"/>--%>
                                            <c:choose>
                                                <c:when test="${clist.getCountQues() >=10}">
                                                    <c:out value="Completed"></c:out>
                                                </c:when>    
                                                <c:otherwise>
                                                    <c:out value="In progress"></c:out>
                                                </c:otherwise>
                                            </c:choose> 
                                        </td>
                                        <td>
                                            <a href="listQuestion?id=${clist.getCat_id()}" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                                            <a href="editCategory?id=${clist.getCat_id()}"  class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                            <a href="deleteCategory?id=${clist.getCat_id()}" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>

                                            <c:choose>
                                                <c:when test="${clist.getCountQues() >= 10}">
                                                    <a href="addQuestion?id=${clist.getCat_id()}&qc=${clist.getCountQues()}" class="btn btn-primary btn-xs disabled" style="background-color: #F39C12; border-color: #F39C12"><i class="fa fa-plus"></i> Add Question </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="addQuestion?id=${clist.getCat_id()}&qc=${clist.getCountQues()}" class="btn btn-primary btn-xs" style="background-color: #F39C12; border-color: #F39C12 "><i class="fa fa-plus"></i> Add Question </a>
                                                </c:otherwise>
                                            </c:choose> 
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- footer content -->
    <%@include file="admin_footer.jsp"%>