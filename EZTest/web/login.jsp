<!DOCTYPE html>

<html>
    <head>
        <title>Login!</title>
        <script type="text/javascript" src="/LeadManagement/resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="/LeadManagement/resources/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="/LeadManagement/resources/css/bootstrap.min.css" />
        <style type="text/css">
            #logo {
                height: 150px;
                width: 160px;
                margin-left: auto;
                margin-right: auto;
            }

            html, body {
                width: 100%;
                height: 100%;
            }

            .clear {
                clear: both;
            }

            #container {
                position: fixed;
                width: 340px;
                height: 280px;
                top: 50%;
                left: 50%;
                margin-top: -170px;
                margin-left: -170px;
                background-color: white;
            }

            h2 {
                text-align: center;
                font-family: Calibri;
                font-weight: bold;
                font-size: 25px;
                color: #8E9150;

            }

            #username {
                margin-top: 30px;
                background-color: #d3d3d3;
                padding: 10px;
                border: none;
                border-radius: 10px 0px 10px 0px;
            }

            p {
                text-align: center;
                font-size: 15px;
                font-weight: normal;
                font-family: Calibri;
            }

            p a {
                font-size: 15px;
                color: #CB0012;
                float: right;
                margin-top: -13px;
            }

            p a:hover {
                color: #555;
            }

            input {
                color: #777;
                padding-left: 10px;
                margin-left: 19px;
                width: 280px;
                height: 40px;
                border: none;
                font-size: 15px;
            }

            input[type=text] {
                border-radius: 10px 10px 0px 0px;
                width: 280px;
            }

            input[type=password] {
                margin-top: 2px;
                margin-bottom: 2px;
            }

            input[type=submit] {
                background-color: #8E9150;
                color: white;
                width: 291px;
                margin: 4px 15px 0px 19px;
                margin-bottom: 15px;
                border-radius: 0px 0px 10px 10px;
            }

            input[type=submit]:hover {
                cursor: pointer;
                background-color: #FFF;
                color: #000;
            }
        </style>

        <!-- Linking the favicon icon-image -->
        <link rel="icon" type="image/png" href="resources/images/favicon.png">
    </head>

    <body>
        
        <div id = "container">
            <div>
                <h2>&nbsp&nbsp&nbspEZ TEST</h2>
            </div>
            <div id = "logo">
                <img src="resources/images/logo.png" height="150" width="160" alt="Logo">
            </div>
            <div id = "username">
                <p><b>Log In!</b></p>
                <form action="dashboard" method="post">
                    <input type="email" name="email" placeholder="Username" required />
                    <input type="password" name="password" placeholder="Password" required />
                    <input type="submit" name="submit" value="Login" />
                </form>
            </div>
        </div>
    </body>
</html>

