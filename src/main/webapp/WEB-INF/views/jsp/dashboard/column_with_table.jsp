<%@ include file="../common/header_top.jsp" %>
<style>
.col-md-12 column {  
   text-align:center;
}
.col-md-12 column form {
   display:inline-block;
}
</style>

<title>Dashboard</title>

<%@ include file="../common/header_bottom.jsp" %>
<div class="row">
  <spring:url value="/dashboard/${locale.id}/column_with_table" var="submitUrl" />
  <form:form method="POST" modelAttribute="dashboardForm" class="form-horizontal" action="${submitUrl}">
    <div class="form-group">
      <label class="sr-only" for="startDate">Start Date</label>
      <div class="col-md-2 col-md-offset-5">
        <form:input path="startDate" type="month" class="form-control datepicker"
          id="startDate" placeholder="Start Month"/>
      </div>
      <label class="sr-only" for="startDate">Start Date</label>
      <div class="col-md-1">
        <select id="months" name="months" class="form-control">
            <c:forEach var="i" begin="3" end="12" >
            <option value="${ i }">${ i }</option>
            </c:forEach>
        </select>
      </div>
      <div class="col-md-2">
        <input type="button" value="Refresh" class="btn btn-primary btn-block" />
      </div>
    </div>
  </form:form>
</div>
<div class="row">
  <div class="col-md-12">
    <div id="collections" style="min-width: 310px; max-width: 600px; height: 400px; margin: 0 auto"></div>
  </div>
</div>
<div class="row">
  <div class="col-md-12">
    <table class="table" id="datatable">
      <thead>
        <tr>
          <th></th>
          <c:forEach items="${ columnHeaders }" var="columnHeader">
          <th>${ columnHeader }</th>
          </c:forEach>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${ monthlyBeans }" var="monthlyBean">
        <tr>
          <th><c:out value="${ monthlyBean.description }"/></th>
          <td><c:out value="${ monthlyBean.collectionAmt }"/></td>
          <td><c:out value="${ monthlyBean.expenseAmt }"/></td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>

<spring:url value="/resources/highcharts/highcharts.js" var="highchartsJs" />
<spring:url value="/resources/highcharts/modules/data.js" var="dataJs" />
<spring:url value="/resources/highcharts/modules/drilldown.js" var="drilldownJs" />

<script src="${highchartsJs}"></script>
<script src="${dataJs}"></script>
<script src="${drilldownJs}"></script>

<script>
$(document).ready(function() {
  //displayChart();
  $('#collections').highcharts({
              data: {
                  table: 'datatable'
              },
              chart: {
                  type: 'column'
              },
              title: {
                  text: 'Collection VS Expenses'
              },
              yAxis: {
                  allowDecimals: false,
                  title: {
                      text: 'Units'
                  }
              },
              tooltip: {
                  formatter: function () {
                      return '<b>' + this.series.name + '</b><br/>' +
                          this.point.y + ' ' + this.point.name.toLowerCase();
                  }
              }
            });
  
  $(".btn").on("click", function() {
    //displayChart();
    var startDate = $("#startDate").val();
    var input = $("<input>")
               .attr("type", "hidden")
               .attr("name", "startDate").val(startDate);
    $('#dashboardForm').append($(input));
    $("#dashboardForm").submit(); 
  });
  
  function displayChart() {
    var form = $("#dashboardForm");
    var xCategories = [];
    <c:url var="getMonthsUrl" value="/dashboard/get_months"/>
      $.ajax({
        dataType: "json", 
        url: '${ getMonthsUrl }', 
        data: form.serialize(),
        success: function(json) {
          xCategories = json.months;
          console.log(xCategories);
          
          displayActualChart(form, xCategories);
        },
        error: function() { 
          console.log('error displayChart'); 
        }
    });
  }
  
  function displayActualChart(form, xCategories) {
      var baseData = [];
      <c:url var="getdataUrl" value="${locale.id}/basic_column/get_series_data"/>
      $.ajax({
          dataType: "json", 
          url: '${ getdataUrl }', 
          data: form.serialize(),
          success: function(json) {
            baseData = json.content;
            console.log(baseData);

            $('#collections').highcharts({
              data: {
                  table: 'datatable'
              },
              chart: {
                  type: 'column'
              },
              title: {
                  text: 'Collection VS Expenses'
              },
              yAxis: {
                  allowDecimals: false,
                  title: {
                      text: 'Units'
                  }
              },
              tooltip: {
                  formatter: function () {
                      return '<b>' + this.series.name + '</b><br/>' +
                          this.point.y + ' ' + this.point.name.toLowerCase();
                  }
              }
            });
            
          },
          error: function() { 
            console.log('error displayActualChart'); 
          }
      });
  }
    
});
</script>
<%@ include file="../common/footer.jsp" %>