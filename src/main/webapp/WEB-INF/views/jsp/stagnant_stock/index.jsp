<%@ include file="../common/header_top.jsp" %>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>

<title>Locale Store Form</title>

  <style>
    * {
      margin: 0;
      padding: 0;
    }
    body {
      font: 14px/1.4 Georgia, Serif;
    }
    #page-wrap {
      margin: 50px;
    }
    p {
      margin: 20px 0;
    }

      /*
      Generic Styling, for Desktops/Laptops
      */
      table {
        width: 100%;
        border-collapse: collapse;
      }
      /* Zebra striping */
      tr:nth-of-type(odd) {
        background: #eee;
      }
      th {
        background: #333;
        color: white;
        font-weight: bold;
      }
      td, th {
        padding: 6px;
        border: 1px solid #ccc;
        text-align: left;
      }
  </style>

  <!--[if !IE]><!-->
  <style>

  /*
  Max width before this PARTICULAR table gets nasty
  This query will take effect for any screen smaller than 760px
  and also iPads specifically.
  */
  @media
  only screen and (max-width: 760px),
  (min-device-width: 768px) and (max-device-width: 1024px)  {

    /* Force table to not be like tables anymore */
    #no-more-tables table,
    #no-more-tables thead,
    #no-more-tables tbody,
    #no-more-tables th,
    #no-more-tables td,
    #no-more-tables tr {
      display: block;
    }

    /* Hide table headers (but not display: none;, for accessibility) */
    #no-more-tables thead tr {
      position: absolute;
      top: -9999px;
      left: -9999px;
    }

    #no-more-tables tr { border: 1px solid #ccc; }

    #no-more-tables td {
      /* Behave  like a "row" */
      border: none;
      border-bottom: 1px solid #eee;
      position: relative;
      padding-left: 50%;
      white-space: normal;
      text-align:left;
    }

    #no-more-tables td:before {
      /* Now like a table header */
      position: absolute;
      /* Top/left values mimic padding */
      top: 6px;
      left: 6px;
      width: 45%;
      padding-right: 10px;
      white-space: nowrap;
      text-align:left;
    }

    /*
    Label the data
    */
    #no-more-tables td:before { content: attr(data-title); }
  }

  /* Smartphones (portrait and landscape) ----------- */
  @media only screen
  and (min-device-width : 320px)
  and (max-device-width : 480px) {
    body {
      padding: 0;
      margin: 0;
      width: 320px; }
    }

  /* iPads (portrait and landscape) ----------- */
  @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) {
    body {
      width: 495px;
    }
  }

  </style>
  <!--<![endif]-->

<%@ include file="../common/header_bottom.jsp" %>
<c:if test="${ param.success == 'true'}">
<div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Form submitted.</strong> Thanks be to God!
</div>
</c:if>

<spring:url value="/locale_store_form" var="url" />
<form name="delete-form" class="form-inline" method="POST" action="${url}">
  <div class="row" style="margin-top: 10px;">
    <div class="col-sm-12" >
      <div class="panel panel-info">
        <div class="panel-heading">
          <h3 class="panel-title">For Bulk Data</h3>
        </div>
        <div class="panel-body">
          <spring:url value="/locale_store_form/data_upload" var="uploadUrl" />
          <a href="${ uploadUrl }" class="btn btn-primary">Go To Upload Page</a>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-md-12" id="no-more-tables">
      <!-- Table -->
      <table class="table display compact" id="collections-table">
        <thead>
        <tr>
          <th>Timestamp</th>
          <th>Form Type</th>

          <th>Transact Date</th>
          <th>Transact By</th>
          <th>Contact</th>
          <th>Division</th>
          <th>District</th>
          <th>Locale</th>

          <th>Pickup, Purchase, or Remit By</th>
          <th>Contact No.</th>

          <th>Status</th>
          <th>Action</th>

        </tr>
        </thead>
        <tbody>
          <c:forEach items="${ lsForms }" var="lsForm">
          <tr>
            <td data-title="Form No.">
              <fmt:formatDate value="${ lsForm.id.date }" pattern="yyyy/MM/dd hh:mm:ss.SSS"/></td>
            <td data-title="Type Of Form">
              <c:out value="${ lsForm.formType }"/></td>
            <td data-title="Transaction Date">
              <fmt:formatDate value="${ lsForm.transactionDate }"
                pattern="yyyy-MM-dd" /></td>
            <td data-title="Transact By">
              <c:out value="${ lsForm.transactBy }"/></td>
            <td data-title="Contact">
              <fmt:formatNumber value="${ lsForm.contact }"
                maxIntegerDigits="11" groupingUsed="false" /></td>
            <td data-title="Division">
              <c:out value="${ lsForm.division }"/></td>
            <td data-title="District">
              <c:out value="${ lsForm.district }"/></td>
            <td data-title="Locale">
              <c:out value="${ lsForm.locale }"/></td>

            <td data-title="Pickup, Purchase, or Remit By">
              <c:out value="${ lsForm.pickupPurchaseRemitBy }"/></td>
            <td data-title="Contact No.">
              <fmt:formatNumber value="${ lsForm.contactNo }"
                maxIntegerDigits="11" groupingUsed="false" /></td>

            <td data-title="Status">
              <c:out value="${ lsForm.status }"/></td>

            <td data-title="Action">
                <div class="form-inline" >
                  <spring:url value="/locale_store_form/${ lsForm.id }/view" var="newUrl" />
                  <a href="${ newUrl }" class="btn btn-info btn-block">View</a>
                  <c:if test="${ lsForm.status == 'OPEN' }">
                    <spring:url value="/locale_store_form/${ lsForm.id }/edit" var="editUrl" />
                    <a href="${ editUrl }" class="btn btn-danger btn-block">Edit</a>
                    <a href="javascript:void(0);" onclick="doAction('${lsForm.id}', 'confirm')"
                      class="btn btn-primary btn-block">Confirm</a>
                    <a href="javascript:void(0);" onclick="doAction('${lsForm.id}', 'cancel')"
                      class="btn btn-primary btn-block">Cancel</a>
                  </c:if>
                </div>
            </td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
  <div class="row" style="margin-top: 10px;">
    <div class="col-sm-12 form-group ui-widget" >
      <spring:url value="/locale_store_form/new" var="newUrl" />
      <a href="${ newUrl }" class="btn btn-primary">New Form</a>
    </div>
  </div>
  <input type="hidden" id="itemId" name="itemId" value=""/>
  <script>
  function doAction(id, action) {
      <spring:url value="/locale_store_form/" var="actionUrl" />
      document.forms[0].action = '${ actionUrl }' + action;

      document.forms[0].itemId.value = id;
      document.forms[0].submit();
    }
  </script>
  <script>
  $(document).ready( function () {
      $('#collections-table').dataTable({
          "pageLength": 10
      });
  } );
  </script>
</form>
<%@ include file="../common/footer.jsp" %>