<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="admin_header.jsp"%>

<!-- /top navigation -->
<!-- /top navigation -->

<!-- page content -->
<div class="right_col" role="main">
<%
    if (session.getAttribute("userType") != null) {
        String userType = session.getAttribute("userType").toString();
        if (!userType.equals("1")&!userType.equals("2")) {
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
                    <h2 style="clear: both; float: left;">Subject: ${cmodel.getCategory()}</h2>
                    <p style="float: right">  
                        <c:choose>
                            <c:when test="${qc >= 10}">
                                <a href="addQuestion?id=${cidd}&qc=${qc}" class="btn btn-primary btn-xs disabled" ><i class="fa fa-folder-o"></i> Add </a>
                            </c:when>
                            <c:otherwise>
                                <a href="addQuestion?id=${cidd}&qc=${qc}" class="btn btn-primary btn-xs" ><i class="fa fa-folder-o"></i> Add </a>
                            </c:otherwise>
                        </c:choose> 
                    </p>
                    <div class="x_content">

                        <table class="table table-striped projects">
                            <thead>
                                <tr>
                                    <th style="width: 30%">Question</th>
                                    <th>Option 1</th>
                                    <th>Option 2</th>
                                    <th>Option 3</th>
                                    <th>Option 4</th>
                                    <th>Correct Option</th>
                                    <th style="width: 20%">Options</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${quesList}" var="qlist">
                                    <tr>
                                        <td>
                                            <a>${qlist.getQuestion()}</a>
                                        </td>
                                        <td>
                                            ${qlist.getOpt_1()}
                                        </td>
                                        <td>
                                            ${qlist.getOpt_2()}
                                        </td>
                                        <td>
                                            ${qlist.getOpt_3()}
                                        </td>
                                        <td>
                                            ${qlist.getOpt_4()}
                                        </td>
                                        <td>
                                            ${qlist.getCorrect_ans()}
                                        </td>
                                        <td>
                                            <a href="editQuestion?id=${qlist.getQues_id()}&cid=${qlist.getCat_id().getCat_id()}" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                            <a href="deleteQuestion?id=${qlist.getQues_id()}&cid=${qlist.getCat_id().getCat_id()}" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
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