<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
li.navbar-nav > a:hover, li.navbar-nav > a:focus {
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: 4px;
    color: #ffffff;
    opacity: 1;
}

.navbar.navbar-ct-blue {
  background: #1B96BF;
  border: 1px solid #1B96BF;
  max-height: 50px;
  line-height: 30px;
  margin: 0;
}
.navbar.navbar-ct-blue .nav-justified > li {
  display: table-cell;
  width: 1%
}
.navbar.navbar-ct-blue .nav-justified > li > a {
  color: white;
  font-size: 30px;
}
.navbar.navbar-ct-blue .nav-justified > li > a:hover {
  color: #00F2FF;
  background: none;
}

.navbar.navbar-ct-green {
  background: #1B96BF;
  border: 1px solid #1B96BF;
  max-height: 50px;
  line-height: 30px;
  margin: 0;
}
.navbar.navbar-ct-green .nav-justified > li {
  display: table-cell;
  width: 1%
}
.navbar.navbar-ct-green .nav-justified > li > a {
  color: white;
  font-size: 30px;
}
.navbar.navbar-ct-green .nav-justified > li > a:hover {
  color: #00F2FF;
  background: none;
}
.table {
  margin-bottom: 60px;
}

.noFocusBkg.open .dropdown-toggle:focus { /*** new class to prevent highlighting */
  background: transparent; /* or transparent or inherit */
}

</style>

</head>

<body>

    <!-- Fixed navbar -->
    <nav class="navbar navbar-ct-green navbar-fixed-top" role="navigation">
      <div class="container">
          <ul class="nav nav-justified">
            <sec:authorize access="isAuthenticated()">
            <li>
              <spring:url value="/dashboard" var="dashboardUrl" />
              <a href="${ dashboardUrl }">
                <i class="pe-7s-timer"></i>
              </a>
            </li>
            </sec:authorize>

            <sec:authorize access="isAuthenticated() and hasAnyRole( 
              'ROLE_LOCALE_TREASURER', 'ROLE_LOCALE_AUDITOR','ROLE_LOCALE_COORDINATOR', 'ROLE_GROUP_SERVANT',
              'ROLE_NATIONAL_COORDINATOR', 'ROLE_DISTRICT_COORDINATOR', 'ROLE_DISTRICT_SERVANT')">
            <li>
              <spring:url value="/reports" var="url" />
              <a href="${ url }">
                <i class="pe-7s-note2" style="color: white;"></i>
              </a>
            </li>
            </sec:authorize>

            <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN', 'ROLE_DISTRICT_COORDINATOR', 'ROLE_DISTRICT_SERVANT'
              ,'ROLE_LOCALE_COORDINATOR','ROLE_GROUP_SERVANT')">
            <li>
              <spring:url value="/admin" var="url" />
              <a href="${ url }">
                <i class="pe-7s-config" style="color: white;"></i>
              </a>
            </li>
            </sec:authorize>

            <sec:authorize access="isAuthenticated()">
            <li class="dropdown noFocusBkg">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                <i class="pe-7s-user"></i> <span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <li>
                  <spring:url value="/logout" var="logoutUrl" />
                  <a href="${ logoutUrl }">Logout</a>
                </li>
                <li>
                  <sec:authentication property="principal.user.username" var="userId" />
                  <spring:url value="/user/${userId}/profile" var="profileUrl" />
                  <a href="${ profileUrl }">Profile</a>
                </li>
              </ul>
            </li>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
            <li class="dropdown">
              <spring:url value="/login" var="loginUrl" />
              <a href="${ loginUrl }">
                Login
              </a>
            </li>
            </sec:authorize>
          </ul>
      </div>
    </nav>
    <div class="container-fluid" style="margin-top: 60px; margin-bottom: 60px;">
      