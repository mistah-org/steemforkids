<%@ include file="../../common/header_top.jsp" %>
<%@ taglib prefix="custom" uri="/WEB-INF/custom-functions.tld" %>

<title>Role-Product Matrix</title>

<%@ include file="../../common/header_bottom.jsp" %>
        <spring:url value="/admin/role_product/${ role.id }/edit" var="submitUrl" />
        <form:form method="POST" modelAttribute="role" action="${submitUrl}">

        <div class="row">
          <div class="col-sm-12">
            <nav class="breadcrumb">
              <spring:url value="/admin/role_product" var="indexUrl" />
              <a class="breadcrumb-item" href="${indexUrl}">Back</a>
            </nav>
          </div>
        </div>

          <!-- Table -->
          <table class="table table-striped table-bordered table-hover table-responsive">
            <thead>
            <tr>
              <th>Role</th>
              <c:forEach items="${ products }" var="product">
                <th><c:out value="${ product.value }"/></th>
              </c:forEach>
            </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <c:out value="${ role.description }"/>
                </td>
                <c:forEach items="${ products }" var="product" >
                <td align="center">
                  <sec:authorize access="hasRole('ADMIN')" var="isAdmin"/>
                  <input type="checkbox" id="viewableProducts" name="viewableProducts"
                    value="${ product.key }"
                    ${ custom:contains(role.viewableProducts, product.key) ? 'checked="checked"' : ''}
                    ${ role.id == 'ROLE_ADMIN' ? 'disabled="true"' : '' } />
                </td>
                </c:forEach>
              </tr>
            </tbody>
          </table>
          <c:if test="${ role.id != 'ROLE_ADMIN' }">
          <div class="row">
            <div class="col-sm-12">
              <input type="submit" value="Submit" class="btn" />
              <form:input type="hidden" path="id" />
              <form:input type="hidden" path="description" />
            </div>
          </div>
          </c:if>
        </form:form>
<%@ include file="../../common/footer.jsp" %>