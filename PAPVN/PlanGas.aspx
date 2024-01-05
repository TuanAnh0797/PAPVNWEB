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
                        <h1 style="font-weight: 600">Biểu đồ sản lượng nạp GAS theo model</h1>
                    </div>
                    <div class="chart-container">
                        <canvas id="barchart" style="min-height: 580px;"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="chart col-sm-4" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px; margin: 0px 0px 0px 5px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h2 style="font-weight: 600">Biểu đồ tỉ lệ OK/NG nạp GAS</h2>
                        </div>
                        <div class="chart-container">
                            <canvas id="pieChart" style="min-height: 400px; height: 100%"></canvas>
                        </div>
                    </div>
                </div>
                <div class="chart col-sm-8" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px; margin: 0px 5px 0px 0px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h2 style="font-weight: 600">Biểu đồ tổng sản lượng nạp Gas</h2>
                        </div>
                        <div class="chart-container">
                            <canvas id="linechart" style="min-height: 400px;"></canvas>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {
            //Line Chart
            var pieChartCanvas = $('#linechart').get(0).getContext('2d')
            var DataLineChart = {
                labels: ['1', '2', '3', '4', '5','6','7','8','9','10','11','12'],
                datasets: [
                    {
                        label: 'Plan',
                        borderColor: 'rgb(75, 192, 192)',
                        data: [10,20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120],
                        fill: false,
                    },
                     {
                        label: 'Actual',
                         borderColor: '#b38600',
                        data: [6, 21, 30, 35, 45, 51, 65, 82, 94, 102, 115, 120],
                        fill: false,
                    }
                ]
            };
            var LineChartOption =
            {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    x: {
                        type: 'category',

                    },
                    y: {
                        beginAtZero: true,
                    }
                },
                plugins: {
                    legend: {
                        display: true,
                        position: 'bottom',
                    },
                }

            };
            var charpie = new Chart(pieChartCanvas, {
                type: 'line',
                data: DataLineChart,
                options: LineChartOption
            })

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
                        data: [98, 2],
                        backgroundColor: ['#008000', '#FF0000'],
                    }
                ]
            }
            var charpie = new Chart(pieChartCanvas, {
                type: 'pie',
                data: donutData,
                options: pieOptions
            })

            //



            var barChartOptions = {
                responsive: true,
                maintainAspectRatio: false,
                datasetFill: false,
                scales: {
                    xAxes: [{
                        ticks: {
                            fontSize: 20
                        },
                        gridLines: {
                            display: false
                        },
                        stacked: true,

                    }],
                    yAxes: [{
                        ticks: {
                            fontSize: 20,
                            beginAtZero: true,
                            max: 900
                        },


                    }],

                },
                legend: {
                    position: 'bottom',
                    labels: {
                        fontSize: 15,
                    },

                },
                animation: {
                    duration: 1,
                    onComplete: function () {
                        var chartInstance = this.chart,
                            ctx = chartInstance.ctx;
                        ctx.font = "500 18px Arial"; // Đặt kích thước chữ là 20px và font là Arial
                        ctx.fillStyle = '#000000'; // Đặt màu chữ là đen

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
                }
            }
            var barChartCanvas = $('#barchart').get(0).getContext('2d')
            var dataPlan = Array.from({ length: 24 }, () => Math.floor(Math.random() * (800 - 500 + 1)) + 500);
            var dataPlanHour = Array.from({ length: 24 }, () => Math.floor(Math.random() * (500 - 300 + 1)) + 300);
            var dataPlanActual = Array.from({ length: 24 }, () => Math.floor(Math.random() * (300 - 100 + 1)) + 100);
            var datachartNG = {
                labels: ['NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567'],
                datasets: [
                    {
                        type: 'bar',
                        label: 'Plan',
                        backgroundColor: '#248f24',
                        borderColor: '#000000',
                        pointRadius: false,
                        //pointColor: '#3b8bba',
                        //pointStrokeColor: 'rgba(00,80,00,1)',
                        //pointHighlightFill: '#fff',
                        //pointHighlightStroke: 'rgba(60,141,188,1)',
                        order: 2,
                        //stack: 'Stack 2',
                        data: dataPlan,


                    },


                    {
                        type: 'bar',
                        label: 'Plan/Time',
                        //'rgb(75, 192, 192)',
                        backgroundColor: '#ffff4d',
                        borderColor: '#000000',
                        pointRadius: false,
                        //pointColor: '#3b8bba',
                        //pointStrokeColor: 'rgba(00,80,00,1)',
                        //pointHighlightFill: '#fff',
                        //pointHighlightStroke: 'rgba(60,141,188,1)',
                        categoryPercentage: 0.5,
                        order: 1,
                        //stack: 'Stack 2',

                        data: dataPlanHour,


                    },

                    {
                        type: 'bar',
                        label: 'Actual',
                        backgroundColor: '#668cff',
                        borderColor: '#000000',
                        pointRadius: false,
                        //pointColor: '#3b8bba',
                        //pointStrokeColor: 'rgba(00,80,00,1)',
                        //pointHighlightFill: '#fff',
                        //pointHighlightStroke: 'rgba(60,141,188,1)',
                        order: 0,

                        categoryPercentage: 0.25,
                        //: 'Stack 1',
                        data: dataPlanActual,

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
