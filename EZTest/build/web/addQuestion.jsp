<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="admin_header.jsp"%>
<!-- /top navigation -->
<!-- /top navigation -->

<!-- page content -->
<div class="right_col" role="main">
    <%
        if (session.getAttribute("userType") != null) {
            String userType = session.getAttribute("userType").toString();
            if (!userType.equals("1") && !userType.equals("2")) {
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

                        <form class="form-horizontal form-label-left" novalidate action="saveQuestion" method="POST">
                            <span class="section">Please Add Questions below</span>

                            <div class="item form-group">

                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Question <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="hidden" value="${Catid}" name="catid" />

                                    <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="2"name="name" placeholder="Question Here" required="required" type="text">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Option 1 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="option_1" name="option_1" required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Option 2 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="option_2" name="option_2" required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Option 3 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="option_3" name="option_3" required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Option 4 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="option_4" name="option_4" required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Correct Answer</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select class="form-control" name="correct_answer">
                                        <option value="1">Option one</option>
                                        <option value="2">Option two</option>
                                        <option value="3">Option three</option>
                                        <option value="4">Option four</option>
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