<%@ include file="../common/header_top.jsp" %>
<title>View Locale Store Form</title>

<%@ include file="../common/header_bottom.jsp" %>

<spring:url value="/inventory/${inventory.locale}/view" var="postUrl" />
<form:form method="POST" modelAttribute="inventory" action="${postUrl}">
  <div class="row">
    <div class="col-sm-12">
      <nav class="breadcrumb">
        <spring:url value="/inventory" var="indexUrl" />
        <a class="breadcrumb-item" href="${indexUrl}">Back</a>
      </nav>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-offset-4 col-sm-4 form-group ui-widget" >
      <label class="" for="locale">Locale</label>
      <form:input path="locale" type="text" class="form-control"
        placeholder="Locale" style="width: 100%;" readonly="true"/>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-offset-4 col-sm-4 form-group ui-widget" >
      <label class="" for="division">Division</label>
      <form:input path="division" type="text" class="form-control"
        placeholder="Division" style="width: 100%;" readonly="true"/>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-offset-4 col-sm-4 form-group ui-widget" >
      <label class="" for="district">District</label>
      <form:input path="district" type="text" class="form-control"
        placeholder="District" style="width: 100%;" readonly="true"/>
    </div>
  </div>

  <c:forEach items="${ inventory.productInventoryMap }" var="productInventory" varStatus="status">
    <div class="col-sm-offset-4 col-sm-4 form-group ui-widget" >
      <label class="" for="productInventoryMap.key">
        <c:out value="${ products[productInventory.key] }"/>
      </label>
      <input type="text" value="${ productInventory.value }"
        class="form-control" placeholder="Quantity" style="width: 100%;" readonly/>
    </div>
  </c:forEach>

</form:form>
<%@ include file="../common/footer.jsp" %>