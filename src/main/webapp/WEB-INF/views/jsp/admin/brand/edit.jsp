<%@ include file="../../common/header_top.jsp" %>
<title>Edit Endorser</title>

<%@ include file="../../common/header_bottom.jsp" %>

<spring:url value="/admin/brand/${brand.id}/edit" var="postUrl" />
<form:form method="POST" modelAttribute="brand" action="${postUrl}">
<div class="row">
  <div class="col-sm-2 form-group ui-widget" >
    <label class="sr-only" for="companyName">Company Name</label>
    <form:input path="companyName" type="text" class="form-control" id="companyName" placeholder="Company Name" style="width: 100%;"/>
  </div>
  <div class="col-sm-2">
    <input type="submit" value="Submit" class="btn btn-primary" />
    <form:input type="hidden" path="id" />
  </div>
</div>
</form:form>
<%@ include file="../../common/footer.jsp" %>