<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PlanGas.aspx.cs" Inherits="PAPVN.RealTimePlan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
<%--     <div class="content-header" style="padding: 5px;">
        <h1 style="margin:0px 0px 0px 20px; font-weight:150">Management Plan/Real Time</h1>
    </div>--%>
    <div class="content" style="margin: 0px 0px 0px 0px;">
        <div class="container-fluid">
                <div class="chart" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h1 style="font-weight: 600">Biểu đồ sản lượng Công đoạn GAS</h1>
                        </div>
                        <div class="chart-container">
                            <canvas id="barchart" style="min-height: 500px;"></canvas>
                        </div>
                    </div>
                </div>
        </div>
         <div class="container-fluid">
                <div class="chart" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h1 style="font-weight: 600">Biểu đồ sản lượng Công đoạn GAS</h1>
                        </div>
                        <div class="chart-container">
                            <canvas id="barchart1" style="min-height: 500px;"></canvas>
                        </div>
                    </div>
                </div>
        </div>
    </div>
   <script>


       // Barchart NG
      
       $(document).ready(function () {
           var barChartOptions = {
               responsive: true,
               maintainAspectRatio: false,
               datasetFill: false,
               animation: {
                   duration: 1,
                   onComplete: function () {
                       var chartInstance = this.chart,
                           ctx = chartInstance.ctx;
                       ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
                       ctx.textAlign = 'center';
                       ctx.textBaseline = 'bottom';

                       this.data.datasets.forEach(function (dataset, i) {
                           var meta = chartInstance.controller.getDatasetMeta(i);
                           meta.data.forEach(function (bar, index) {
                               var data = dataset.data[index];
                               ctx.fillText(data, bar._model.x, bar._model.y - 5);
                           });
                       });
                   }
               },
               scales: {
                   xAxes: [{
                       ticks: {
                           fontSize: 20
                       }
                   }],
                   yAxes: [{
                       ticks: {
                           fontSize: 20,
                           beginAtZero: true
                       },
                      
                   }],
                 
               },
               legend: {
                   position: 'top',
                   labels: {
                       fontSize: 20,
                   }
               },
           }
           var barChartCanvas = $('#barchart').get(0).getContext('2d')
           var datachartNG = {
               labels: ['NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'ToTal'],
               datasets: [
                    {
                       type: 'line',
                       label: 'Monthly Sales',
                       borderColor: 'rgb(75, 192, 192)',
                       data: [800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800],
                       fill: false,
                       //yAxisID: 'y2'
                   },
                   {
                       type: 'bar',
                       label: 'Plan',
                       backgroundColor: '#0000FF',
                       borderColor: 'rgba(60,141,188,0.8)',
                       pointRadius: false,
                       pointColor: '#3b8bba',
                       pointStrokeColor: 'rgba(00,80,00,1)',
                       pointHighlightFill: '#fff',
                       pointHighlightStroke: 'rgba(60,141,188,1)',
                       data: [100, 15, 100, 15, 100, 15, 100, 15, 100, 15, 100, 15, 100, 15, 100, 15, 100, 15, 100, 15, 100, 15, 100, 15, 100, 15, 100, 15, 100, 15, 100, 1000],
                      // yAxisID: 'y1'
                   },
                   {
                       type: 'bar',
                       label: 'Plan/Time',
                       backgroundColor: '#008000',
                       borderColor: 'rgba(60,141,188,0.8)',
                       pointRadius: false,
                       pointColor: '#3b8bba',
                       pointStrokeColor: 'rgba(00,80,00,1)',
                       pointHighlightFill: '#fff',
                       pointHighlightStroke: 'rgba(60,141,188,1)',
                       data: [80, 30, 80, 30, 80, 30, 80, 30, 80, 30, 80, 30, 80, 30, 80, 30, 80, 30, 80, 30, 80, 30, 80, 30, 80, 30, 80, 30, 80, 30, 80, 300],
                      // yAxisID: 'y1'
                   },
                   //{
                   //    label: 'Actual',
                   //    backgroundColor: '#FFFF00',
                   //    borderColor: 'rgba(60,141,188,0.8)',
                   //    pointRadius: false,
                   //    pointColor: '#3b8bba',
                   //    pointStrokeColor: 'rgba(00,80,00,1)',
                   //    pointHighlightFill: '#fff',
                   //    pointHighlightStroke: 'rgba(60,141,188,1)',
                   //    data: [60, 15, 60, 15, 60, 15, 60, 15, 60, 15, 60, 15, 60, 15, 60, 15, 60, 15, 60, 15, 60, 15, 60, 15, 60, 15, 60, 15, 60, 15, 60, 150]

                   //},
                   //{
                   //    type: 'line',
                   //    label: 'Monthly Sales',
                   //    borderColor: 'rgb(75, 192, 192)',
                   //    data: [800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800],
                   //    fill: false,
                   //    //yAxisID: 'y2'
                   //},

               ]

           }


           var barcharng = new Chart(barChartCanvas, {
               type: 'bar',
               data: datachartNG,
               options: barChartOptions
           })
       });
       //$(document).ready(function () {
       //    LoadDataForChart();
       //});
       //function LoadDataForChart() {
       //    var datetimefrom = $('#datefrom').val();
       //    var datetimeto = $('#dateto').val();
       //    $.ajax({
       //        type: 'POST',
       //        url: '/MyWebSercive.asmx/DataForLineChartRealTime',
       //        contentType: 'application/json; charset=utf-8',
       //        dataType: 'json',
       //        success: function (response) {
       //            var data = JSON.parse(response.d);
       //            donutData.datasets[0].data = data.Datapiechart;
       //            datachartPending.datasets[0].data = data.datapending;
       //            datachartNG.datasets[0].data = data.datang;
       //            dattachartOKNGPending.datasets[0].data = data.dataok;
       //            dattachartOKNGPending.datasets[1].data = data.datang;
       //            dattachartOKNGPending.datasets[2].data = data.datapending;
       //            charpie.update();
       //            barchartpending.update();
       //            barcharng.update();
       //            stackchart.update();
       //            //alert('ok');
       //        },
       //        error: function (xhr, status, error) {
       //            alert(error)
       //        }
       //    });
       //}
       //setInterval(LoadDataForChart, 30000);


   </script>
</asp:Content>
