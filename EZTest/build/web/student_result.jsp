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
                                <%int count = 0;
                                    int countques = 0;%>


                                <h2>${catname}</h2>

                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <table class="table table-hover">

                                    <thead>

                                        <tr>
                                            <th style="width: 50%">Question</th>
                                            <th>Option 1</th>
                                            <th>Option 2</th>
                                            <th>Option 3</th>
                                            <th>Option 4</th>
                                            <th>Your Answer</th>
                                            <th>Correct Answer</th>
                                            <th style="width: 20%">Result</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${stlist}" var="qlist">
                                            <tr>
                                                <td>
                                                    ${qlist.getQues_id().getQuestion()}
                                                </td>
                                                <td>
                                                    ${qlist.getQues_id().getOpt_1()}
                                                </td>
                                                <td>
                                                    ${qlist.getQues_id().getOpt_2()}
                                                </td>
                                                <td>
                                                    ${qlist.getQues_id().getOpt_3()}
                                                </td>
                                                <td>
                                                    ${qlist.getQues_id().getOpt_4()}
                                                </td>
                                                <td>

                                                    Option ${qlist.getStudent_answer()}

                                                </td>
                                                <td>

                                                    Option ${qlist.getQues_id().getCorrect_ans()}
                                                </td>



                                                <td>
                                                    <%countques = countques + 1;%>
                                                    <c:choose>

                                                        <c:when test="${qlist.getQues_id().getCorrect_ans() eq qlist.getStudent_answer()}">

                                                            <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                                                            <%count = count + 1;%>
                                                        </c:when>
                                                        <c:otherwise>

                                                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th>Marks:</th>
                                            <th> <%=(count)%>/<%=(countques)%></th>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="pull-right">
                                            <div class="form-group">
                                                <div class="col-md-6 col-md-offset-3">
                                                    <a class="btn-success" href="student_dashboard">Back to Dashboard</a>
                                                </div>
                                            </div>
                                        </div>

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