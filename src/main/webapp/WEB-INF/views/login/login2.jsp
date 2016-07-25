<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
  <title>relayr auth</title>
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" type="text/css" />
  <link href='//fonts.googleapis.com/css?family=Maven+Pro:400,500,700' rel='stylesheet' type='text/css'>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="/static/css/bootstrap-social.css" type="text/css" />
  <link rel="stylesheet" href="/static/css/styles.css" type="text/css" />
  <script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
  <style>
    body{
      margin: 80px 0 50px 0;
    }
  </style>
  <script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
</head>

<body>
 <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
  <script>
    $('ul.nav a').click(function (e) {
      e.preventDefault()
      $(this).tab('show')
    });
  </script>
<div class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <a href="https://relayr.io" class="navbar-brand">
        <img src="/static/img/relayr-logo.png" alt="relayr-logo"/>
      </a>
    </div>
  </div>
</div>
<div id="main" class="container">

  <script src="/static/javascript/auth.js"></script>

  <div class="column permission">
    <div class="auth-block">
      <h3>Authorise "Developer Dashboard" to use your relayr account?</h3>
          <div class="permission-list">
            <p>This application <strong>will be able to</strong>:</p>
            <ul>
                <li>Read and write user information like name, change devices and read device data.</li>
                <li>Modify device configuration.</li>
                <li>Read the history of data sent by devices.</li>
            </ul>
          </div>
          <div class="permission-list">
            <p>Sign up to our IoT cloud platform to:</p>
              <ol>
                <li>Connect all your devices.</li>
                <li>Take control of your data.</li>
                <li>Generate extensive analytic reports.</li>
                <li>Implement rules &amp; identify patterns.</li>
              </ol>
          </div>
    </div>
  </div>

  <div class="column">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#login" data-toggle="tab">Log in</a></li>
      <li><a href="#create-account" data-toggle="tab">Create an account</a></li>
      <li class="password-change hide"><a href="#password-change" data-toggle="tab"></a></li>
    </ul>

        <div class="tab-content">
          <h3 class="error ">
            <b></b>
          </h3>
          <div class="tab-pane active" id="login">
            <h3>WITH RELAYR ID:</h3>
            <form action="/oauth2/auth" class="form-horizontal" id="auth_form" role="form" method="post" autocomplete="on">
              <input name="app_name" id="app_name" type="hidden" value="Developer Dashboard" />
              <input name="client_id" id="client_id" type="hidden" value="3b383d97-8287-4a95-8bc6-c4cfeb5ddc6a" />
              <input name="gitHub_uri" id="gitHub_uri" type="hidden" value="https://github.com/login/oauth/authorize?scope=user:email&amp;client_id=a8a1187e1e458ced26de&amp;redirect_uri=https://api.relayr.io/oauth2/social-login&amp;state={&quot;clId&quot;:&quot;3b383d97-8287-4a95-8bc6-c4cfeb5ddc6a&quot;,&quot;scp&quot;:&quot;access-own-user-info configure-devices read-device-history&quot;,&quot;appName&quot;:&quot;Developer Dashboard&quot;,&quot;redUri&quot;:&quot;https://developer.relayr.io/dashboard/scrape&quot;,&quot;provider&quot;:&quot;github&quot;,&quot;resType&quot;:&quot;token&quot;}" />
              <input name="google_uri" id="google_uri" type="hidden" value= "https://accounts.google.com/o/oauth2/auth?response_type=code&amp;access_type=offline&amp;scope=profile email&amp;client_id=982028772653-s2nclbde2kdvaub4370estnls2qp4u5a.apps.googleusercontent.com&amp;redirect_uri=https://api.relayr.io/oauth2/social-login&amp;state={&quot;clId&quot;:&quot;3b383d97-8287-4a95-8bc6-c4cfeb5ddc6a&quot;,&quot;scp&quot;:&quot;access-own-user-info configure-devices read-device-history&quot;,&quot;appName&quot;:&quot;Developer Dashboard&quot;,&quot;redUri&quot;:&quot;https://developer.relayr.io/dashboard/scrape&quot;,&quot;provider&quot;:&quot;google&quot;,&quot;resType&quot;:&quot;token&quot;}" />
              <input name="redirect_uri" id="redirect_uri" type="hidden" value="https://developer.relayr.io/dashboard/scrape" />
              <input name="scope" type="hidden" id="scope" value="access-own-user-info configure-devices read-device-history" />
              <input name="response_type" id="response_type" type="hidden" value="token" />
              <input name="page_state" id="page_state" type="hidden" value="login" />

              <div class="form-group">
                <input id="email" class="form-control" placeholder ="Email" name="email" type="email" required>
              </div>

              <div class="form-group">
                <input class="form-control" id="password" placeholder="Password" name="password" type="password" required>
              </div>

              <div class="form-group">
                <input type="submit" class="btn btn-primary form-control" value="Sign In">
              </div>


              <div class="form-group">
                <a id="forgot-password" class="link" href="#">Forgot Password</a>
              </div> 

            </form> 
            <h3>WITH SOCIAL ACCOUNT:</h3>

            <div>
              <a class="btn btn-social btn-github">
                  <i class="fa fa-github"></i>
              </a>
            </div>

            <div>
              <a class="btn btn-social btn-google-plus">
                <i class="fa fa-google-plus"></i>
              </a>
            </div>
          </div>

          <div class="tab-pane" id="create-account">

            <form action="/oauth2/signup" class="form-horizontal" role="form" method="post" autocomplete="on">
              <input name="app_name" type="hidden" value="Developer Dashboard" />
              <input name="client_id" type="hidden" value="3b383d97-8287-4a95-8bc6-c4cfeb5ddc6a" />
              <input name="redirect_uri" type="hidden" value="https://developer.relayr.io/dashboard/scrape" />
              <input name="scope" type="hidden" value="access-own-user-info configure-devices read-device-history" />
              <input name="response_type" type="hidden" value="token" />
              <h3>NEW RELAYR ID:</h3>
              
              <div class="form-group">
                <input class="form-control" placeholder="First Name" name="first_name" type="text" required>
              </div>

              <div class="form-group">
                <input class="form-control" placeholder="Last Name" name="last_name" type="text" required>
              </div>

              <div class="form-group">
                <input class="form-control" placeholder="Email" name="email" type="email" required>
              </div>

              <div class="form-group">
                <input class="form-control" id="create_password" placeholder="Password" name="password" type="password" value="" required>
              </div>

              <div class="form-group">
                <input class="form-control" id="repeat_password" placeholder="Repeat password" name="repeat_password" type="password" value="" required>
              </div>

              <div class="form-group">
                <input class="form-control" id="company_name" placeholder="Company name" name="company_name" type="text" value="" required>
              </div>

              <div class="form-group">
                  <select class="form-control" id="industry_area" name="industry_area" required>
                      <option selected disabled>--Select industry area --</option>
                      <option value="1">Accommodations</option><option value="2">Accounting</option><option value="3">Advertising</option><option value="4">Aerospace</option><option value="5">Agriculture &amp; Agribusiness</option><option value="6">Air Transportation</option><option value="7">Apparel &amp; Accessories</option><option value="8">Auto</option><option value="9">Banking</option><option value="10">Beauty &amp; Cosmetics</option><option value="11">Biotechnology</option><option value="12">Chemical</option><option value="13">Communications</option><option value="14">Computer</option><option value="15">Construction</option><option value="16">Consulting</option><option value="17">Consumer Products</option><option value="18">Education</option><option value="19">Electronics</option><option value="20">Employment</option><option value="21">Energy</option><option value="22">Entertainment &amp; Recreation</option><option value="23">Fashion</option><option value="24">Financial Services</option><option value="25">Food &amp; Beverage</option><option value="26">Health</option><option value="27">Information</option><option value="28">Information Technology</option><option value="29">Insurance</option><option value="30">Journalism &amp; News</option><option value="31">Legal Services</option><option value="32">Manufacturing</option><option value="33">Media &amp; Broadcasting</option><option value="34">Medical Devices &amp; Supplies</option><option value="35">Motion Pictures &amp; Video</option><option value="36">Music</option><option value="37">Pharmaceutical</option><option value="38">Public Administration</option><option value="39">Public Relations</option><option value="40">Publishing</option><option value="41">Real Estate</option><option value="42">Retail</option><option value="43">Service</option><option value="44">Sports</option><option value="45">Technology</option><option value="46">Telecommunications</option><option value="47">Tourism</option><option value="48">Transportation</option><option value="49">Travel</option><option value="50">Utilities</option><option value="51">Video Game</option><option value="52">Web Services</option>
                  </select>
              </div>

              <div class="form-group">
                <input type="submit" class="btn btn-primary form-control" value="Create account">
              </div>
            </form>

          </div>

          <div class="tab-pane" id="password-change">

            <form action="" class="form-horizontal" role="form" method="post" autocomplete="on">
              <h3>FORGOT PASSWORD:</h3>

              <div class="form-group">
                <input class="form-control" placeholder="Email" name="email" type="email">
              </div>

              <div class="form-group">
                <input type="button" id="email-check" class="btn btn-primary form-control" value="Submit">
              </div>

              <div class="form-group">
                <a id="login-back" class="link" href="#"> Nevermind, I just remembered it!</a>
              </div> 

            </form>

          </div>
        </div>
      </div>



 

</body>
</html>


