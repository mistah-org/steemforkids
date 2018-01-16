<%@ include file="../common/header_top.jsp" %>
<title>New Locale Store Form</title>

<%@ include file="../common/header_bottom.jsp" %>

<c:if test="${ param.success == 'true'}">
<div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Form submitted.</strong> Thanks be to God!
</div>
</c:if>

<spring:url value="/locale_store_form/new" var="submitUrl" />
<form:form method="POST" modelAttribute="lsForm" action="${submitUrl}">
  <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN')">
  <div class="row">
    <div class="col-sm-12">
      <nav class="breadcrumb">
        <spring:url value="/locale_store_form" var="indexUrl" />
        <a class="breadcrumb-item" href="${indexUrl}">Back</a>
      </nav>
    </div>
  </div>
  </sec:authorize>
  <div class="row">
    <div class="col-sm-12 text-center">
      <h3>Locale Store Form <br/>
        <small>For Inquiries:<br/>
            Contact: 0917 537 3927 / 0998 568 2186</small></h3>
    </div>
  </div>

  <div class="row">
    <div class="col-sm-offset-4 col-sm-4">
      <h5><small><font color="red">* Required</font></small></h5>
    </div>
  </div>

  <div class="row">
    <div class="col-sm-offset-4 col-sm-4 form-group ui-widget" >
      <h5><label for="formType">
        Type of Form <font color="red">*</font>
      </label> <br/><small>Order, Purchase or Remittance Form</small></h5>
      <form:select path="formType" class="form-control"
        placeholder="Type Of Form" style="width: 100%;">
        <option value="" >-- Select --</option>
        <option value="ORDER" >Order Form</option>
        <option value="PURCHASE" >Purchase Form</option>
        <option value="REMITTANCE" >Remittance Form</option>
      </form:select>
    </div>
  </div>

  <div class="row">
    <div class="col-sm-offset-4 col-sm-4 form-group ui-widget" >
      <div class="panel panel-primary">
        <div class="panel-heading">Locale Store Coordinator Information</div>
        <div class="panel-body">
          <div><h5><label for="transactionDate">Transaction Date <font color="red">*</font></label> <br/>
            <small>Order, Purchase, Remittance Date</small></h5>
            <form:input path="transactionDate" type="date" class="form-control"
              placeholder="mm/dd/yyyy" style="width: 100%;"/>
          </div>
          <div><h5><label for="transactBy">Transact By <font color="red">*</font></label> <br/>
            <small>Full Name of the Locale Store Coordinator</small></h5>
            <form:input path="transactBy" type="text" class="form-control"
              placeholder="Transact By" style="width: 100%;"/>
          </div>
          <div><h5><label for="contact">Contact <font color="red">*</font></label> <br/>
            <small>Contact of the Locale Store Coordinator</small></h5>
            <form:input path="contact" type="text" class="form-control"
              placeholder="Contact" style="width: 100%;"/>
          </div>
          <div><h5><label for="division">Division <font color="red">*</font></label> <br/>
            <small>Please input your division</small></h5>
            <form:select path="division" class="form-control"
              placeholder="Division" style="width: 100%;">
              <option value="" >-- Select --</option>
              <c:forEach items="${ divisions }" var="division">
              <form:option value="${ division.id }" label="${ division.name }" />
              </c:forEach>
            </form:select>
          </div>
          <div><h5><label for="district">District <font color="red">*</font></label> <br/>
            <small>Please input your district</small></h5>
            <form:input path="district" type="text" class="form-control"
              placeholder="District" style="width: 100%;"/>
          </div>
          <div><h5><label for="locale">Locale <font color="red">*</font></label> <br/>
            <small>Please input your locale</small></h5>
            <form:input path="locale" type="text" class="form-control"
              placeholder="Locale" style="width: 100%;"/>

          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-sm-offset-4 col-sm-4 form-group ui-widget" >
      <div class="panel panel-primary">
        <div class="panel-heading">Products</div>
        <div class="panel-body">
          <c:forEach items="${ products }" var="product" varStatus="status">
          <div><h5><label for="productOrders[${status.index}].quantity"><c:out value="${ product.name }"/></label></h5>
            <form:input type="text" path="productOrders[${status.index}].quantity"
              class="form-control" placeholder="Quantity" style="width: 100%;"/>
            <form:input type="hidden" path="productOrders[${status.index}].id" />
            <input type="hidden"
              id="productOrders[${status.index}].productId"
              name="productOrders[${status.index}].productId"
              value="${ product.id }"  />
          </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-sm-offset-4 col-sm-4 form-group ui-widget" >
      <div class="panel panel-primary">
        <div class="panel-heading">Transact Information</div>
        <div class="panel-body">
          <div><h5><label for="pickupPurchaseRemitBy">Pickup, Purchase, or Remit By <font color="red">*</font></label> <br/>
            <small>Full Name of the Person who was sent to the transaction</small></h5>
            <form:input path="pickupPurchaseRemitBy" type="text" class="form-control"
              placeholder="Pickup, Purchase, or Remit By" style="width: 100%;"/>
          </div>
          <div><h5><label for="contactNo">Contact No. <font color="red">*</font></label> <br/>
            <small>Contact of the Person who will transact</small></h5>
            <form:input path="contactNo" type="text" class="form-control"
              placeholder="Contact No." style="width: 100%;"/>
          </div>

        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-sm-offset-4 col-sm-4 ">
      <input type="submit" value="Submit" class="btn btn-primary" style="width: 100%;"/>
    </div>
  </div>
</form:form>
<%@ include file="../common/footer.jsp" %>