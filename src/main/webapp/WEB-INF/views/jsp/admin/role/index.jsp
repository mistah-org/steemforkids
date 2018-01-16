<%@ include file="../../common/header_top.jsp" %>

<title>Expenses</title>

<%@ include file="../../common/header_bottom.jsp" %>

        <!-- Table -->
        <table class="table">
          <thead>
          <tr>
            <th>ID</th>
            <th>Description</th>
          </tr>
          </thead>
          <tbody>
            <c:forEach items="${ roles }" var="role">
            <tr>
              <td><c:out value="${ role.id }"/></td>
              <td><c:out value="${ role.description }"/></td>
            </tr>
            </c:forEach>
            <tr>
              <td colspan="2">
                <spring:url value="/admin/role/new" var="newUrl" />
                <a href="${ newUrl }">Add Role</a>
              </td>
            </tr>
          </tbody>
        </table>
<%@ include file="../../common/footer.jsp" %>