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
</style>

</head>

<body>

    <!-- Fixed navbar -->
    <nav class="navbar navbar-ct-green navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <sec:authorize access="isAuthenticated()">
          <sec:authentication property="principal.user.locale" var="usrLocale" />
          <ul class="nav navbar-nav">
            <li>
              <c:choose>
                <c:when test="${ empty usrLocale }">
                  <spring:url value="/dashboard" var="dashboardUrl" />
                  <a href="${ dashboardUrl }">
                    <i class="pe-7s-timer"></i>
                  </a>
                </c:when>
                <c:otherwise>
                  <spring:url value="/dashboard/${ usrLocale }" var="dashboardUrl" />
                  <a href="${ dashboardUrl }">
                    <i class="pe-7s-timer"></i>
                  </a>
                </c:otherwise>
              </c:choose>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                <i class="pe-7s-note2"></i><span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <li>
                  <spring:url value="/reports/accounts" var="accountsUrl" />
                  <a href="${ accountsUrl }">Accounts</a>
                </li>
                <li>
                  <spring:url value="/reports/balance_sheet" var="balanceSheetUrl" />
                  <a href="${ balanceSheetUrl }">Balance Sheet</a>
                </li>
                <!-- FIXME: Disabled for 0.0.1a release 
                <li>
                  <c:choose>
                    <c:when test="${ empty usrLocale }">
                      <spring:url value="/reports/liquidation" var="liquidationUrl" />
                      <a href="${ liquidationUrl }">Liquidation Report</a>
                    </c:when>
                    <c:otherwise>
                      <spring:url value="/reports/liquidation/${ usrLocale }" var="liquidationUrl" />
                      <a href="${ liquidationUrl }">Liquidation Report</a>
                    </c:otherwise>
                  </c:choose>
                </li>
                 -->
                <c:if test="${ not empty usrLocale }">
                <li>
                  <spring:url value="/dashboard/${ usrLocale }" var="url" />
                  <a href="${ url }">Collection vs Expense</a>
                </li>
                </c:if>
                <li>
                  <spring:url value="/expense" var="url" />
                  <a href="${ url }">Expenses</a>
                </li>
                <li>
                  <spring:url value="/collection" var="url" />
                  <a href="${ url }">Collections</a>
                </li>
                <li>
                  <spring:url value="/collection/project" var="url" />
                  <a href="${ url }">Projects</a>
                </li>
                <li>
                  <c:choose>
                    <c:when test="${ empty usrLocale }">
                      <spring:url value="/reports/statement" var="url" />
                      <a href="${ url }">Statements</a>
                    </c:when>
                    <c:otherwise>
                      <spring:url value="/reports/statement/${ usrLocale }" var="url" />
                      <a href="${ url }">Statements</a>
                    </c:otherwise>
                  </c:choose>
                </li>
              </ul>
            </li>
            <!-- FIXME: Disabled for 0.0.1a release
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                <i class="pe-7s-check"></i><span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <li>
                  <spring:url value="/approval" var="url" />
                  <a href="${ url }">Approvals</a>
                </li>
              </ul>
            </li>
             -->
          </ul>
          </sec:authorize>
          <sec:authorize access="isAnonymous()">
          <ul class="nav navbar-nav navbar-right">
            <li >
              <spring:url value="/login" var="loginUrl" />
              <a href="${ loginUrl }">Login</a>
            </li>
          </ul>
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="pe-7s-user"></i> <span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <li>
                  <spring:url value="/logout" var="logoutUrl" />
                  <a href="${ logoutUrl }">Logout</a>
                </li>
              </ul>
            </li>
          </ul>
          </sec:authorize>
          <sec:authorize access="hasRole('ADMIN')">
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                <i class="pe-7s-config"></i> <span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <li class="dropdown-header">Accounts</li>
                <li>
                  <spring:url value="/admin/user" var="userUrl" />
                  <a href="${ userUrl }">Users</a>
                </li>
                <li>
                  <spring:url value="/admin/role" var="roleUrl" />
                  <a href="${ roleUrl }">Roles</a>
                </li>
                <!-- FIXME: Disabled for 0.0.1a release
                <li>
                  <spring:url value="/admin/calendar" var="calendarUrl" />
                  <a href="${ calendarUrl }">Calendar</a>
                </li>
                 -->
                <li role="separator" class="divider"></li>
                <li class="dropdown-header">Locales</li>
                <li>
                  <spring:url value="/locale_account" var="localeAccountUrl" />
                  <a href="${ localeAccountUrl }">Locales</a>
                </li>
                <li role="separator" class="divider"></li>
                <li class="dropdown-header">Finance</li>
                <li>
                  <spring:url value="/expense_type" var="expenseTypeUrl" />
                  <a href="${ expenseTypeUrl }">Expense Types</a>
                </li>
                <li>
                  <spring:url value="/collection_type" var="collTypeUrl" />
                  <a href="${ collTypeUrl }">Collection Types</a>
                </li>
                <li>
                  <spring:url value="/project" var="url" />
                  <a href="${ url }">Projects</a>
                </li>
                <li>
                  <spring:url value="/admin/bpm" var="url" />
                  <a href="${ url }">Process</a>
                </li>
              </ul>
            </li>
          </ul>
          </sec:authorize>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <div class="container-fluid">
      <div class="jumbotron">