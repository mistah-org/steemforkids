<%@ include file="../common/header_top.jsp" %>
<style>
.col-md-12 column {  
   text-align:center;
}
.col-md-12 column form {
   display:inline-block;
}
</style>

<title>Expenses</title>

<%@ include file="../common/header_bottom.jsp" %>
<div>
    <spring:url value="/locale_account/${locale.id}/expense/new" var="submitUrl" />
    <form:form method="POST" modelAttribute="dashboardForm" action="${submitUrl}" class="form-inline">
      <div class="form-group">
        <label class="sr-only" for="startDate">Start Date</label>
        <form:input path="startDate" type="date" class="form-control datepicker"
          id="startDate" placeholder="Start"/>
      </div>
      <div class="form-group">
        <label class="sr-only" for="endDate">End Date</label>
        <form:input path="endDate" type="date" class="form-control datepicker"
          id="endDate" placeholder="End"/>
      </div>
      <input type="button" value="Create" class="btn" />
    </form:form>
</div>
<div id="collections" style="min-width: 310px; max-width: 600px; height: 400px; margin: 0 auto"></div>

<spring:url value="/resources/highcharts/highcharts.js" var="highchartsJs" />
<spring:url value="/resources/highcharts/modules/data.js" var="dataJs" />
<spring:url value="/resources/highcharts/modules/drilldown.js" var="drilldownJs" />

<script src="${highchartsJs}"></script>
<script src="${dataJs}"></script>
<script src="${drilldownJs}"></script>

<script>
$(document).ready(function() {
  //$( ".datepicker" ).datepicker();
  
  $(".btn").on("click", function() {
    var form = $(this).parents('form:first');

    var baseData = [];
    var xCategories = [];
    <c:forEach items="${months}" var="category">
      xCategories.push("<c:out value="${category}" />");
    </c:forEach>
    
    <c:url var="getdataUrl" value="${locale.id}/collection_vs_expense/get_series_data"/>
    $.ajax({
        dataType: "json", 
        url: '${ getdataUrl }', 
        data: form.serialize(),
        success: function(json) {
          baseData = json.data;
  
          $('#collections').highcharts({
            chart : {
              type : 'column'
            },
            title : {
              text : 'Collections Vs Expenses'
            },
            xAxis: {
              categories: xCategories
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
                      this.series.name + ': ' + this.y + '<br/>' +
                      'Total: ' + this.point.stackTotal;
              }
            },
            plotOptions: {
              column: {
                  stacking: 'normal'
              }
            },
            
            series : baseData
          });
        },
        error: function() { 
          console.log('error'); 
        }
    });
    
  });
});
</script>
<%@ include file="../common/footer.jsp" %>