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

                        <form class="form-horizontal form-label-left" novalidate action="saveUser" method="POST">
                            <span class="section">Please Fill out the Following Form</span>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Name <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="3" data-validate-words="2" name="name" placeholder="both name(s) e.g Jon Doe" required="required" type="text">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="email" id="email" name="email" required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>

                            <div class="item form-group">
                                <label for="password" class="control-label col-md-3">Password</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="password" type="password" name="password" class="form-control col-md-7 col-xs-12" placeholder="Minimum 3 Characters" required="required">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label for="password2" class="control-label col-md-3 col-sm-3 col-xs-12">Repeat Password</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="password2" type="password" name="password2" data-validate-linked="password" class="form-control col-md-7 col-xs-12" required="required">
                                </div>
                            </div>

                            <div class="item form-group">

                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Access Type</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select class="form-control" name="isAdmin">
                                        <option value="1">Admin</option>

                                        <option value="2">Test Master</option>
                                        <option value="3">Student</option>



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