<%@ include file="../common/header_top.jsp" %>

<title>Process Index</title>

<style>
/*==============================================
    DASHBOARD STYLES
    =============================================*/
.div-square {
    padding:5px;
    border:3px double #e1e1e1;
    -webkit-border-radius:8px;
   -moz-border-radius:8px;
    border-radius:8px;
    margin:5px;

}

.div-square> a,.div-square> a:hover {
    color:#808080;
     text-decoration:none;
}
</style>
<%@ include file="../common/header_bottom.jsp" %>

  <div class="row text-center pad-top">
    <div class="col-lg-12">
        <h3>Administration</h3>
    </div>
  </div>

  <div class="row text-center pad-top">
    <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN')">
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
        <div class="div-square">
          <spring:url value="/admin/brand" var="url" />
          <a href="${ url }">
            <i class="pe-7s-portfolio pe-3x pe-va pe-fw"></i>
            <h4>Brand</h4>
          </a>
        </div>
      </div>
    </sec:authorize>

    <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN')">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
      <div class="div-square">
        <spring:url value="/admin/product" var="url" />
        <a href="${ url }">
          <i class="pe-7s-server pe-3x pe-va pe-fw"></i>
          <h4>Products</h4>
        </a>
      </div>
    </div>
    </sec:authorize>

    <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN')">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
      <div class="div-square">
        <spring:url value="/inventory" var="url" />
        <a href="${ url }">
          <i class="pe-7s-box1 pe-3x pe-va pe-fw"></i>
          <h4>Inventory</h4>
        </a>
      </div>
    </div>
    </sec:authorize>
  </div>

  <div class="row text-center pad-top">
    <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN')">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
      <div class="div-square">
        <spring:url value="/locale_store_form" var="url" />
        <a href="${ url }">
          <i class="pe-7s-shopbag pe-3x pe-va pe-fw"></i>
          <h4>Forms</h4>
        </a>
      </div>
    </div>
    </sec:authorize>

    <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN') and ${ hasRoleAndProducts }">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
      <div class="div-square">
        <spring:url value="/admin/role_product" var="url" />
        <a href="${ url }">
          <i class="pe-7s-look pe-3x pe-va pe-fw"></i>
          <h4>Viewable Products</h4>
        </a>
      </div>
    </div>
    </sec:authorize>

  </div>

  <div class="row text-center pad-top">
    <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN')">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
      <div class="div-square">
        <spring:url value="/admin/user" var="url" />
        <a href="${ url }">
          <i class="pe-7s-users pe-3x"></i>
          <h4>Users</h4>
        </a>
      </div>
    </div>
    </sec:authorize>

    <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN')">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
      <div class="div-square">
        <spring:url value="/admin/role" var="url" />
        <a href="${ url }">
          <i class="pe-7s-network pe-3x pe-va pe-fw"></i>
          <h4>Roles</h4>
        </a>
      </div>
    </div>
    </sec:authorize>

    <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN')">
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
        <div class="div-square">
          <spring:url value="/preference/notification" var="url" />
          <a href="${ url }">
            <i class="pe-7s-bell pe-3x pe-va pe-fw"></i>
            <h4>Notifications</h4>
          </a>
        </div>
      </div>
    </sec:authorize>
  </div>

<%@ include file="../common/footer.jsp" %>