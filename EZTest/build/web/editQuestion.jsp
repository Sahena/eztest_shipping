<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="admin_header.jsp"%>
<!-- /top navigation -->
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

                        <form class="form-horizontal form-label-left" novalidate action="updateQuestion" method="POST">
                            <span class="section">Please Update Questions below</span>

                            <div class="item form-group">

                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Question <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">

                                    <input type="hidden" value="${qmodel.getQues_id()}" name="id" />
                                    <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="2"name="name" value="${qmodel.getQuestion()}" required="required" type="text">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Option 1 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="option_1" name="option_1" value="${qmodel.getOpt_1()}" required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Option 2 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="option_2" name="option_2"  value="${qmodel.getOpt_2()}" required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Option 3 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="option_3" name="option_3" required="required"  value="${qmodel.getOpt_3()}" class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Option 4 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="option_4" name="option_4" required="required" value="${qmodel.getOpt_4()}"  class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Correct Answer</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select class="form-control" name="correct_answer">
                                        <c:choose>
                                            <c:when test="${qmodel.getCorrect_ans() eq 1}">
                                                <option value="1" selected="selected">Option one</option>  
                                            </c:when>
                                            <c:otherwise>
                                                <option value="1">Option one</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${qmodel.getCorrect_ans() eq 2}">
                                                <option value="2" selected="selected">Option two</option>  
                                            </c:when>
                                            <c:otherwise>
                                                <option value="2">Option two</option>
                                            </c:otherwise>
                                        </c:choose>

                                        <c:choose>
                                            <c:when test="${qmodel.getCorrect_ans() eq 3}">
                                                <option value="3" selected="selected">Option three</option>  
                                            </c:when>
                                            <c:otherwise>
                                                <option value="3">Option three</option>
                                            </c:otherwise>
                                        </c:choose>

                                        <c:choose>
                                            <c:when test="${qmodel.getCorrect_ans() eq 4}">
                                                <option value="4" selected="selected">Option four</option>  
                                            </c:when>
                                            <c:otherwise>
                                                <option value="4">Option four</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </div>
                            </div>
                            <div class="item form-group" >

                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Subject Category</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select class="form-control" name="category">
                                        <c:forEach items="${listCategories}" var="catlist">
                                            <c:choose>
                                                <c:when test="${catlist.getCategory() eq qmodel.getCat_id().getCategory()}">
                                                    <option value="${catlist.getCat_id()}" selected="selected">${catlist.getCategory()}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${catlist.getCat_id()}">${catlist.getCategory()}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

                                    </select>
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
    <!-- footer content -->
    <!-- footer content -->

    <%@include file="admin_footer.jsp"%>