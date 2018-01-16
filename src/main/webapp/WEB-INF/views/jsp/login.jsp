<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrapJs" />
    <spring:url value="/resources/core/js/jquery-ui.js" var="jqueryuiJs" />
    <spring:url value="/resources/core/js/ct-navbar.js" var="ctNavbarJs" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="${bootstrapJs}"></script>
    <script src="${jqueryuiJs}"></script>
    <script src="${ctNavbarJs}"></script>

    <spring:url value="/resources/core/css/navbar-fixed-top.css" var="coreCss" />
    <spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
    <spring:url value="/resources/core/css/jquery-ui.css" var="jqueryuiCss" />
    <spring:url value="/resources/core/css/ct-navbar.css" var="ctNavBarCss" />
    <spring:url value="/resources/core/css/pe-icon-7-stroke.css" var="peIcon7Css" />

    <link href="${bootstrapCss}" rel="stylesheet" />
    <link href="${coreCss}" rel="stylesheet" />
    <link href="${jqueryuiCss}" rel="stylesheet" />
    <link href="${ctNavBarCss}" rel="stylesheet" />
    <link href="${peIcon7Css}" rel="stylesheet" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <title>Login page</title>
    <link href="<c:url value='/resources/core/css/signin.css' />" rel="stylesheet"></link>

<body>
    <div class="container">

      <c:url var="loginUrl" value="/login" />
      <form action="${loginUrl}" method="post" class="form-signin">
        <c:if test="${param.error != null}">
          <div class="alert alert-danger">
            <p>Invalid username and password.</p>
          </div>
        </c:if>
        <c:if test="${param.logout != null}">
          <div class="alert alert-success">
            <p>You have been logged out successfully.</p>
          </div>
        </c:if>
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="username" class="sr-only">Username</label>
        <input type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
        <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
        <!-- TODO: Remember me
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
         -->
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>

    </div> <!-- /container -->

</body>
</html>