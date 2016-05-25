<%@include file="admin_header.jsp"%>
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
                        <!-- /top navigation -->
                                    <!-- /top navigation -->

            <!-- page content -->
            <div class="right_col" role="main">

                <div class="">
                    
                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                
                                <div class="x_content">
<div class="col-md-8 col-lg-8 col-sm-7">
                                        <!-- blockquote -->
                                        <blockquote>
                                            <p>Welcome to your dashboard. 
                                                You can access different admin options from the menus on the right side bar.
                                                Check it out!</p>
                                        </blockquote>

                                        
                                    </div>
                                    

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- footer content -->
                <%@include file="admin_footer.jsp"%>