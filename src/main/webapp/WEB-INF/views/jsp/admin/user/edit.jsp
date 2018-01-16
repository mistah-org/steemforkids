<%@ include file="../../common/header_top.jsp" %>
<title>Edit User</title>

<%@ include file="../../common/header_bottom.jsp" %>

<spring:url value="/admin/user/{user.username}/edit" var="postUrl" />
<form:form method="POST" modelAttribute="user" action="${postUrl}">
<div class="row">
  <div class="col-sm-2 form-group ui-widget" >
    <label class="sr-only" for="expenseType">User name</label>
    <form:input path="username" type="text" class="form-control" id="username" placeholder="Username" style="width: 100%;"/>
  </div>
  <div class="col-sm-2 form-group" >
    <label class="sr-only" for="amount">First Name</label>
    <form:input path="firstName" type="text" class="form-control" id="firstName" placeholder="First Name" style="width: 100%;" />
  </div>
  <div class="col-sm-2 form-group" >
    <label class="sr-only" for="transactionDate">Last Name</label>
    <form:input path="lastName" type="text" class="form-control" id="lastName" placeholder="Last Name" style="width: 100%;"/>
  </div>
  <div class="col-sm-2 form-group ui-widget" >
    <label class="sr-only" for="collectionType">Password</label>
    <form:input path="password" type="password" class="form-control" id="password" placeholder="Password" style="width: 100%;"/>
  </div>
  <div class="col-sm-4 form-group ui-widget" >
    <label class="sr-only" for="collectionType">Role</label>
    <form:select path="roles" class="form-control"
      placeholder="Roles" style="width: 100%;">
      <option value="" >-- Select --</option>
      <c:forEach items="${ roles }" var="role">
        <c:forEach items="${ user.roles }" var="usrRole">
          <option value="${ role.id }" ${ usrRole.id == role.id ? 'selected="selected"' : ''}>
            <c:out value="${ role.description }" />
          </option>
        </c:forEach>
      </c:forEach>
    </form:select>
  </div>
</div>
<div class="row">
  <div class="col-sm-2">
    <input type="submit" value="Submit" class="btn btn-primary" />
  </div>
</div>
</form:form>
<%@ include file="../../common/footer.jsp" %>