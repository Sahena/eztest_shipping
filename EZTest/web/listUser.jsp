<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="admin_header.jsp"%>
<!-- /top navigation -->
<!-- /top navigation -->

<!-- page content -->
<div class="right_col" role="main">
<%
    if (session.getAttribute("userType") != null) {
        String userType = session.getAttribute("userType").toString();
        if (!userType.equals("1")) {
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

                        <table class="table table-striped projects">
                            <thead>
                                <tr>
                                    <th style="width: 20%">Name</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                    <th style="width: 20%">Options</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${userlist}" var="ulist">
                                    <tr>
                                        <td>
                                            ${ulist.getName()}
                                        </td>
                                        <td>
                                            ${ulist.getEmail()}
                                        </td>
                                        <td>
                                            <c:set var="admin" scope="session" value="${ulist.getIsadmin()}"/>

                                            <c:choose>
                                                <c:when test="${admin=='1'}">
                                                    <c:out value="Admin"></c:out>
                                                </c:when>    
                                                 <c:when test="${admin=='2'}">
                                                    <c:out value="Test Master"></c:out>
                                                </c:when> 
                                                <c:when test="${admin=='3'}">
                                                    <c:out value="Student"></c:out>
                                             </c:when> 
                                            </c:choose>   
                                        </td>
                                        <td>
                                            <a href="editUser?id=${ulist.getUser_id()}" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                            <a href="deleteUser?id=${ulist.getUser_id()}" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
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
    <!-- footer content -->
    <!-- footer content -->

    <%@include file="admin_footer.jsp"%>