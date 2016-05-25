
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="admin_header.jsp"%>

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

                        <form class="form-horizontal form-label-left" novalidate action="updateUser" method="POST">
                            <span class="section">Please Fill out the Following Form</span>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Name <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="hidden" value="${user.getUser_id()}" name="userid" />
                                    <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="3" data-validate-words="2" name="name" value="${user.getName()}" required="required" type="text">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="email" id="email" name="email" required="required" value="${user.getEmail()}"  class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>
                           
                            <div class="item form-group">

                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Access Type</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">

                                    <select class="form-control" name="isAdmin">
                                        <c:choose>
                                            <c:when test="${user.getIsadmin() eq 1}">
                                                <option value="1" selected="selected">Admin</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="1">Admin</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${user.getIsadmin() eq 2}">
                                                <option value="2" selected="selected">Test Master</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="2">Test Master</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${user.getIsadmin() eq 3}">
                                                <option value="3" selected="selected">Student</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="3">Student</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </div>

                            </div>

                    </div>

                    <div class="ln_solid"></div>
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <button type="reset" class="btn btn-primary">Cancel</button>
                            <button id="send" type="submit" class="btn btn-success">Submit</button>
                        </div>
                    </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- footer content -->
<%@include file="admin_footer.jsp"%>