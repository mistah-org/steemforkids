<%@ include file="../common/header_top.jsp" %>

<title>Process Index</title>

<%@ include file="../common/header_bottom.jsp" %>

<spring:url value="/preference/notification" var="submitUrl" />
<form:form method="POST" modelAttribute="preference" action="${submitUrl}">
  <div class="form-group row">
    <div class="col-sm-12">
      <div class="form-check">
        <label class="form-check-label" for="commitmentNotification">
          <form:checkbox path="enableNotification" class="form-check-input" /> Commitment Notification
        </label>
      </div>
    </div>
  </div>
  <div class="form-group row">
    <div class="col-sm-12">
      <input type="submit" value="Submit" class="btn btn-primary" />
    </div>
  </div>
</form:form>
<%@ include file="../common/footer.jsp" %>