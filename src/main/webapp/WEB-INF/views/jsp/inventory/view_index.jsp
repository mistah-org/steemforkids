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
        <h3>Locale Store Inventory</h3>
    </div>
  </div>

  <div class="row text-center pad-top">
    <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN')">
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
        <div class="div-square">
          <spring:url value="/inventory/view?withProducts=true" var="url" />
          <a href="${ url }">
            <i class="pe-7s-portfolio pe-3x pe-va pe-fw"></i>
            <h4>By Locale</h4>
          </a>
        </div>
      </div>
    </sec:authorize>

    <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN')">
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
        <div class="div-square">
          <spring:url value="/inventory/view?viewBy=district&withProducts=true" var="url" />
          <a href="${ url }">
            <i class="pe-7s-portfolio pe-3x pe-va pe-fw"></i>
            <h4>By District</h4>
          </a>
        </div>
      </div>
    </sec:authorize>

    <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN')">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
      <div class="div-square">
        <spring:url value="/inventory/view?viewBy=division&withProducts=true" var="url" />
        <a href="${ url }">
          <i class="pe-7s-portfolio pe-3x pe-va pe-fw"></i>
          <h4>By Division</h4>
        </a>
      </div>
    </div>
    </sec:authorize>
  </div>

<%@ include file="../common/footer.jsp" %>