<%@ include file="../../common/header_top.jsp" %>
<script>
  $(document).ready(function() {
  });
</script>

<title>Add product</title>

<%@ include file="../../common/header_bottom.jsp" %>

<spring:url value="/product/${ product.id }/edit" var="submitUrl" />
<form:form method="POST" modelAttribute="product" action="${ submitUrl }">
<div class="row">
  <div class="col-sm-2 form-group ui-widget" >
    <label class="sr-only" for="id">ID</label>
    <form:input path="id" type="text" class="form-control" placeholder="ID" style="width: 100%;"/>
  </div>
  <div class="col-sm-3 form-group ui-widget" >
    <label class="sr-only" for="name">Name</label>
    <form:input path="name" type="text" class="form-control" placeholder="Name" style="width: 100%;"/>
  </div>
  <div class="col-sm-2 form-group ui-widget" >
    <label class="sr-only" for="brand">Brand</label>
    <form:select path="brand" class="form-control" placeholder="Brand" style="width: 100%;">
      <option value="" >-- Brand --</option>
      <c:forEach items="${ brands }" var="brandOpt"  >
        <option value="${ brandOpt.id }" ${ brandOpt.id == product.brand.id ? 'selected="selected"' : ''}>
          <c:out value="${ brandOpt.companyName }"/>
        </option>
      </c:forEach>
    </form:select>
  </div>
  <div class="col-sm-2 form-group" >
    <label class="sr-only" for="price">Price</label>
    <form:input path="price" type="text" class="form-control" placeholder="Price" style="width: 100%;" />
  </div>
  <div class="col-sm-1">
    <input type="submit" value="Submit" class="btn btn-primary" />
  </div>
</div>
</form:form>

<%@ include file="../../common/footer.jsp" %>