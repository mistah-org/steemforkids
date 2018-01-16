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
  <form:form method="POST" modelAttribute="dashboardForm" class="form-horizontal">
    <div class="form-group">
      <label class="sr-only" for="startDate">Start Date</label>
      <div class="col-md-2 col-md-offset-4">
        <form:input path="startDate" type="month" class="form-control datepicker"
          id="startDate" placeholder="Target Month"/>
      </div>
      <!-- 
      <label class="sr-only" for="endDate">End Date</label>
      <form:input path="endDate" type="date" class="form-control datepicker"
        id="endDate" placeholder="End"/>
       -->
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

<spring:url value="/resources/highcharts/highcharts.js" var="highchartsJs" />
<spring:url value="/resources/highcharts/modules/data.js" var="dataJs" />
<spring:url value="/resources/highcharts/modules/drilldown.js" var="drilldownJs" />

<script src="${highchartsJs}"></script>
<script src="${dataJs}"></script>
<script src="${drilldownJs}"></script>

<script>
$(document).ready(function() {
  displayChart();
  $(".btn").on("click", function() {
    displayChart();
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
          displayActualChart(form, xCategories);
        },
        error: function() { 
          alert('error displayChart'); 
        }
    });
  }
  
  function displayActualChart(form, xCategories) {
      var baseData = [];
      <c:url var="getdataUrl" value="/dashboard/${locale.id}/basic_column/get_series_data"/>
      $.ajax({
          dataType: "json", 
          url: '${ getdataUrl }', 
          data: form.serialize(),
          success: function(json) {
            baseData = json.content;

            $('#collections').highcharts({
              chart : {
                type : 'column'
              },
              title : {
                text : 'Collections Vs Expenses'
              },
              xAxis: {
                categories: xCategories,
                crosshair: true
              },
              yAxis: {
                allowDecimals: false,
                min: 0,
                title: {
                    text: 'JPY'
                }
              },
              tooltip: {
                formatter: function () {
                    return '<b>' + this.x + '</b><br/>' +
                        this.series.name + ': ' + this.y;
                }
              },
              plotOptions: {
                column: {
                  pointPadding: 0.2,
                  borderWidth: 0
                }
              },
              series : baseData
            });
          },
          error: function() { 
            alert('error displayActualChart'); 
          }
      });
  }
    
});
</script>
<%@ include file="../common/footer.jsp" %>