<%@ include file="../common/header_top.jsp" %>
<title>Expenses</title>

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
      <div id="no-more-tables">
        <!-- Table -->
        <table class="table">
          <thead>
          <tr>
            <th>Description</th>
            <th>Date of Collection</th>
            <th>Amount</th>
          </tr>
          </thead>
          <tbody>
            <c:forEach items="${ contributions }" var="contribution">
            <tr>
              <td data-title="Description"><c:out value="${contribution.type.description}" /></td>
              <td data-title="Date of Collection"><fmt:formatDate type="date" value="${contribution.transactionDate}" /></td>
              <td data-title="Amount"><fmt:formatNumber type="CURRENCY" value="${contribution.amount}" /></td>
            </tr>
            </c:forEach>
            <tr>
              <td data-title="Total"><b>Total</b></td>
              <td data-title="Amount"><b><fmt:formatNumber type="CURRENCY" value="${total}" /></b></td>
            </tr>
          </tbody>
        </table>
      </div>
<%@ include file="../common/footer.jsp" %>