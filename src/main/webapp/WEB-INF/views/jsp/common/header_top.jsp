<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<fmt:setLocale value="ja_JP" scope="session"/>
<html lang="en">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <spring:url value="/resources/core/css/navbar-fixed-top.css" var="coreCss" />
    <spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
    <spring:url value="/resources/core/css/jquery-ui.css" var="jqueryuiCss" />
    <spring:url value="/resources/core/css/ct-navbar.css" var="ctNavBarCss" />
    <spring:url value="/resources/core/css/pe-icon-7-stroke.css" var="peIcon7Css" />
    <spring:url value="/resources/core/css/helper.css" var="peIcon7HelperCss" />
    <spring:url value="/resources/core/css/font-awesome.min.css" var="faCss" />

    <link href="${bootstrapCss}" rel="stylesheet" />
    <link href="${coreCss}" rel="stylesheet" />
    <link href="${jqueryuiCss}" rel="stylesheet" />
    <link href="${ctNavBarCss}" rel="stylesheet" />
    <link href="${peIcon7Css}" rel="stylesheet" />
    <link href="${peIcon7HelperCss}" rel="stylesheet" />
    <!-- Removing Font-awesome and just use Pixiden due to it's compactness (fewer icons) and superior icons  
    <link href="${faCss}" rel="stylesheet" />
     -->

    <spring:url value="/resources/core/js/jquery-3.0.0.min.js" var="jqueryJs" />
    <spring:url value="/resources/core/js/jquery-migrate-3.0.0.min.js" var="jqueryMigrateJs" />
    <spring:url value="/resources/core/js/jquery-ui.js" var="jqueryuiJs" />
    <spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrapJs" />
    <spring:url value="/resources/core/js/ct-navbar.js" var="ctNavbarJs" />

    <script src="${jqueryJs}"></script>
    <script src="${jqueryMigrateJs}"></script>
    <script src="${jqueryuiJs}"></script>
    <script src="${bootstrapJs}"></script>
    <script src="${ctNavbarJs}"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

