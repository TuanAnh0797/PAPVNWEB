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
                            <h2 style="font-weight: 600">Biểu đồ tổng sản lượng nạp GAS</h2>
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
            //Pie chart
            var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
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
            var pieOptions = {
                maintainAspectRatio: false,
                responsive: true,
                //events: false,
                //events: false,
                animation: {
                    duration: 500,
                    easing: "easeOutQuart",
                    onComplete: function () {
                        var ctx = this.chart.ctx;
                        ctx.font = "500 18px Arial";
                        ctx.textAlign = 'center';
                        ctx.textBaseline = 'bottom';

                        donutData.datasets.forEach(function (dataset) {

                            for (var i = 0; i < dataset.data.length; i++) {
                                var model = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._model,
                                    total = dataset._meta[Object.keys(dataset._meta)[0]].total,
                                    mid_radius = model.innerRadius + (model.outerRadius - model.innerRadius) / 2,
                                    start_angle = model.startAngle,
                                    end_angle = model.endAngle,
                                    mid_angle = start_angle + (end_angle - start_angle) / 2;

                                var x = mid_radius * Math.cos(mid_angle);
                                var y = mid_radius * Math.sin(mid_angle);

                                ctx.fillStyle = '#fff';
                                if (i == 3) { // Darker text color for lighter background
                                    ctx.fillStyle = '#444';
                                }

                                var val = dataset.data[i];
                                var percent = " (" + String(Math.round(val / total * 100)) + "%)";

                                if (val != 0) {
                                    ctx.fillText(dataset.data[i] + percent, model.x + x, model.y + y);
                                    // Display percent in another line, line break doesn't work for fillText
                                    //ctx.fillText(percent, model.x + x+5, model.y + y+20);
                                }
                            }
                        });
                    }
                }
            }

            var charpie = new Chart(pieChartCanvas, {
                type: 'pie',
                data: donutData,
                options: pieOptions
            })
            //Line Chart

          
            var DataLineChart = {
                labels: ['06:00', '07:00', '08:00', '09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00', '21:00', '22:00', '23:00', '00:00', '01:00', '02:00', '03:00', '04:00', '05:00'],
                datasets: [
                    {
                        type: 'line',
                        yAxisID: 'y-axis-1',
                        label: 'Plan',
                        borderColor: 'rgb(75, 192, 192)',
                        data: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240],
                        fill: false,
                    },
                    {
                        type: 'line',
                        yAxisID: 'y-axis-1',
                        label: 'Actual',
                        borderColor: '#b38600',
                        data: [6, 21, 30, 35, 45, 51, 65, 82, 94, 102, 115, 120, 130, 136, 157, 160, 162, 180, 191, 198, 210, 224, 235, 240],
                        fill: false,
                    },
                    {
                        type: 'bar',
                        label: 'Diff',
                        backgroundColor: function (context) {
                            var value = context.dataset.data[context.dataIndex];
                            return value < 0 ? 'red' : 'green';
                        },
                        yAxisID: 'y-axis-2',
                        order: 1,
                        data: [-10, 10, 2, 3, 5, 4, 0, 1, 3, 4, 8, -2, 4, 0, -10, 10, 2, 3, 5, 4, 0, 1, 3, 4, 8, -2, 4, 0],
                    },
                ]
            };
            var maxDataValuebarchartdiff = Math.max(...DataLineChart.datasets[2].data);
            var maxYAxisValuebarchartdiff = maxDataValuebarchartdiff + 10;

            var LineChartOption =
            {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [{
                        ticks: {
                            fontSize: 15
                        },
                        //gridLines: {
                        //    display: false
                        //},

                    }],
                    yAxes: [{
                        beginAtZero: true,
                        id: 'y-axis-1', // ID của trục y thứ nhất
                        type: 'linear',
                        position: 'left', // Vị trí của trục y thứ nhất
                        ticks: {
                            fontSize: 15,
                            beginAtZero: true,
                          
                        },
                        //gridLines: {
                        //    display: false
                        //},
                    },
                    {
                       
                        id: 'y-axis-2', // ID của trục y thứ hai
                        type: 'linear',
                        position: 'right', // Vị trí của trục y thứ hai
                        ticks: {
                            fontSize: 15,
                            beginAtZero: true,
                            max: maxYAxisValuebarchartdiff,
                            min: -maxYAxisValuebarchartdiff,
                           
                        },
                        //gridLines: {
                        //    display: false
                        //},
                      
                    }]
                },
                plugins: {
                    legend: {
                        display: true,
                        position: 'bottom',
                    },
                },
                animation: {
                    duration: 1,
                    onComplete: function () {
                        var chartInstance = this.chart,
                            ctx = chartInstance.ctx;
                        ctx.font = "500 18px Arial";
                        ctx.fillStyle = '#000000';

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

            };
            var lineChartCanvas = $('#linechart').get(0).getContext('2d')
            var linechart = new Chart(lineChartCanvas, {
                type: 'line',
                data: DataLineChart,
                options: LineChartOption
            })
           
           

            //
            var dataPlan = Array.from({ length: 24 }, () => Math.floor(Math.random() * (800 - 500 + 1)) + 500);
            var dataPlanHour = Array.from({ length: 24 }, () => Math.floor(Math.random() * (500 - 300 + 1)) + 300);
            var dataPlanActual = Array.from({ length: 24 }, () => Math.floor(Math.random() * (300 - 100 + 1)) + 100);

            var databarchart = {
                labels: ['NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567', 'NR-DZ1234567'],
                datasets: [
                    {
                        type: 'bar',
                        label: 'Plan',
                        backgroundColor: '#248f24',
                        order: 2,
                        data: dataPlan,
                    },
                    {
                        type: 'bar',
                        label: 'Plan/Time',
                        backgroundColor: '#ffff4d',
                        categoryPercentage: 0.5,
                        order: 1,
                        data: dataPlanHour,
                    },

                    {
                        type: 'bar',
                        label: 'Actual',
                        backgroundColor: '#668cff',
                        borderColor: '#000000',
                        pointRadius: false,
                        order: 0,
                        categoryPercentage: 0.25,
                        data: dataPlanActual,

                    },

                ]

            }

            var maxDataValuebarchartquantity = Math.max(...databarchart.datasets.map(dataset => Math.max(...dataset.data)));
            var maxYAxisValuebarchartquantity = maxDataValuebarchartquantity + 30;

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
                            fontSize: 15,
                            beginAtZero: true,
                            max: maxYAxisValuebarchartquantity
                        },
                        //gridLines: {
                        //    display: false
                        //},

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
                        ctx.font = "500 18px Arial";
                        ctx.fillStyle = '#000000';

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
            var barcharng = new Chart(barChartCanvas, {
                type: 'bar',
                data: databarchart,
                options: barChartOptions
            })
            LoadDataForPieChart();
            setInterval(LoadDataForPieChart, 2000);
            // Load Data OK NG
            function LoadDataForPieChart() {
                $.ajax({
                    type: 'POST',
                    url: '/MyWebSercive.asmx/DataForPieChart',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (response) {
                        var data = JSON.parse(response.d);
                        donutData.datasets[0].data = data.Datapiechart;
                        charpie.update();
                    },
                    error: function (xhr, status, error) {
                        alert(error)
                    }
                });
            }
             // Load Data Plan by Model
            //function LoadDataForPieChart() {
            //    $.ajax({
            //        type: 'POST',
            //        url: '/MyWebSercive.asmx/DataForPieChart',
            //        contentType: 'application/json; charset=utf-8',
            //        dataType: 'json',
            //        success: function (response) {
            //            var data = JSON.parse(response.d);
            //            donutData.datasets[0].data = data.Datapiechart;
            //            charpie.update();
            //        },
            //        error: function (xhr, status, error) {
            //            alert(error)
            //        }
            //    });
            //}
            // Load Data Plan by Total
            //function LoadDataForPieChart() {
            //    $.ajax({
            //        type: 'POST',
            //        url: '/MyWebSercive.asmx/DataForPieChart',
            //        contentType: 'application/json; charset=utf-8',
            //        dataType: 'json',
            //        success: function (response) {
            //            var data = JSON.parse(response.d);
            //            donutData.datasets[0].data = data.Datapiechart;
            //            charpie.update();
            //        },
            //        error: function (xhr, status, error) {
            //            alert(error)
            //        }
            //    });
            //}
        });
    </script>
</asp:Content>
