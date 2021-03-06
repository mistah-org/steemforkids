<%@ include file="../common/header_top.jsp" %>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>

<title>Locale Store Inventory</title>

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

  <div class="row">
    <div class="col-sm-12">
      <nav class="breadcrumb">
        <spring:url value="/inventory" var="indexUrl" />
        <a class="breadcrumb-item" href="${indexUrl}">Back</a>
      </nav>
    </div>
  </div>

  <div class="row">
    <div class="col-md-12" id="no-more-tables">
      <!-- Table -->
      <table class="table display compact" id="collections-table">
        <thead>
        <tr>
          <th>Locale</th>
          <th>Division</th>
          <th>District</th>
          <c:forEach items="${ products }" var="product" varStatus="status">
          <th><c:out value="${ product.value }"/></th>
          </c:forEach>
          <th>Action</th>
        </tr>
        </thead>
        <tbody>
          <c:forEach items="${ inventories }" var="inventory">
          <tr>
            <td data-title="Locale"><c:out value="${ inventory.locale }"/></td>
            <td data-title="Division"><c:out value="${ inventory.division }"/></td>
            <td data-title="District"><c:out value="${ inventory.district }"/></td>
            <c:forEach items="${ products }" var="product" varStatus="status">
            <td data-title="${ product.value }"
                class="text-center"><c:out value="${ inventory.productInventoryMap[product.key] }"/></td>
            </c:forEach>
            <td data-title="Action">
              <spring:url value="/inventory/${ inventory.locale }/view" var="viewUrl" />
              <a href="${ viewUrl }" class="btn btn-info btn-block">View</a>
            </td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</form>

  <script>
  $(document).ready( function () {
      $('#collections-table').dataTable({
          "pageLength": 10
      });
  } );
  </script>
<%@ include file="../common/footer.jsp" %>