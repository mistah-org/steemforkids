<%@ include file="../common/header_top.jsp" %>

<title>Locale Store Form Data Upload</title>

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

  <script>
    $(document).ready(function () {
      var
        filters = {
          type: null,
          person: null,
          collect: null
        };

      function updateFilters() {
        $('.collection-row').hide().filter(function () {
          var
            self = $(this),
            result = true; // not guilty until proven guilty

          Object.keys(filters).forEach(function (filter) {
            if (filters[filter]) {
              result = result && (self.data(filter).toUpperCase().indexOf(filters[filter].toUpperCase()) > -1);
            }
          });

          return result;
        }).show();
      }

      function bindDropdownFilters() {
        Object.keys(filters).forEach(function (filterName) {
          $('#' + filterName + "-filter").on('keyup', function () {
            filters[filterName] = this.value;
            updateFilters();
          });
        });
      }

      bindDropdownFilters();
    });
  </script>

<%@ include file="../common/header_bottom.jsp" %>
  <div class="row">
    <div class="col-sm-12">
      <nav class="breadcrumb">
        <spring:url value="/locale_store_form" var="indexUrl" />
        <a class="breadcrumb-item" href="${indexUrl}">Back</a>
      </nav>
    </div>
  </div>


  <div class="row">
    <div class="col-md-12">
      <h3>Upload File Columns and Format</h3>
    </div>
  </div>

  <div class="row">
    <div class="col-md-12" id="no-more-tables">
      <!-- Table -->
      <table class="table" id="collections-table">
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

        </tr>
        </thead>
        <tbody>
          <tr>
            <td data-title="Form No.">Date</td>
            <td data-title="Type Of Form">ORDER, PURCHASE, or REMITTANCE</td>
            <td data-title="Transaction Date">yyyy-MM-dd</td>
            <td data-title="Transact By">Name</td>
            <td data-title="Contact">Mobile Number</td>
            <td data-title="Division">Division name</td>
            <td data-title="District">District name</td>
            <td data-title="Locale">Locale name</td>

            <td data-title="Pickup, Purchase, or Remit By">Name</td>
            <td data-title="Contact No.">Mobile Number</td>

          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN')">
  <div class="row">
    <div class="col-md-12">
      <!-- Table -->
      <table class="table">
        <tr>
          <td colspan="2">
            <spring:url value="/locale_store_form/data_upload" var="uploadUrl" />
            <form:form modelAttribute="fileuploadForm" action="${ uploadUrl }" method="POST" enctype="multipart/form-data">
              <label for="file">File</label>
              <input name="file" id="file" type="file" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" />
              <p><button type="submit" class="btn btn-primary" >Upload</button></p>
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form:form>
          </td>
        </tr>
      </table>
    </div>
  </div>
  </sec:authorize>
<%@ include file="../common/footer.jsp" %>