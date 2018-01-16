<%@ include file="../../common/header_top.jsp" %>

<title>Expenses</title>
<%@ include file="../../common/header_bottom.jsp" %>

        <!-- Table -->
        <table class="table">
          <thead>
          <tr>
            <th>Username</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Role</th>
          </tr>
          </thead>
          <tbody>
            <c:forEach items="${ users }" var="user">
            <tr>
              <td>
              <spring:url value="/admin/user/${user.username}/edit" var="editUrl" />
                <a href="${ editUrl }"><c:out value="${ user.username }"/></a>
              </td>
              <td><c:out value="${ user.firstName }"/></td>
              <td><c:out value="${ user.lastName }"/></td>
              <td>
                <c:forEach items="${ user.roles }" var="role">
                  <c:out value="${ role.description }"/><br/>
                </c:forEach>
              </td>
            </tr>
            </c:forEach>
            <tr>
              <td colspan="2">
                <spring:url value="/admin/user/new" var="newUrl" />
                <a href="${ newUrl }">Add User</a>
              </td>
            </tr>
          </tbody>
        </table>
<%@ include file="../../common/footer.jsp" %>