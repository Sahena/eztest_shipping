<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">

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

                <div class="col-md-3 left_col">
                    <div class="left_col scroll-view">


                        <div class="clearfix"></div>



                        <!-- /menu prile quick info -->

                        <br />

                        <!-- sidebar menu -->
                        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">

                            <div class="menu_section">
                                <h3>Menu</h3>
                                <ul class="nav side-menu">
                                    <c:choose>
                                        <c:when test="${userType eq 1}">                                     
                                    <li><a><i class="fa fa-users"></i> Users <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none">
                                            <li><a href="register">Register New User</a>
                                            </li>
                                            <li><a href="listUser">List Current Users</a>
                                            </li>
                                        </ul>
                                    </li>
                                     <li><a><i class="fa fa-edit"></i> Exam <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none">
                                            <li><a href="addCategory">Add New Subject Category</a>
                                            </li>
                                            <li><a href="listCategory">List Subject Categories</a>
                                            </li>
                                        </ul>
                                    </li>
                                        </c:when>
                                        <c:otherwise>
                                    <li><a><i class="fa fa-edit"></i> Exam <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none">
                                            <li><a href="addCategory">Add New Subject Category</a>
                                            </li>
                                            <li><a href="listCategory">List Subject Categories</a>
                                            </li>
                                        </ul>
                                    </li>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                        </div>
                        <!-- /sidebar menu -->
                    </div>
                </div>

                <!-- top navigation -->
                <div class="top_nav">

                    <div class="nav_menu">
                        <nav class="" role="navigation">
                            <div class="nav toggle">
                                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                            </div>

                            <ul class="nav navbar-nav navbar-right">

                                    <li><a href="logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
                                    </li>
                            
                            </ul>
                        </nav>
                    </div>

                </div>
                <!-- /top navigation -->