<%@include file="admin_header.jsp"%>

<!-- /top navigation -->

<!-- page content -->
<div class="right_col" role="main">
    <%        if (session.getAttribute("userType") != null) {
            String userType = session.getAttribute("userType").toString();
            if (!userType.equals("1") && !userType.equals("2")) {
                request.getRequestDispatcher("/login").forward(request, response);
            } // this is correct for sure:D
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

                        <form class="form-horizontal form-label-left" novalidate action="saveCategory" method="POST">
                            <span class="section">Please Fill out the Following Form</span>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Name <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="2" name="cat_name" placeholder="Subject Name" required="required" type="text">
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