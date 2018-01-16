<%@ include file="../../common/header_top.jsp" %>
<%@ taglib prefix="custom" uri="/WEB-INF/custom-functions.tld" %>

<title>Role-Product Matrix</title>

<%@ include file="../../common/header_bottom.jsp" %>
<c:if test="${ param.prompt == 'true'}">
<div class="alert alert-info alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Update done!</strong> Please re-login to reflect changes to system.
</div>
</c:if>
        <!-- Table -->
        <table class="table table-striped table-bordered table-hover table-responsive">
          <thead>
          <tr>
            <th></th>
            <c:forEach items="${ products }" var="product">
            <th><c:out value="${ product.value }"/></th>
            </c:forEach>
          </tr>
          </thead>
          <tbody>
            <c:forEach items="${ roles }" var="role">
            <tr>
              <td>
                <spring:url value="/admin/role_product/${ role.id }/edit" var="editUrl" />
                <a href="${ editUrl }">
                  <c:out value="${ role.description }"/>
                </a>
              </td>
              <c:forEach items="${ products }" var="product">
              <td class="text-center">
                <c:if test="${ custom:contains(role.viewableProducts, product.key) }" >&#x2714;</c:if>
              </td>
              </c:forEach>
            </tr>
            </c:forEach>
          </tbody>
        </table>
<%@ include file="../../common/footer.jsp" %>