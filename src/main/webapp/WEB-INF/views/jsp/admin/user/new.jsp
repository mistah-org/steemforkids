<%@ include file="../../common/header_top.jsp" %>
<script>
  $(document).ready(function() {
    var availableLocales = [];
    <c:forEach items="${ locales }" var="locale">
    availableLocales.push("<c:out value="${locale.id}" />");
    </c:forEach>
    $("input[name='locale']").autocomplete({
      source: availableLocales,
      minLength: 0,
      focus: function() {            
        $(this).autocomplete("search");
      }
    });
</script>

<title>Add User</title>

<%@ include file="../../common/header_bottom.jsp" %>

<spring:url value="/admin/user/new" var="submitUrl" />
<form:form method="POST" modelAttribute="userForm" action="${submitUrl}">
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
    <div class="col-sm-2 form-group ui-widget" >
      <label class="sr-only" for="collectionType">Role</label>
      <form:select path="roles" multiple="multiple" class="form-control">
        <form:option value="" label="--- Select ---"/>
        <form:options items="${roles}"/>
      </form:select>
    </div>
    <div class="col-sm-2">
      <input type="submit" value="Submit" class="btn btn-primary" />
    </div>
  </div>
</form:form>
<%@ include file="../../common/footer.jsp" %>