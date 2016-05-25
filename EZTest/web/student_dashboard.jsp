<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="student_header.jsp"%>
<body class="nav-md">
    <%    if (session.getAttribute("userType") != null) {
            String userType = session.getAttribute("userType").toString();
            if (!userType.equals("3")) {
                request.getRequestDispatcher("/login").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("/login").forward(request, response);
        }
    %>
    <div class="container body">

        <div class="main_container">

            <!-- page content -->
            <div class="col-md-12">
                <div class="col-middle">
                    <div class="x_content">
                        <div id = "ez_test">EZ TEST</div>
                        <div class="clearfix"></div>
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Select a Test you want to take.</h2>

                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 50%">Subject</th>
                                            <th>Number of Questions</th>
                                            <th style="width: 20%">Options</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach items="${categories}" var="clist">
                                            <tr>

                                                <c:if test="${clist.getCountQues() eq 10}">

                                                    <td>
                                                        <a>${clist.getCategory()}</a>
                                                    </td>
                                                    <td>
                                                        ${clist.getCountQues()}
                                                    </td>
                                                

                                                <td>
                                                    <a href="student_question?id=${clist.getCat_id()}" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i> Take the Test </a>
                                                </td>
                                            </tr>
                                            </c:if>
                                        </c:forEach>

                                    </tbody>
                                </table>

                            </div>
                        </div>


                        <table class="table table-striped projects">

                        </table>

                    </div>
                </div>
            </div>
            <!-- /page content -->

        </div>
        <!-- footer content -->
    </div>

    <%@include file="student_footer.jsp"%>