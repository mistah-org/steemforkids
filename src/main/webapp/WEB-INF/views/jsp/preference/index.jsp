<%@ include file="../common/header_top.jsp" %>

<title>Process Index</title>

<%@ include file="../common/header_bottom.jsp" %>

  <div class="row">
      <div class="col-lg-12">
          <h3>Administration</h3>
      </div>
  </div>

  <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN')">
  <div class="row" id="table-div">
    <div class="form-group">
      <spring:url value="/preference/notification" var="url" />
      <a href="${ url }">Users</a>
    </div>
  </div>

  <div class="row" id="table-div">
    <div class="form-group">
      <spring:url value="/admin/role" var="url" />
      <a href="${ url }">Roles</a>
    </div>
  </div>

  <div class="row" id="table-div">
    <div class="form-group">
      <spring:url value="/locale_account" var="url" />
      <a href="${ url }">Locales</a>
    </div>
  </div>

  <div class="row" id="table-div">
    <div class="form-group">
      <spring:url value="/expense_type" var="url" />
      <a href="${ url }">Expense Types</a>
    </div>
  </div>

  <div class="row" id="table-div">
    <div class="form-group">
      <spring:url value="/collection_type" var="url" />
      <a href="${ url }">Collection Types</a>
    </div>
  </div>
  </sec:authorize>

  <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN', 'ROLE_DISTRICT_COORDINATOR', 'ROLE_DISTRICT_SERVANT')">
  <div class="row" id="table-div">
    <div class="form-group">
      <spring:url value="/project" var="url" />
      <a href="${ url }">Projects</a>
    </div>
  </div>

  <div class="row" id="table-div">
    <div class="form-group">
      <spring:url value="/project_book" var="url" />
      <a href="${ url }">Project Support</a>
    </div>
  </div>

  <div class="row" id="table-div">
    <div class="form-group">
      <spring:url value="/reports/liquidation" var="liquidationUrl" />
      <a href="${ liquidationUrl }">Liquidation Report</a>
    </div>
  </div>
  </sec:authorize>
  
  <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN', 'ROLE_DISTRICT_COORDINATOR', 'ROLE_DISTRICT_SERVANT'
    ,'ROLE_LOCALE_COORDINATOR','ROLE_GROUP_SERVANT')">
    <div class="row" id="table-div">
      <div class="form-group">
        <spring:url value="/notification" var="url" />
        <a href="${ url }">Notification Settings</a>
      </div>
    </div>
  </div>
  </sec:authorize>

<%@ include file="../common/footer.jsp" %>