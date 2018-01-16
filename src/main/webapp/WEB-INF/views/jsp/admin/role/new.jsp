<%@ include file="../../common/header_top.jsp" %>
<title>Add Role</title>

<%@ include file="../../common/header_bottom.jsp" %>

        <spring:url value="/admin/role/new" var="submitUrl" />
        <form:form method="POST" modelAttribute="roleForm" action="${submitUrl}">

          <!-- Table -->
          <table class="table">
            <thead>
            <tr>
              <th>ID</th>
              <th>Name</th>
            </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <form:input path="id" type="text" class="form-control"
                    id="id" placeholder="Id" />
                </td>
                <td>
                  <form:input path="description" type="text" class="form-control"
                    id="description" placeholder="Description" />
                </td>
              </tr>
              <tr>
                <td colspan="2">
                    <input type="submit" value="Submit" class="btn" />
                </td>
              </tr>
            </tbody>
          </table>
        </form:form>
<%@ include file="../../common/footer.jsp" %>