<%@ include file="../common/header_top.jsp" %>

<title>Expenses</title>

<%@ include file="../common/header_bottom.jsp" %>
<div class="row">
  <div id="collections" style="min-width: 310px; max-width: 600px; height: 400px; margin: 0 auto"></div>
</div>

<spring:url value="/resources/highcharts/highcharts.js" var="highchartsJs" />
<spring:url value="/resources/highcharts/modules/data.js" var="dataJs" />
<spring:url value="/resources/highcharts/modules/drilldown.js" var="drilldownJs" />

<script src="${highchartsJs}"></script>
<script src="${dataJs}"></script>
<script src="${drilldownJs}"></script>

<script>
$(function() {
  var baseData = [];
  var drilldownData = {};

  <c:url var="getDrilldownUrl" value="dashboard/get_drilldown_data_async"/>
  $.getJSON('${ getDrilldownUrl }', function(data) {
    console.log("drill down:");
    console.log(data);
    drilldownData = data;
  });

  <c:url var="getdataUrl" value="dashboard/get_series_data"/>
  $.getJSON( '${ getdataUrl }', function(json) {
    baseData = json.data;

    $('#collections').highcharts({
      chart : {
        type : 'pie',
        events : {
          drilldown : function(e) {
            if (!e.seriesOptions) {
              var chart = this;
              var drilldowns = drilldownData;
              var series = drilldowns[e.point.name];
              chart.addSeriesAsDrilldown(e.point, series);
            }
          }
        }
      },
      title : {
        text : 'Collections By Locale'
      },

      plotOptions : {
        pie : {
          allowPointSelect : true,
          cursor : 'pointer',
          dataLabels : {
            enabled : true,
            color : '#000000',
            connectorColor : '#000000',

          }
        }
      },
      series : [ {
          type : 'pie',
          name : 'Collections',
          data : baseData
      } ],
      drilldown: {
        series: []
      }
    });
  }).error(function() { console.log('error'); });
});
</script>
<%@ include file="../common/footer.jsp" %>