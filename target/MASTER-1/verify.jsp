<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="icon" href="images/favicon.png"/>
        <title>Healthcare</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <link rel="stylesheet" type="text/css" href="css/verify.css"/> 
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css"/>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/custom.js"></script>
    </head>
    <body>
        <jsp:include page="components/header.jsp"></jsp:include>
        <jsp:include page="components/navbar.jsp"></jsp:include>

        <div class="row" style="margin: 10px 150px 50px 150px; border: 1px solid #000; border-radius: 5px">
            <div class="col-md-12" style="background: aliceblue;" >
                <h1 style="text-align: center">VERIFY FOR CHECKOUT</h1>
                <p style="text-align: center" class="text-danger">${messageCODE}</p>
                <div class="main-verification-input-wrap">
                    
                    <ul>
                        <li>You will receive a verification code on your mail after you checkout. Enter that code below.</li>
                        <li>We sent the email to address <strong>${sessionScope.acc.email}</strong><li>
                        <li>If somehow, you did not recieve the verification email then<br>
                            <form action="sendemail" method="post">
                                <button type="submit" 
                                        style="background: #8ebe08; color: #fff; padding: 5px !important; border:none">
                                    resend the verification email</button>
                            </form>
                        </li>
                    </ul>
                    <div class="main-verification-input fl-wrap">
                        <form action="order" method="post">
                            <div class="main-verification-input-item"> 
                                <input name="authcode" type="text" value="" placeholder="Enter the verification code" style="background: #ccc; color: #000"> 
                            </div> 
                            <button type="submit" class="main-verification-button">Verify Now</button>
                        </form>
                    </div>
                </div>
                <br><br><br><br>
                <h5 style="text-align: center">IF YOU CONTINUE YOUR INVOICE WILL BE CREATE!</h5>
                <h2 style="text-align: center">THANKS FOR THE VERIFICATION 💜</h2>
            </div>
        </div>

        <jsp:include page="components/footer.jsp"></jsp:include>

        </div>
        <a style="display: none" href="javascript:void(0);" class="scrollTop back-to-top" id="back-to-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </body>
</html> 