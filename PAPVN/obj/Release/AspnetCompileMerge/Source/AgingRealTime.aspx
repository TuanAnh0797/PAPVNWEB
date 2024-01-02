<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgingRealTime.aspx.cs" Inherits="PAPVN.UrtFormHis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../../plugins/chart.js/Chart.min.js"></script>
    <div class="content-header" style="padding: 5px;">
        <h1 style="margin:0px 0px 0px 20px; font-weight:500">Aging/Final Check</h1>
    </div>
    <div class="content" style="margin: 0px 0px 0px 0px;">
        <div class="container-fluid">
            <div class="row" style="margin: 10px 0px 0px 0px">
                <div class="chart col-sm-6" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h4 style="font-weight: 600">Biểu đồ tỉ lệ OK/NG</h4>
                        </div>
                        <div class="chart-container">
                            <canvas id="pieChart" style="min-height: 350px; height: 100%"></canvas>
                        </div>
                    </div>

                </div>
                <div class="chart col-sm-6" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h4 style="font-weight: 600">Biểu đồ số lượng tủ OK/NG/PENDING</h4>
                        </div>
                        <div class="chart-container">
                            <canvas id="stackedBarChart" style="min-height: 350px; height: 100%"></canvas>
                        </div>
                    </div>

                </div>
                <div class="chart col-sm-6" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h4 style="font-weight: 600">Biểu đồ số lượng tủ Pending từng công đoạn</h4>
                        </div>
                        <div class="chart-container">
                            <canvas id="barChartpending" style="min-height: 350px;"></canvas>

                        </div>
                    </div>

                </div>
                <div class="chart col-sm-6" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h4 style="font-weight: 600">Biểu đồ số lượng tủ NG từng công đoạn</h4>
                        </div>
                        <div class="chart-container">
                            <canvas id="barChartng" style="min-height: 350px;"></canvas>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
    <script>


        //Pie chart
        var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
        var pieOptions = {
            maintainAspectRatio: false,
            responsive: true,
        }
        var donutData = {
            labels: [
                'OK',
                'NG'

            ],
            datasets: [
                {
                    data: [],
                    backgroundColor: ['#008000', '#FF0000'],
                }
            ]
        }
        var charpie = new Chart(pieChartCanvas, {
            type: 'pie',
            data: donutData,
            options: pieOptions
        })
        //Barchar Pending
        var barChartCanvas = $('#barChartpending').get(0).getContext('2d')
        var datachartPending = {
            labels: ['VP', 'GAS', 'WI1(W)', 'WI1(S)', 'IP', 'DF', 'TEMP', 'IOT', 'WI2', 'PAN', 'CAM B', 'CAM F'],
            datasets: [
                {
                    label: 'PENDING',
                    backgroundColor: '#FFD700',
                    borderColor: 'rgba(60,141,188,0.8)',
                    pointRadius: false,
                    pointColor: '#3b8bba',
                    pointStrokeColor: 'rgba(00,80,00,1)',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(60,141,188,1)',
                    data: []
                },

            ]

        }
        var barChartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            datasetFill: false
        }
        var barchartpending = new Chart(barChartCanvas, {
            type: 'bar',
            data: datachartPending,
            options: barChartOptions
        })
        // Barchart NG
        var barChartCanvas = $('#barChartng').get(0).getContext('2d')
        var datachartNG = {
            labels: ['VP', 'GAS', 'WI1(W)', 'WI1(S)', 'IP', 'DF', 'TEMP', 'IOT', 'WI2', 'PAN', 'CAM B', 'CAM F'],
            datasets: [
                {
                    label: 'NG',
                    backgroundColor: '#FF0000',
                    borderColor: 'rgba(60,141,188,0.8)',
                    pointRadius: false,
                    pointColor: '#3b8bba',
                    pointStrokeColor: 'rgba(00,80,00,1)',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(60,141,188,1)',
                    data: []
                },

            ]

        }
        var barChartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            datasetFill: false
        }

        var barcharng = new Chart(barChartCanvas, {
            type: 'bar',
            data: datachartNG,
            options: barChartOptions
        })
        // Stackbarchar OK NG PEnding

        var stackedBarChartCanvas = $('#stackedBarChart').get(0).getContext('2d')
        var dattachartOKNGPending = {
            labels: ['VP', 'GAS', 'WI1(W)', 'WI1(S)', 'IP', 'DF', 'TEMP', 'IOT', 'WI2', 'PAN', 'CAM B', 'CAM F'],
            datasets: [
                {
                    label: 'OK',
                    backgroundColor: '#008000',
                    borderColor: 'rgba(60,141,188,0.8)',
                    pointRadius: false,
                    pointColor: '#3b8bba',
                    pointStrokeColor: 'rgba(00,80,00,1)',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(60,141,188,1)',
                    data: []
                },
                {
                    label: 'NG',
                    backgroundColor: '#FF0000',
                    borderColor: 'rgba(210, 214, 222, 1)',
                    pointRadius: false,
                    pointColor: 'rgba(210, 214, 222, 1)',
                    pointStrokeColor: '#c1c7d1',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(220,220,220,1)',
                    data: []
                },
                {
                    label: 'PENDING',
                    backgroundColor: '#FFD700',
                    borderColor: 'rgba(210, 214, 222, 1)',
                    pointRadius: false,
                    pointColor: 'rgba(210, 214, 222, 1)',
                    pointStrokeColor: '#c1c7d1',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(220,220,220,1)',
                    data: []
                },
            ]
        }
        var stackedBarChartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                xAxes: [{
                    stacked: true,
                }],
                yAxes: [{
                    stacked: true
                }]
            }
        }

        var stackchart = new Chart(stackedBarChartCanvas, {
            type: 'bar',
            data: dattachartOKNGPending,
            options: stackedBarChartOptions
        })
        $(document).ready(function () {
            LoadDataForChart();
        });
        function LoadDataForChart() {
            var datetimefrom = $('#datefrom').val();
            var datetimeto = $('#dateto').val();
            $.ajax({
                type: 'POST',
                url: '/MyWebSercive.asmx/DataForLineChartRealTime',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (response) {
                    var data = JSON.parse(response.d);
                    donutData.datasets[0].data = data.Datapiechart;
                    datachartPending.datasets[0].data = data.datapending;
                    datachartNG.datasets[0].data = data.datang;
                    dattachartOKNGPending.datasets[0].data = data.dataok;
                    dattachartOKNGPending.datasets[1].data = data.datang;
                    dattachartOKNGPending.datasets[2].data = data.datapending;
                    charpie.update();
                    barchartpending.update();
                    barcharng.update();
                    stackchart.update();
                    //alert('ok');
                },
                error: function (xhr, status, error) {
                    alert(error)
                }
            });
        }
         setInterval(LoadDataForChart, 30000);
       
        //function labelFormatter(label, series) {
        //    return '<div style="font-size:13px; text-align:center; padding:2px;; color: #fff; font-weight: 600;">'
        //        + label
        //        + '<br>'
        //        + Math.round(series.percent) + '%</div>'
        //}

    </script>
</asp:Content>
