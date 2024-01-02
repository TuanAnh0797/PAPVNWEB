<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PlanGas.aspx.cs" Inherits="PAPVN.RealTimePlan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
<%--     <div class="content-header" style="padding: 5px;">
        <h1 style="margin:0px 0px 0px 20px; font-weight:500">Management Plan/Real Time</h1>
    </div>--%>
    <div class="content" style="margin: 0px 0px 0px 0px;">
        <div class="container-fluid">
                <div class="chart" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h1 style="font-weight: 600">Biểu đồ sản lượng Công đoạn GAS</h1>
                        </div>
                        <div class="chart-container">
                            <canvas id="barchart" style="min-height: 800px;"></canvas>
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
                       label: 'Plan',
                       backgroundColor: '#0000FF',
                       borderColor: 'rgba(60,141,188,0.8)',
                       pointRadius: false,
                       pointColor: '#3b8bba',
                       pointStrokeColor: 'rgba(00,80,00,1)',
                       pointHighlightFill: '#fff',
                       pointHighlightStroke: 'rgba(60,141,188,1)',
                       data: [100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 1000]
                   },
                   {
                       label: 'Actual',
                       backgroundColor: '#008000',
                       borderColor: 'rgba(60,141,188,0.8)',
                       pointRadius: false,
                       pointColor: '#3b8bba',
                       pointStrokeColor: 'rgba(00,80,00,1)',
                       pointHighlightFill: '#fff',
                       pointHighlightStroke: 'rgba(60,141,188,1)',
                       data: [100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 50, 100, 500]

                   },

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
