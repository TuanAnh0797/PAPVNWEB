<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PlanGAS.aspx.cs" Inherits="PAPVN.PlanGAS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--     <div class="content-header" style="padding: 5px;">
        <h1 style="margin:0px 0px 0px 20px; font-weight:150">Management Plan/Real Time</h1>
    </div>--%>
    <div class="content" style="background-color:#dddbdb; padding-left:2px; padding-right:2px">
        <div class="container-fluid">
            <div class="row">
                <div class="chart col" style="padding: 2px;">
                <div style="background-color: white; padding: 5px">
                    <div style="display: flex; align-items: center; justify-content: center">
                        <h2 style="font-weight: 600">Biểu đồ sản lượng nạp GAS theo model</h2>
                    </div>
                    <div class="chart-container">
                        <canvas id="barchart" style="min-height: 580px;"></canvas>
                    </div>
                </div>
            </div>
            </div>
           
        </div>
        <div class="container-fluid">
            <div class="row">
                <%-- <div class="chart col-sm-4" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px; margin: 0px 0px 0px 5px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h2 style="font-weight: 600">Biểu đồ tỉ lệ OK/NG nạp GAS</h2>
                        </div>
                        <div class="chart-container">
                            <canvas id="pieChart" style="min-height: 400px;"></canvas>
                        </div>
                    </div>
                </div>--%>
                <div class="chart  col-sm-4" style="padding: 2px;">
                    <div style="background-color: white; padding: 5px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h2 style="font-weight: 600"> Model theo dõi đặc biệt</h2>
                        </div>
                        <div class="chart-container">
                            <canvas id="barchartmonitor" style="min-height: 441px;"></canvas>
                        </div>
                    </div>
                </div>
                <div class="chart col" style="padding: 2px;">
                    <div style="background-color: white; padding: 5px; margin: 0px 0px 0px 0px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h2 style="font-weight: 600">Biểu đồ sản lượng nạp GAS theo thời gian</h2>
                        </div>
                        <div class="row ml-3">
                            <div class=" col-sm-2">
                                <h3 style="color:blue; font-weight:bold">Plan: <span id="dataplan"></span></h3>
                            </div>
                            <div class=" col-sm-2">
                                <h3 style="color:#cc9900; font-weight:bold">Target: <span id="datatarget"></span></h3>
                            </div>
                            <div class=" col-sm-2">
                                <h3 style="color:green; font-weight:bold">Actual: <span id="dataactual"></span></h3>
                            </div>
                            <div class=" col-sm-6" style="display: flex; justify-content: flex-end;">
                                <select runat="server" id="modelplan" class="form-control select2" style="width: 250px">
                                    <option>--All Model--</option>
                                </select>
                            </div>
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
        var isloadbarchart = 0;
        var isloadbarchartmonitor = 0;
        var isloadlinechart = 0;
        $(document).ready(function () {
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Bar chart<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            var barChartCanvas = $('#barchart').get(0).getContext('2d')
            var databarchart = {
                labels: [],
                datasets: [
                    {
                        type: 'bar',
                        label: 'Plan',
                        backgroundColor: '#1a53ff',
                        order: 2,
                        data: []
                    },
                    {
                        type: 'bar',
                        label: 'Plan/Time',
                        backgroundColor: '#cc9900',
                        categoryPercentage: 0.6,
                        order: 1,
                        data: []
                    },
                    {
                        type: 'bar',
                        label: 'Actual',
                        //backgroundColor: '#248f24',
                        order: 0,
                        categoryPercentage: 0.35,
                        data: []
                    },
                ]
            }
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
                        ctx.font = "500 18px Arial";
                        ctx.fillStyle = '#000000';
                        ctx.textAlign = 'center';
                        ctx.textBaseline = 'bottom';
                        this.data.datasets.forEach(function (dataset, i) {
                            var meta = chartInstance.controller.getDatasetMeta(i);
                            meta.data.forEach(function (bar, index) {
                                var data = dataset.data[index];
                                ctx.fillText(data, bar._model.x, bar._model.y);
                            });
                        });
                    }
                }
            }
            var barchartplan = new Chart(barChartCanvas, {
                type: 'bar',
                data: databarchart,
                options: barChartOptions
            })
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Bar chart monitor<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            var barChartCanvasmonitor = $('#barchartmonitor').get(0).getContext('2d')
            var databarchartmonitor = {
                labels: [],
                datasets: [
                    {
                        type: 'bar',
                        label: 'Plan',
                        backgroundColor: '#1a53ff',
                        order: 2,
                        //data: dataPlan,
                        data: []
                    },
                    {
                        type: 'bar',
                        label: 'Plan/Time',
                        backgroundColor: '#cc9900',
                        categoryPercentage: 0.6,
                        order: 1,
                        //data: dataPlanHour,
                        data: []
                    },
                    {
                        type: 'bar',
                        label: 'Actual',
                        //backgroundColor: '#248f24',
                        order: 0,
                        categoryPercentage: 0.35,
                        data: []
                    },
                ]
            }
            var barChartOptionsmonitor = {
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
                        ctx.font = "500 18px Arial";
                        ctx.fillStyle = '#000000';
                        ctx.textAlign = 'center';
                        ctx.textBaseline = 'bottom';
                        this.data.datasets.forEach(function (dataset, i) {
                            var meta = chartInstance.controller.getDatasetMeta(i);
                            meta.data.forEach(function (bar, index) {
                                var data = dataset.data[index];
                                ctx.fillText(data, bar._model.x, bar._model.y);
                            });
                        });
                    }
                }
            }
            var barchartplanmonitor = new Chart(barChartCanvasmonitor, {
                type: 'bar',
                data: databarchartmonitor,
                options: barChartOptionsmonitor
            })
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Line Chart<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            var DataLineChart = {
                //labels: ['06:00', '06:05', '07:00', '08:00', '08:10', '09:00', '10:00', '10:30', '11:00', '12:00', '12:10', '13:00', '14:00', '14:05', '15:00', '16:00', '16:10', '17:00', '18:00', '18:30', '19:00', '20:00', '20:10', '21:00', '22:00', '22:10', '23:00', '00:00', '00:10', '01:00', '02:00', '02:45', '03:00', '04:00', '04:10', '05:00', '06:00'],
                labels: ['06:00', '06:05', '06:10', '06:15', '06:20', '06:25', '06:30', '06:35', '06:40', '06:45', '06:50', '06:55', '07:00', '07:05', '07:10', '07:15', '07:20', '07:25', '07:30', '07:35', '07:40', '07:45', '07:50', '07:55', '08:00', '08:05', '08:10', '08:15', '08:20', '08:25', '08:30', '08:35', '08:40', '08:45', '08:50', '08:55', '09:00', '09:05', '09:10', '09:15', '09:20', '09:25', '09:30', '09:35', '09:40', '09:45', '09:50', '09:55', '10:00', '10:05', '10:10', '10:15', '10:20', '10:25', '10:30', '10:35', '10:40', '10:45', '10:50', '10:55', '11:00', '11:05', '11:10', '11:15', '11:20', '11:25', '11:30', '11:35', '11:40', '11:45', '11:50', '11:55', '12:00', '12:05', '12:10', '12:15', '12:20', '12:25', '12:30', '12:35', '12:40', '12:45', '12:50', '12:55', '13:00', '13:05', '13:10', '13:15', '13:20', '13:25', '13:30', '13:35', '13:40', '13:45', '13:50', '13:55', '14:00', '14:05', '14:10', '14:15', '14:20', '14:25', '14:30', '14:35', '14:40', '14:45', '14:50', '14:55', '15:00', '15:05', '15:10', '15:15', '15:20', '15:25', '15:30', '15:35', '15:40', '15:45', '15:50', '15:55', '16:00', '16:05', '16:10', '16:15', '16:20', '16:25', '16:30', '16:35', '16:40', '16:45', '16:50', '16:55', '17:00', '17:05', '17:10', '17:15', '17:20', '17:25', '17:30', '17:35', '17:40', '17:45', '17:50', '17:55', '18:00', '18:05', '18:10', '18:15', '18:20', '18:25', '18:30', '18:35', '18:40', '18:45', '18:50', '18:55', '19:00', '19:05', '19:10', '19:15', '19:20', '19:25', '19:30', '19:35', '19:40', '19:45', '19:50', '19:55', '20:00', '20:05', '20:10', '20:15', '20:20', '20:25', '20:30', '20:35', '20:40', '20:45', '20:50', '20:55', '21:00', '21:05', '21:10', '21:15', '21:20', '21:25', '21:30', '21:35', '21:40', '21:45', '21:50', '21:55', '22:00', '22:05', '22:10', '22:15', '22:20', '22:25', '22:30', '22:35', '22:40', '22:45', '22:50', '22:55', '23:00', '23:05', '23:10', '23:15', '23:20', '23:25', '23:30', '23:35', '23:40', '23:45', '23:50', '23:55', '00:00', '00:05', '00:10', '00:15', '00:20', '00:25', '00:30', '00:35', '00:40', '00:45', '00:50', '00:55', '01:00', '01:05', '01:10', '01:15', '01:20', '01:25', '01:30', '01:35', '01:40', '01:45', '01:50', '01:55', '02:00', '02:05', '02:10', '02:15', '02:20', '02:25', '02:30', '02:35', '02:40', '02:45', '02:50', '02:55', '03:00', '03:05', '03:10', '03:15', '03:20', '03:25', '03:30', '03:35', '03:40', '03:45', '03:50', '03:55', '04:00', '04:05', '04:10', '04:15', '04:20', '04:25', '04:30', '04:35', '04:40', '04:45', '04:50', '04:55', '05:00', '05:05', '05:10', '05:15', '05:20', '05:25', '05:30', '05:35', '05:40', '05:45', '05:50', '05:55', '06:00'],
                datasets: [
                    {
                        type: 'line',
                        yAxisID: 'y-axis-1',
                        label: 'Plan',
                        borderColor: 'rgb(75, 192, 192)',
                        data: [],
                        fill: false,
                        //tension: 0, // làm line đỡ mượt
                        borderWidth: 1,
                        pointRadius: 1, //
                    },
                    {
                        type: 'line',
                        yAxisID: 'y-axis-1',
                        label: 'Actual',
                        borderColor: '#b38600',
                        data: [],
                        fill: false,
                        //tension: 0, // làm line đỡ mượt
                        borderWidth: 1,
                        pointRadius: 1, //
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
                        data: []
                    },
                ]
            };
            var LineChartOption =
            {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    //xAxes: [{
                    //    type: 'linear',
                    //}],
                    x: {
                        ticks: {
                            fontSize: 15
                        },
                        type: 'linear', // Sử dụng linear scale cho trục x
                        position: 'bottom',
                    },
                    yAxes: [{
                        beginAtZero: true,
                        id: 'y-axis-1', // ID của trục y thứ nhất
                        type: 'linear',
                        position: 'left', // Vị trí của trục y thứ nhất
                        ticks: {
                            fontSize: 15,
                            beginAtZero: true,
                        },
                    },
                    {
                        id: 'y-axis-2', // ID của trục y thứ hai
                        type: 'linear',
                        position: 'right', // Vị trí của trục y thứ hai
                        ticks: {
                            fontSize: 15,
                            beginAtZero: true,
                            //max: maxYAxisValuebarchartdiff,
                            //min: -maxYAxisValuebarchartdiff,
                        },
                        gridLines: {
                            display: false
                        },
                    }]
                },
                legend: {
                    position: 'bottom',
                    labels: {
                        fontSize: 15,
                    },
                },
                //animation: {
                //    duration: 1,
                //    onComplete: function () {
                //        var chartInstance = this.chart,
                //            ctx = chartInstance.ctx;
                //        ctx.font = "500 18px Arial";
                //        ctx.fillStyle = '#000000';
                //        ctx.textAlign = 'center';
                //        ctx.textBaseline = 'bottom';
                //        this.data.datasets.forEach(function (dataset, i) {
                //            if (i == 2) {
                //                var meta = chartInstance.controller.getDatasetMeta(i);
                //                meta.data.forEach(function (bar, index) {
                //                    var data = dataset.data[index];
                //                    if (data >= 0) {
                //                        ctx.fillText(data, bar._model.x, bar._model.y - 5);
                //                    }
                //                    else {
                //                        ctx.fillText(data, bar._model.x, bar._model.y + 20);
                //                    }
                //                });
                //            }
                //        });
                //    }
                //}
            };
            var lineChartCanvas = $('#linechart').get(0).getContext('2d')
            var linechart = new Chart(lineChartCanvas, {
                type: 'line',
                data: DataLineChart,
                options: LineChartOption
            })
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Load Data Plan by Model<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            function LoadDataForBarchart() {
                if (isloadbarchart == 0) {
                    isloadbarchart = 1;
                    $.ajax({
                        type: 'POST',
                        url: '/MyWebSercive.asmx/DataForBarChart',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (response) {
                            var data = JSON.parse(response.d);
                            databarchart.datasets[0].data = data.dataplan;
                            databarchart.datasets[1].data = data.dataplanpertime;
                            databarchart.datasets[2].data = data.dataactual;
                            databarchart.labels = data.labels;
                            barChartOptions.scales.yAxes[0].ticks.max = Math.max(...data.dataplan) + 30;
                            barchartplan.options = barChartOptions;
                            var data1 = databarchart.datasets[2].data;
                            var data2 = databarchart.datasets[1].data;
                            var bgr = [];
                            data1.forEach(function (value1, index) {
                                var value2 = data2[index];
                                if (value1 < value2) {
                                    bgr.push('red')
                                }
                                else {
                                    bgr.push('green')
                                }
                            });
                            databarchart.datasets[2].backgroundColor = bgr;
                            barchartplan.update();
                        },
                        error: function (xhr, status, error) {
                            alert(error)
                        }
                    });
                }
                isloadbarchart = 0;
            }
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Load Data Plan by Model Monitor<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            function LoadDataForBarchartMonitor() {
                if (isloadbarchartmonitor == 0) {
                    isloadbarchartmonitor = 1;
                    $.ajax({
                        type: 'POST',
                        url: '/MyWebSercive.asmx/DataForBarChartMonitor',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (response) {
                            var data = JSON.parse(response.d);
                            databarchartmonitor.datasets[0].data = data.dataplan;
                            databarchartmonitor.datasets[1].data = data.dataplanpertime;
                            databarchartmonitor.datasets[2].data = data.dataactual;
                            databarchartmonitor.labels = data.labels;
                            barChartOptionsmonitor.scales.yAxes[0].ticks.max = Math.max(...data.dataplan) + 30;
                            barchartplanmonitor.options = barChartOptionsmonitor;
                            var data1 = databarchartmonitor.datasets[2].data;
                            var data2 = databarchartmonitor.datasets[1].data;
                            var bgr = [];
                            data1.forEach(function (value1, index) {
                                var value2 = data2[index];
                                if (value1 < value2) {
                                    bgr.push('red')
                                }
                                else {
                                    bgr.push('green')
                                }
                            });
                            databarchartmonitor.datasets[2].backgroundColor = bgr;
                            barchartplanmonitor.update();
                        },
                        error: function (xhr, status, error) {
                            alert(error)
                        }
                    });
                }
                isloadbarchartmonitor = 0;
            }
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Load Data Plan by Total<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            function LoadDataForLineChart() {
                if (isloadlinechart == 0) {
                    isloadlinechart = 1;
                    var selectedModel = document.getElementById('<%= modelplan.ClientID %>').value;
                    $.ajax({
                        type: 'POST',
                        url: '/MyWebSercive.asmx/DataForLineChart',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: JSON.stringify({ ModelName: selectedModel }),
                        success: function (response) {
                            var data = JSON.parse(response.d);
                            DataLineChart.datasets[0].data = data.dataplan;
                            DataLineChart.datasets[1].data = data.dataactual;
                            DataLineChart.datasets[2].data = data.datadiff;
                            //DataLineChart.labels = data.labels;
                            //const absoluteValues = data.datadiff.map(value => Math.abs(value));
                            //const maxAbsoluteValue = Math.max(...absoluteValues) + 100;
                            //LineChartOption.scales.yAxes[1].ticks.max = maxAbsoluteValue;
                            //LineChartOption.scales.yAxes[1].ticks.min = -maxAbsoluteValue;
                            //linechart.options = LineChartOption;
                            var plan = data.TotalPlan;
                            var target = DataLineChart.datasets[0].data[DataLineChart.datasets[0].data.length - 1];
                            var actual = DataLineChart.datasets[1].data[DataLineChart.datasets[1].data.length - 1];
                            $('#dataplan').html(`${plan}`);
                            $('#datatarget').html(`${target}`);
                            $('#dataactual').html(`${actual}`);
                            linechart.update();
                        },
                        error: function (xhr, status, error) {
                            alert(error)
                        }
                    });
                }
                isloadlinechart = 0;
            }
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Select Model<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            $('#<%= modelplan.ClientID %>').on('change', function () {
                LoadDataForLineChart();
            });

            function CallAll() {
                LoadDataForBarchart();
                LoadDataForBarchartMonitor();
                LoadDataForLineChart();
            }


            setTimeout(CallAll, 1000);
            //setTimeout(LoadDataForLineChart, 3000);
            //setTimeout(LoadDataForBarchartMonitor, 4000);
            //setInterval(LoadDataForLineChart, 2000);
            //setInterval(LoadDataForBarchart, 2000);
            //setInterval(LoadDataForBarchartMonitor, 2000);
            //setInterval(LoadDataForLineChart, 60000);
            //setInterval(LoadDataForBarchart, 60000);
            //setInterval(LoadDataForBarchartMonitor, 60000);

             // Load Data OK NG
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

            ////Pie chart
            //var donutData = {
            //    labels: [
            //        'OK',
            //        'NG'
            //    ],
            //    datasets: [
            //        {
            //            data: [],
            //            backgroundColor: ['#008000', '#FF0000'],
            //        }
            //    ]
            //}
            //var pieOptions = {
            //    maintainAspectRatio: false,
            //    responsive: true,
            //    events: false,
            //    animation: {
            //        duration: 500,
            //        easing: "easeOutQuart",
            //        onComplete: function () {
            //            var ctx = this.chart.ctx;
            //            ctx.font = "500 18px Arial";
            //            ctx.textAlign = 'center';
            //            ctx.textBaseline = 'bottom';
            //            donutData.datasets.forEach(function (dataset) {
            //                for (var i = 0; i < dataset.data.length; i++) {
            //                    var model = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._model,
            //                        total = dataset._meta[Object.keys(dataset._meta)[0]].total,
            //                        mid_radius = model.innerRadius + (model.outerRadius - model.innerRadius) / 2,
            //                        start_angle = model.startAngle,
            //                        end_angle = model.endAngle,
            //                        mid_angle = start_angle + (end_angle - start_angle) / 2;
            //                    var x = mid_radius * Math.cos(mid_angle);
            //                    var y = mid_radius * Math.sin(mid_angle);
            //                    ctx.fillStyle = '#fff';
            //                    if (i == 3) { // Darker text color for lighter background
            //                        ctx.fillStyle = '#444';
            //                    }
            //                    var val = dataset.data[i];
            //                    var percent = " (" + String(Math.round(val / total * 100)) + "%)";
            //                    if (val != 0) {
            //                        ctx.fillText(dataset.data[i] + percent, model.x + x, model.y + y);
            //                    }
            //                }
            //            });
            //        }
            //    }
            //}
            //var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
            //var charpie = new Chart(pieChartCanvas, {
            //    type: 'pie',
            //    data: donutData,
            //    options: pieOptions
            //})
        });
    </script>
</asp:Content>
