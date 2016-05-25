<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <%
        if (session.getAttribute("userType") != null) {
            String userType = session.getAttribute("userType").toString();
            if (!userType.equals("3")) {
                request.getRequestDispatcher("/login").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("/login").forward(request, response);
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>EZ Test</title>

        <!-- Bootstrap core CSS -->

        <link href="resources/css/bootstrap.min.css" rel="stylesheet">

        <link href="resources/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="resources/css/animate.min.css" rel="stylesheet">

        <!-- Custom styling plus plugins -->
        <link href="resources/css/custom.css" rel="stylesheet">
        <link href="resources/css/icheck/flat/green.css" rel="stylesheet">


        <script src="resources/js/jquery.min.js"></script>
        <style>
            #ez_test {
                font-size: 40px;
                text-align: center;
                color: white;
                margin-bottom: 10px;
            }

            a {
                color: white;
            }

            .radio label {
                margin-left: 50px;
            }

            .btn-primary {
                width: 100px;
            }
        </style>

        <!--[if lt IE 9]>
            <script src="../assets/js/ie8-responsive-file-warning.js"></script>
            <![endif]-->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->

    </head>


    <body class="nav-md">

        <div class="container body">

            <div class="main_container">

                <!-- page content -->
                <div class="col-md-12">
                    <div class="col-middle">
                        <div id = "ez_test">EZ TEST</div>
                        <div class="clearfix"></div>
                        <div class="x_content">

                            <div class="x_panel">
                                <div class="x_title">

                                    <div class="clearfix"></div>
                                </div>
                                <form action="submitQuestion" method="POST">
                                    <div class="x_content">
                                        <c:forEach items="${qlist}" var="qlist">

                                            <div class="col-md-8 col-lg-8 col-sm-7">
                                                <!-- blockquote -->
                                                <blockquote>
                                                    ${qlist.getQuestion()}
                                                </blockquote>
                                            </div>
                                            <div class="clearfix"></div>

                                            <div class="radio">
                                                <label>
                                                    <input type="hidden" value="${cid}" name="cid" /><input type="hidden" value="1" name="userid" /><input type="hidden" value="${qlist.getQues_id()}" name="quesid" />
                                                    a) ${qlist.getOpt_1()}
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    b) ${qlist.getOpt_2()}
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    c) ${qlist.getOpt_3()}
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    d) ${qlist.getOpt_4()}
                                                </label>
                                            </div>
                                                
                                            <div class="col-lg-9">
                                                <div class="col-xs-1">
                                              
                                                    <h4>Answer</h4>
                                            </div>
                                                <label>
                                                    <select class="form-control" name="answer">

                                                        <option value="0"></option>
                                                        <option value="1"> ${qlist.getOpt_1()}</option>
                                                        <option value="2"> ${qlist.getOpt_2()}</option>
                                                        <option value="3"> ${qlist.getOpt_3()}</option>
                                                        <option value="4"> ${qlist.getOpt_4()}</option>
                                                    </select>
                                                </label>
                                            </div>


                                        </c:forEach>
                                        <div class="pull-right">
                                            <div class="form-group">
                                                <div class="col-md-6 col-md-offset-3">
                                                    <button id="send" type="submit" class="btn btn-success">Submit</button>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </form>
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

        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
            </ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>

        <script src="resources/js/bootstrap.min.js"></script>

        <!-- chart js -->
        <script src="resources/js/chartjs/chart.min.js"></script>
        <!-- bootstrap progress js -->
        <script src="resources/js/progressbar/bootstrap-progressbar.min.js"></script>
        <script src="resources/js/nicescroll/jquery.nicescroll.min.js"></script>
        <!-- icheck -->
        <script src="resources/js/icheck/icheck.min.js"></script>

        <script src="resources/js/custom.js"></script>

        <!-- /footer content -->
    </body>

</html>