<%@ include file="../../common/header_top.jsp" %>

<title>Product</title>

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

<%@ include file="../../common/header_bottom.jsp" %>
<spring:url value="/admin/product/delete" var="url" />
<form name="delete-form" class="form-inline" method="POST" action="${url}">

  <div class="row">
    <div class="col-md-12" id="no-more-tables">
      <!-- Table -->
      <table class="table" id="collections-table">
        <thead>
        <tr>
          <th>Id</th>
          <th>Name</th>
          <th>Brand</th>
          <th>Price</th>
          <th>Action</th>
        </tr>
        </thead>
        <tbody>
          <c:forEach items="${ products }" var="product">
          <tr>
            <td data-title="Id"><c:out value="${ product.id }"/></td>
            <td data-title="Name"><c:out value="${ product.name }"/></td>
            <td data-title="Brand"><c:out value="${ product.brand.companyName }"/></td>
            <td data-title="Price"><fmt:formatNumber type="CURRENCY"
                currencyCode="${ product.currency }"
                value="${ product.price }" /></td>
            <td data-title="Action">
              <spring:url value="/admin/product/${product.id}/edit" var="editUrl" />
              <a href="${ editUrl }">
                <i class="pe-7s-note pe-lg" ></i>
              </a>

              <a href="javascript:void(0);" onclick="deleteProduct('${product.id}')">
                <i class="pe-7s-trash pe-lg" ></i>
              </a>
            </td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
  <div class="row" style="margin-top: 10px;">
    <div class="col-sm-12 form-group ui-widget" >
      <spring:url value="/admin/product/new" var="newUrl" />
      <a href="${ newUrl }" class="btn btn-primary">Add Product</a>
    </div>
  </div>
  <input type="hidden" id="productId" name="productId" value="${ product.id }"/>
  <script>
  function deleteProduct(id) {
    var action = document.forms[0].action;
    document.forms[0].productId.value = id;
    document.forms[0].submit();
  }
  </script>
</form>
<%@ include file="../../common/footer.jsp" %>