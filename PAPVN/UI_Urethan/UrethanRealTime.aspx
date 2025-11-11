<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UrethanRealTime.aspx.cs" Inherits="PAPVN.UI_Urethan.UrethanRealTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .oee-card {
            text-align: center;
            padding: 10px;
            border-radius: 10px;
            color: white;
            font-weight: bold;
            transition: transform 0.3s ease;
        }

            .oee-card:hover {
                transform: scale(1.05);
            }

            .oee-card h1 {
                font-size: 0.5rem;
                margin-bottom: 0px;
                opacity: 0.9;
            }

            .oee-card .value {
                font-size: 2rem;
                font-weight: bold;
            }
    </style>
    <div class="m-2">

        <h1 class="text-center"
            style="font-weight: 700; color: #0d47a1; text-transform: uppercase; letter-spacing: 2px; text-shadow: 1px 1px 3px rgba(0,0,0,0.1);">DASHBOARD SẢN LƯỢNG CÔNG ĐOẠN URT
        </h1>
        <div class=" row p-0 ml-2 mr-2">

            <div class="oee-card bg-blue col m-2">
                <h3 class="mb-0" style="font-weight: 600">Plan</h3>
                <div class="value" id="plan">0</div>
                <%-- <small>Thời gian hoạt động</small>--%>
            </div>
            <div class="oee-card bg-info col m-2">
                <h3 class="mb-0" style="font-weight: 600">Plan time</h3>
                <div class="value" id="plantime">0</div>
                <%-- <small>Hiệu suất sản xuất</small>--%>
            </div>
            <div class="oee-card bg-success col m-2">
                <h3 class="mb-0" style="font-weight: 600">Actual</h3>
                <div class="value" id="actual">0</div>
                <%-- <small>Chất lượng sản phẩm</small>--%>
            </div>
            <div class="oee-card bg-danger col m-2">
                <h3 class="mb-0" style="font-weight: 600; color: white">Diff</h3>
                <div style="color: white" class="value" id="diff">0</div>
                <%-- <small>Hiệu quả tổng thể</small>--%>
            </div>
            <div class="oee-card bg-warning col m-2">
                <h3 class="mb-0" style="font-weight: 600; color: white">Remain</h3>
                <div style="color: white" class="value" id="remain">0</div>
                <%-- <small>Hiệu quả tổng thể</small>--%>
            </div>
        </div>

        <div class="row">



            <div class="card ml-2 mr-2 mb-2 col p-0" style="background-color: white">
                <h4 class="card-header bg-secondary text-black text-center p-0" style="font-weight: 600">
                    <asp:Literal runat="server" Text="Sản lượng theo phút" />
                </h4>
                <div class="chart-container">
                    <canvas id="QuantityPerTimechart" style="min-height: 350px; height: 100%;max-height:400px"></canvas>
                </div>
            </div>

            <div class="card m-0 mb-2 col p-0 mr-2" style="background-color: white">
                <h4 class="card-header bg-secondary text-black text-center p-0" style="font-weight: 600">
                    <asp:Literal runat="server" Text="Sản lượng theo giờ" />
                </h4>
                <div class="chart-container">
                    <canvas id="QuantityPerHourchart" style="min-height: 350px; height: 100%;max-height:400px"></canvas>
                </div>
            </div>

            <%-- <div class="card m-0 mb-2 col-sm-4 p-0 mr-2" style="background-color: white">
                <h4 class="card-header bg-secondary text-black text-center p-0" style="font-weight: 600">
                    <asp:Literal runat="server" Text="Model theo dõi đặc biệt" />
                </h4>
                <div class="chart-container">
                    <canvas id="quantitybymodelmonitor" style="min-height: 250px; height: 100%"></canvas>
                </div>
            </div>--%>
        </div>
        <div class="row">

            <div class="card m-0 mb-2 col p-0 mr-2 ml-2" style="background-color: white">
                <h4 class="card-header bg-secondary text-black text-center p-0" style="font-weight: 600">
                    <asp:Literal runat="server" Text="Sản lượng theo Model" />
                </h4>
                <div class="chart-container">
                    <canvas id="quantitybymodel" style="min-height: 350px; height: 100%;max-height:400px"></canvas>
                </div>
            </div>

            <div class="card m-0 mb-2 col p-0 mr-2" style="background-color: white">
                <h4 class="card-header bg-secondary text-black text-center p-0" style="font-weight: 600">
                    <asp:Literal runat="server" Text="Sản lượng theo nhóm Model" />
                </h4>
                <div class="chart-container">
                    <canvas id="quantitybygroupmodel" style="min-height: 350px; height: 100%;max-height:400px"></canvas>
                </div>
            </div>

        </div>

    </div>
    <script>

        //
        var DataQuantityPerTimechart = {
            labels: [],
            datasets: [
                {
                    type: 'line',
                    yAxisID: 'y-axis-1',
                    label: 'Plan',
                    borderColor: 'rgb(75, 192, 192)',
                    data: [],
                    fill: false,
                    //tension: 0, // làm line đỡ mượt
                    borderWidth: 2,
                    pointRadius: 2, //
                },
                {
                    type: 'line',
                    yAxisID: 'y-axis-1',
                    label: 'Actual',
                    borderColor: '#b38600',
                    data: [],
                    fill: false,
                    //tension: 0, // làm line đỡ mượt
                    borderWidth: 2,
                    pointRadius: 2, //
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
        var QuantityPerTimeChartOption =
        {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                //xAxes: [{
                //    type: 'linear',
                //}],
                x: {
                    ticks: {
                        fontSize: 15,
                        fontColor: 'black',
                        fontStyle: 'bold',
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
                        fontColor: 'black',
                        fontStyle: 'bold',
                        //max: 3000, // Đặt giá trị tối đa của trục y là 100
                        //min: 0,   // (Tùy chọn) Đặt giá trị tối thiểu nếu cần
                        //stepSize: 300 // (Tùy chọn) Đặt khoảng cách giữa các giá trị trên trục y
                    },
                },
                {
                    id: 'y-axis-2', // ID của trục y thứ hai
                    type: 'linear',
                    position: 'right', // Vị trí của trục y thứ hai
                    ticks: {
                        fontSize: 15,
                        beginAtZero: true,
                        fontColor: 'black',
                        fontStyle: 'bold',
                        //max: 300, // Đặt giá trị tối đa của trục y là 100
                        // min: -300,   // (Tùy chọn) Đặt giá trị tối thiểu nếu cần
                        //stepSize: 300 // (Tùy chọn) Đặt khoảng cách giữa các giá trị trên trục y
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
                    fontColor: 'black',
                    fontStyle: 'bold',
                },
            },

        };
        var QuantityPerTimechart = $('#QuantityPerTimechart').get(0).getContext('2d')
        var QuantityPerTimechartCanvas = new Chart(QuantityPerTimechart, {
            type: 'line',
            data: DataQuantityPerTimechart,
            options: QuantityPerTimeChartOption
        })
        //
        //
        var QuantityByModelChartCanvas = $('#quantitybymodel').get(0).getContext('2d')
        var dataquantitybymodel = {
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
                    backgroundColor: '#f5e10c',
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
        var QuantityByModelChartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            datasetFill: false,
            scales: {
                xAxes: [{
                    ticks: {
                        padding:15
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
                        fontColor: 'black',
                        fontStyle: 'bold',
                        //max: 3000, // Đặt giá trị tối đa của trục y là 100
                        //min: 0,   // (Tùy chọn) Đặt giá trị tối thiểu nếu cần
                        //stepSize: 300 // (Tùy chọn) Đặt khoảng cách giữa các giá trị trên trục y
                    },
                }],
            },
            legend: {
                position: 'bottom',
                labels: {
                    fontSize: 15,
                    fontColor: 'black',
                    fontStyle: 'bold',
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

                    // 🟦 PHẦN 1: Vẽ giá trị trên đầu mỗi cột
                    this.data.datasets.forEach(function (dataset, i) {
                        var meta = chartInstance.controller.getDatasetMeta(i);
                        meta.data.forEach(function (bar, index) {
                            var data = dataset.data[index];
                            ctx.fillText(data, bar._model.x, bar._model.y);
                        });
                    });

                    // 🟥 PHẦN 2: Vẽ độ lệch (diff) dưới chân cột
                    var datasets = this.data.datasets;

                    // Giả sử dataset[1] = Plan, dataset[2] = Actual
                    var planData = datasets[1].data;
                    var actualData = datasets[2].data;
                    var metaActual = chartInstance.getDatasetMeta(2); // ⚠️ bạn nên lấy meta của "Actual" (index = 2)

                    metaActual.data.forEach(function (bar, index) {
                        var diff = actualData[index] - planData[index];
                        var baseY = bar._model.base;
                        var x = bar._model.x;
                        var y = baseY + 5; // dịch xuống 15px để không chồng chữ

                        ctx.fillStyle = diff >= 0 ? 'green' : 'red';
                        ctx.textBaseline = 'top'; // 🟩 vẽ dưới chân thì nên để “top”
                        ctx.fillText(diff, x, y);
                    });
                }
            }


        }
        var QuantityByModelChart = new Chart(QuantityByModelChartCanvas, {
            type: 'bar',
            data: dataquantitybymodel,
            options: QuantityByModelChartOptions
        })
        //
        //
        //var QuantityByModelMonitorChartCanvas = $('#quantitybymodelmonitor').get(0).getContext('2d')
        //var dataquantitybymodelmonitor = {
        //    labels: [],
        //    datasets: [
        //        {
        //            type: 'bar',
        //            label: 'Plan',
        //            backgroundColor: '#1a53ff',
        //            order: 2,
        //            data: []
        //        },
        //        {
        //            type: 'bar',
        //            label: 'Plan/Time',
        //            backgroundColor: '#f5e10c',
        //            categoryPercentage: 0.6,
        //            order: 1,
        //            data: []
        //        },
        //        {
        //            type: 'bar',
        //            label: 'Actual',
        //            //backgroundColor: '#248f24',
        //            order: 0,
        //            categoryPercentage: 0.35,
        //            data: []
        //        },
        //    ]
        //}
        //var QuantityByModelMonitorChartOptions = {
        //    responsive: true,
        //    maintainAspectRatio: false,
        //    datasetFill: false,
        //    scales: {
        //        xAxes: [{
        //            ticks: {
        //                padding: 15,
        //            },
        //            gridLines: {
        //                display: false
        //            },
        //            stacked: true,
        //        }],
        //        yAxes: [{
        //            ticks: {
        //                fontSize: 15,
        //                beginAtZero: true,
        //                fontColor: 'black',
        //                fontStyle: 'bold',
        //                //max: 3000, // Đặt giá trị tối đa của trục y là 100
        //                //min: 0,   // (Tùy chọn) Đặt giá trị tối thiểu nếu cần
        //                //stepSize: 300 // (Tùy chọn) Đặt khoảng cách giữa các giá trị trên trục y
        //            },
        //        }],
        //    },
        //    legend: {
        //        position: 'bottom',
        //        labels: {
        //            fontSize: 15,
        //            fontColor: 'black',
        //            fontStyle: 'bold',
        //        },
        //    },
        //    animation: {
        //        duration: 1,
        //        onComplete: function () {
        //            var chartInstance = this.chart,
        //                ctx = chartInstance.ctx;

        //            ctx.font = "500 18px Arial";
        //            ctx.fillStyle = '#000000';
        //            ctx.textAlign = 'center';
        //            ctx.textBaseline = 'bottom';

        //            // 🟦 PHẦN 1: Vẽ giá trị trên đầu mỗi cột
        //            this.data.datasets.forEach(function (dataset, i) {
        //                var meta = chartInstance.controller.getDatasetMeta(i);
        //                meta.data.forEach(function (bar, index) {
        //                    var data = dataset.data[index];
        //                    ctx.fillText(data, bar._model.x, bar._model.y);
        //                });
        //            });

        //            // 🟥 PHẦN 2: Vẽ độ lệch (diff) dưới chân cột
        //            var datasets = this.data.datasets;

        //            // Giả sử dataset[1] = Plan, dataset[2] = Actual
        //            var planData = datasets[1].data;
        //            var actualData = datasets[2].data;
        //            var metaActual = chartInstance.getDatasetMeta(2); // ⚠️ bạn nên lấy meta của "Actual" (index = 2)

        //            metaActual.data.forEach(function (bar, index) {
        //                var diff = actualData[index] - planData[index];
        //                var baseY = bar._model.base;
        //                var x = bar._model.x;
        //                var y = baseY + 5; // dịch xuống 15px để không chồng chữ

        //                ctx.fillStyle = diff >= 0 ? 'green' : 'red';
        //                ctx.textBaseline = 'top'; // 🟩 vẽ dưới chân thì nên để “top”
        //                ctx.fillText(diff, x, y);
        //            });
        //        }

        //    }


        //}
        //var QuantityByModelChartMonitor = new Chart(QuantityByModelMonitorChartCanvas, {
        //    type: 'bar',
        //    data: dataquantitybymodelmonitor,
        //    options: QuantityByModelMonitorChartOptions
        //})
        //
        //
        var QuantityByGroupModelChartCanvas = $('#quantitybygroupmodel').get(0).getContext('2d')
        var dataquantitybygroupmodel = {
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
                    backgroundColor: '#f5e10c',
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
        var QuantityByModelGroupChartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            datasetFill: false,
            scales: {
                xAxes: [{
                    ticks: {
                        padding: 15,
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
                        fontColor: 'black',
                        fontStyle: 'bold',
                        //max: 3000, // Đặt giá trị tối đa của trục y là 100
                        //min: 0,   // (Tùy chọn) Đặt giá trị tối thiểu nếu cần
                        //stepSize: 300 // (Tùy chọn) Đặt khoảng cách giữa các giá trị trên trục y
                    },
                }],
            },
            legend: {
                position: 'bottom',
                labels: {
                    fontSize: 15,
                    fontColor: 'black',
                    fontStyle: 'bold',
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

                    // 🟦 PHẦN 1: Vẽ giá trị trên đầu mỗi cột
                    this.data.datasets.forEach(function (dataset, i) {
                        var meta = chartInstance.controller.getDatasetMeta(i);
                        meta.data.forEach(function (bar, index) {
                            var data = dataset.data[index];
                            ctx.fillText(data, bar._model.x, bar._model.y);
                        });
                    });

                    // 🟥 PHẦN 2: Vẽ độ lệch (diff) dưới chân cột
                    var datasets = this.data.datasets;

                    // Giả sử dataset[1] = Plan, dataset[2] = Actual
                    var planData = datasets[1].data;
                    var actualData = datasets[2].data;
                    var metaActual = chartInstance.getDatasetMeta(2); // ⚠️ bạn nên lấy meta của "Actual" (index = 2)

                    metaActual.data.forEach(function (bar, index) {
                        var diff = actualData[index] - planData[index];
                        var baseY = bar._model.base;
                        var x = bar._model.x;
                        var y = baseY + 5; // dịch xuống 15px để không chồng chữ

                        ctx.fillStyle = diff >= 0 ? 'green' : 'red';
                        ctx.textBaseline = 'top'; // 🟩 vẽ dưới chân thì nên để “top”
                        ctx.fillText(diff, x, y);
                    });
                }
            }


        }
        var QuantityByGroupModelChart = new Chart(QuantityByGroupModelChartCanvas, {
            type: 'bar',
            data: dataquantitybygroupmodel,
            options: QuantityByModelGroupChartOptions
        })
        //
        //
        var DataQuantityPerHourchart = {
            labels: [],
            datasets: [

                {
                    type: 'bar',
                    yAxisID: 'y-axis-1',
                    label: 'Plan',
                    backgroundColor: 'Blue',
                    data: [],
                    order: 3,
                },
                {
                    type: 'bar',
                    yAxisID: 'y-axis-1',
                    label: 'Actual',
                    backgroundColor: 'orange',
                    data: [],


                    order: 4,
                },
                {
                    type: 'line',
                    label: 'Diff',
                    fill: false,
                    borderColor: 'red',
                    backgroundColor: 'transparent',
                    yAxisID: 'y-axis-2',
                    order: 2,
                    tension: 0, // làm line đỡ mượt
                    borderWidth: 2,
                    pointRadius: 2, //
                    data: []
                },
                //{
                //    borderColor: 'orange',
                //    type: 'line',
                //    label: 'DiffAll',
                //    fill: false,
                //    //borderColor: function (context) {
                //    //    var value = context.dataset.data[context.dataIndex];
                //    //    return value < 0 ? 'red' : 'green';
                //    //},
                //    backgroundColor: 'transparent',
                //    yAxisID: 'y-axis-2',
                //    order: 1,
                //    borderWidth: 2,
                //    pointRadius: 2, //
                //    data: []
                //},

            ]
        };
        var QuantityPerHourChartOption =
        {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                //xAxes: [{
                //    type: 'linear',
                //}],
                xAxes: [{
                    ticks: {
                      
                      
                      
                        padding: 15
                    },
                  
                }],

                yAxes: [{
                    beginAtZero: true,
                    id: 'y-axis-1', // ID của trục y thứ nhất
                    type: 'linear',
                    position: 'left', // Vị trí của trục y thứ nhất
                    ticks: {
                        fontSize: 15,
                        beginAtZero: true,
                        fontColor: 'black',
                        fontStyle: 'bold',
                        //max: 3000, // Đặt giá trị tối đa của trục y là 100
                        //min: 0,   // (Tùy chọn) Đặt giá trị tối thiểu nếu cần
                        //stepSize: 300 // (Tùy chọn) Đặt khoảng cách giữa các giá trị trên trục y
                    },
                },
                {
                    id: 'y-axis-2', // ID của trục y thứ hai
                    type: 'linear',
                    position: 'right', // Vị trí của trục y thứ hai
                    ticks: {
                        fontSize: 15,
                        beginAtZero: true,
                        fontColor: 'black',
                        fontStyle: 'bold',
                        //max: 300, // Đặt giá trị tối đa của trục y là 100
                        // min: -300,   // (Tùy chọn) Đặt giá trị tối thiểu nếu cần
                        //stepSize: 300 // (Tùy chọn) Đặt khoảng cách giữa các giá trị trên trục y
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
                    fontColor: 'black',
                    fontStyle: 'bold',
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

                    // 🟦 PHẦN 1: Vẽ giá trị trên đầu mỗi cột
                    this.data.datasets.forEach(function (dataset, i) {
                        if (i < 2) {
                            var meta = chartInstance.controller.getDatasetMeta(i);
                            meta.data.forEach(function (bar, index) {
                                var data = dataset.data[index];
                                ctx.fillText(data, bar._model.x, bar._model.y);
                            });
                        }

                      
                    });

                    // 🟥 PHẦN 2: Vẽ độ lệch (diff) dưới chân cột
                    var datasets = this.data.datasets;

                    // Giả sử dataset[1] = Plan, dataset[2] = Actual
                    var planData = datasets[0].data;
                    var actualData = datasets[1].data;
                    var metaActual = chartInstance.getDatasetMeta(1); // ⚠️ bạn nên lấy meta của "Actual" (index = 2)

                    metaActual.data.forEach(function (bar, index) {
                        var diff = actualData[index] - planData[index];
                        var baseY = bar._model.base;
                        var x = bar._model.x;
                        var y = baseY + 5; // dịch xuống 15px để không chồng chữ

                        ctx.fillStyle = diff >= 0 ? 'green' : 'red';
                        ctx.textBaseline = 'top'; // 🟩 vẽ dưới chân thì nên để “top”
                        ctx.fillText(diff, x, y);
                    });
                }
            }

        };
        var QuantityPerHourchart = $('#QuantityPerHourchart').get(0).getContext('2d')
        var QuantityPerHourchartCanvas = new Chart(QuantityPerHourchart, {
            type: 'bar',
            data: DataQuantityPerHourchart,
            options: QuantityPerHourChartOption
        })
        //
        function UpdateDashboard(data) {
            $('#plan').html(data.TotalPlan);
            $('#plantime').html(data.TimePlan);
            $('#actual').html(data.Actual);
            $('#diff').html(data.Diff);
            $('#remain').html(data.Remain);
        }
        function UpdateChartQuantityPerTime(data) {
            DataQuantityPerTimechart.datasets[0].data = data.dataplan;
            DataQuantityPerTimechart.datasets[1].data = data.dataactual;
            DataQuantityPerTimechart.datasets[2].data = data.datadiff;
            var shift = data.shift;
            var typeplan = data.typeplan;
            if (typeplan == '2_10') {


                DataQuantityPerTimechart.labels = ['12:00', '12:05', '12:10', '12:15', '12:20', '12:25', '12:30', '12:35', '12:40', '12:45', '12:50', '12:55', '13:00', '13:05', '13:10', '13:15', '13:20', '13:25', '13:30', '13:35', '13:40', '13:45', '13:50', '13:55', '14:00', '14:05', '14:10', '14:15', '14:20', '14:25', '14:30', '14:35', '14:40', '14:45', '14:50', '14:55', '15:00', '15:05', '15:10', '15:15', '15:20', '15:25', '15:30', '15:35', '15:40', '15:45', '15:50', '15:55', '16:00', '16:05', '16:10', '16:15', '16:20', '16:25', '16:30', '16:35', '16:40', '16:45', '16:50', '16:55', '17:00', '17:05', '17:10', '17:15', '17:20', '17:25', '17:30', '17:35', '17:40', '17:45', '17:50', '17:55', '18:00', '18:05', '18:10', '18:15', '18:20', '18:25', '18:30', '18:35', '18:40', '18:45', '18:50', '18:55', '19:00', '19:05', '19:10', '19:15', '19:20', '19:25', '19:30', '19:35', '19:40', '19:45', '19:50', '19:55', '20:00', '20:05', '20:10', '20:15', '20:20', '20:25', '20:30', '20:35', '20:40', '20:45', '20:50', '20:55', '21:00', '21:05', '21:10', '21:15', '21:20', '21:25', '21:30', '21:35', '21:40', '21:45', '21:50', '21:55', '22:00', '22:05', '22:10', '22:15', '22:20', '22:25', '22:30', '22:35', '22:40', '22:45', '22:50', '22:55', '23:00', '23:05', '23:10', '23:15', '23:20', '23:25', '23:30', '23:35', '23:40', '23:45', '23:50', '23:55', '0:00', '0:05', '0:10', '0:15', '0:20', '0:25', '0:30', '0:35', '0:40', '0:45', '0:50', '0:55', '1:00', '1:05', '1:10', '1:15', '1:20', '1:25', '1:30', '1:35', '1:40', '1:45', '1:50', '1:55', '2:00', '2:05', '2:10', '2:15', '2:20', '2:25', '2:30', '2:35', '2:40', '2:45', '2:50', '2:55', '3:00', '3:05', '3:10', '3:15', '3:20', '3:25', '3:30', '3:35', '3:40', '3:45', '3:50', '3:55', '4:00', '4:05', '4:10', '4:15', '4:20', '4:25', '4:30', '4:35', '4:40', '4:45', '4:50', '4:55', '5:00', '5:05', '5:10', '5:15', '5:20', '5:25', '5:30', '5:35', '5:40', '5:45', '5:50', '5:55', '6:00', '6:05', '6:10', '6:15', '6:20', '6:25', '6:30', '6:35', '6:40', '6:45', '6:50', '6:55', '7:00', '7:05', '7:10', '7:15', '7:20', '7:25', '7:30', '7:35', '7:40', '7:45', '7:50', '7:55', '8:00'];

            }
            else if (typeplan == '2_12') {

                DataQuantityPerTimechart.labels = ['10:00', '10:05', '10:10', '10:15', '10:20', '10:25', '10:30', '10:35', '10:40', '10:45', '10:50', '10:55', '11:00', '11:05', '11:10', '11:15', '11:20', '11:25', '11:30', '11:35', '11:40', '11:45', '11:50', '11:55', '12:00', '12:05', '12:10', '12:15', '12:20', '12:25', '12:30', '12:35', '12:40', '12:45', '12:50', '12:55', '13:00', '13:05', '13:10', '13:15', '13:20', '13:25', '13:30', '13:35', '13:40', '13:45', '13:50', '13:55', '14:00', '14:05', '14:10', '14:15', '14:20', '14:25', '14:30', '14:35', '14:40', '14:45', '14:50', '14:55', '15:00', '15:05', '15:10', '15:15', '15:20', '15:25', '15:30', '15:35', '15:40', '15:45', '15:50', '15:55', '16:00', '16:05', '16:10', '16:15', '16:20', '16:25', '16:30', '16:35', '16:40', '16:45', '16:50', '16:55', '17:00', '17:05', '17:10', '17:15', '17:20', '17:25', '17:30', '17:35', '17:40', '17:45', '17:50', '17:55', '18:00', '18:05', '18:10', '18:15', '18:20', '18:25', '18:30', '18:35', '18:40', '18:45', '18:50', '18:55', '19:00', '19:05', '19:10', '19:15', '19:20', '19:25', '19:30', '19:35', '19:40', '19:45', '19:50', '19:55', '20:00', '20:05', '20:10', '20:15', '20:20', '20:25', '20:30', '20:35', '20:40', '20:45', '20:50', '20:55', '21:00', '21:05', '21:10', '21:15', '21:20', '21:25', '21:30', '21:35', '21:40', '21:45', '21:50', '21:55', '22:00', '22:05', '22:10', '22:15', '22:20', '22:25', '22:30', '22:35', '22:40', '22:45', '22:50', '22:55', '23:00', '23:05', '23:10', '23:15', '23:20', '23:25', '23:30', '23:35', '23:40', '23:45', '23:50', '23:55', '0:00', '0:05', '0:10', '0:15', '0:20', '0:25', '0:30', '0:35', '0:40', '0:45', '0:50', '0:55', '1:00', '1:05', '1:10', '1:15', '1:20', '1:25', '1:30', '1:35', '1:40', '1:45', '1:50', '1:55', '2:00', '2:05', '2:10', '2:15', '2:20', '2:25', '2:30', '2:35', '2:40', '2:45', '2:50', '2:55', '3:00', '3:05', '3:10', '3:15', '3:20', '3:25', '3:30', '3:35', '3:40', '3:45', '3:50', '3:55', '4:00', '4:05', '4:10', '4:15', '4:20', '4:25', '4:30', '4:35', '4:40', '4:45', '4:50', '4:55', '5:00', '5:05', '5:10', '5:15', '5:20', '5:25', '5:30', '5:35', '5:40', '5:45', '5:50', '5:55', '6:00', '6:05', '6:10', '6:15', '6:20', '6:25', '6:30', '6:35', '6:40', '6:45', '6:50', '6:55', '7:00', '7:05', '7:10', '7:15', '7:20', '7:25', '7:30', '7:35', '7:40', '7:45', '7:50', '7:55', '8:00', '8:05', '8:10', '8:15', '8:20', '8:25', '8:30', '8:35', '8:40', '8:45', '8:50', '8:55', '9:00', '9:05', '9:10', '9:15', '9:20', '9:25', '9:30', '9:35', '9:40', '9:45', '9:50', '9:55', '10:00'];


            }
            else if (typeplan == '2_12_6') {

                DataQuantityPerTimechart.labels = ['6:00', '6:05', '6:10', '6:15', '6:20', '6:25', '6:30', '6:35', '6:40', '6:45', '6:50', '6:55', '7:00', '7:05', '7:10', '7:15', '7:20', '7:25', '7:30', '7:35', '7:40', '7:45', '7:50', '7:55', '8:00', '8:05', '8:10', '8:15', '8:20', '8:25', '8:30', '8:35', '8:40', '8:45', '8:50', '8:55', '9:00', '9:05', '9:10', '9:15', '9:20', '9:25', '9:30', '9:35', '9:40', '9:45', '9:50', '9:55', '10:00', '10:05', '10:10', '10:15', '10:20', '10:25', '10:30', '10:35', '10:40', '10:45', '10:50', '10:55', '11:00', '11:05', '11:10', '11:15', '11:20', '11:25', '11:30', '11:35', '11:40', '11:45', '11:50', '11:55', '12:00', '12:05', '12:10', '12:15', '12:20', '12:25', '12:30', '12:35', '12:40', '12:45', '12:50', '12:55', '13:00', '13:05', '13:10', '13:15', '13:20', '13:25', '13:30', '13:35', '13:40', '13:45', '13:50', '13:55', '14:00', '14:05', '14:10', '14:15', '14:20', '14:25', '14:30', '14:35', '14:40', '14:45', '14:50', '14:55', '15:00', '15:05', '15:10', '15:15', '15:20', '15:25', '15:30', '15:35', '15:40', '15:45', '15:50', '15:55', '16:00', '16:05', '16:10', '16:15', '16:20', '16:25', '16:30', '16:35', '16:40', '16:45', '16:50', '16:55', '17:00', '17:05', '17:10', '17:15', '17:20', '17:25', '17:30', '17:35', '17:40', '17:45', '17:50', '17:55', '18:00', '18:05', '18:10', '18:15', '18:20', '18:25', '18:30', '18:35', '18:40', '18:45', '18:50', '18:55', '19:00', '19:05', '19:10', '19:15', '19:20', '19:25', '19:30', '19:35', '19:40', '19:45', '19:50', '19:55', '20:00', '20:05', '20:10', '20:15', '20:20', '20:25', '20:30', '20:35', '20:40', '20:45', '20:50', '20:55', '21:00', '21:05', '21:10', '21:15', '21:20', '21:25', '21:30', '21:35', '21:40', '21:45', '21:50', '21:55', '22:00', '22:05', '22:10', '22:15', '22:20', '22:25', '22:30', '22:35', '22:40', '22:45', '22:50', '22:55', '23:00', '23:05', '23:10', '23:15', '23:20', '23:25', '23:30', '23:35', '23:40', '23:45', '23:50', '23:55', '0:00', '0:05', '0:10', '0:15', '0:20', '0:25', '0:30', '0:35', '0:40', '0:45', '0:50', '0:55', '1:00', '1:05', '1:10', '1:15', '1:20', '1:25', '1:30', '1:35', '1:40', '1:45', '1:50', '1:55', '2:00', '2:05', '2:10', '2:15', '2:20', '2:25', '2:30', '2:35', '2:40', '2:45', '2:50', '2:55', '3:00', '3:05', '3:10', '3:15', '3:20', '3:25', '3:30', '3:35', '3:40', '3:45', '3:50', '3:55', '4:00', '4:05', '4:10', '4:15', '4:20', '4:25', '4:30', '4:35', '4:40', '4:45', '4:50', '4:55', '5:00', '5:05', '5:10', '5:15', '5:20', '5:25', '5:30', '5:35', '5:40', '5:45', '5:50', '5:55', '6:00'];


            }
            else {

                DataQuantityPerTimechart.labels = ['06:00', '06:05', '06:10', '06:15', '06:20', '06:25', '06:30', '06:35', '06:40', '06:45', '06:50', '06:55', '07:00', '07:05', '07:10', '07:15', '07:20', '07:25', '07:30', '07:35', '07:40', '07:45', '07:50', '07:55', '08:00', '08:05', '08:10', '08:15', '08:20', '08:25', '08:30', '08:35', '08:40', '08:45', '08:50', '08:55', '09:00', '09:05', '09:10', '09:15', '09:20', '09:25', '09:30', '09:35', '09:40', '09:45', '09:50', '09:55', '10:00', '10:05', '10:10', '10:15', '10:20', '10:25', '10:30', '10:35', '10:40', '10:45', '10:50', '10:55', '11:00', '11:05', '11:10', '11:15', '11:20', '11:25', '11:30', '11:35', '11:40', '11:45', '11:50', '11:55', '12:00', '12:05', '12:10', '12:15', '12:20', '12:25', '12:30', '12:35', '12:40', '12:45', '12:50', '12:55', '13:00', '13:05', '13:10', '13:15', '13:20', '13:25', '13:30', '13:35', '13:40', '13:45', '13:50', '13:55', '14:00', '14:05', '14:10', '14:15', '14:20', '14:25', '14:30', '14:35', '14:40', '14:45', '14:50', '14:55', '15:00', '15:05', '15:10', '15:15', '15:20', '15:25', '15:30', '15:35', '15:40', '15:45', '15:50', '15:55', '16:00', '16:05', '16:10', '16:15', '16:20', '16:25', '16:30', '16:35', '16:40', '16:45', '16:50', '16:55', '17:00', '17:05', '17:10', '17:15', '17:20', '17:25', '17:30', '17:35', '17:40', '17:45', '17:50', '17:55', '18:00', '18:05', '18:10', '18:15', '18:20', '18:25', '18:30', '18:35', '18:40', '18:45', '18:50', '18:55', '19:00', '19:05', '19:10', '19:15', '19:20', '19:25', '19:30', '19:35', '19:40', '19:45', '19:50', '19:55', '20:00', '20:05', '20:10', '20:15', '20:20', '20:25', '20:30', '20:35', '20:40', '20:45', '20:50', '20:55', '21:00', '21:05', '21:10', '21:15', '21:20', '21:25', '21:30', '21:35', '21:40', '21:45', '21:50', '21:55', '22:00', '22:05', '22:10', '22:15', '22:20', '22:25', '22:30', '22:35', '22:40', '22:45', '22:50', '22:55', '23:00', '23:05', '23:10', '23:15', '23:20', '23:25', '23:30', '23:35', '23:40', '23:45', '23:50', '23:55', '00:00', '00:05', '00:10', '00:15', '00:20', '00:25', '00:30', '00:35', '00:40', '00:45', '00:50', '00:55', '01:00', '01:05', '01:10', '01:15', '01:20', '01:25', '01:30', '01:35', '01:40', '01:45', '01:50', '01:55', '02:00', '02:05', '02:10', '02:15', '02:20', '02:25', '02:30', '02:35', '02:40', '02:45', '02:50', '02:55', '03:00', '03:05', '03:10', '03:15', '03:20', '03:25', '03:30', '03:35', '03:40', '03:45', '03:50', '03:55', '04:00', '04:05', '04:10', '04:15', '04:20', '04:25', '04:30', '04:35', '04:40', '04:45', '04:50', '04:55', '05:00', '05:05', '05:10', '05:15', '05:20', '05:25', '05:30', '05:35', '05:40', '05:45', '05:50', '05:55', '06:00'];

            }
            QuantityPerTimechartCanvas.update();
        }
        function UpdateChartQuantityByModel(data) {
            dataquantitybymodel.datasets[0].data = data.dataplan;
            dataquantitybymodel.datasets[1].data = data.dataplanpertime;
            dataquantitybymodel.datasets[2].data = data.dataactual;
            dataquantitybymodel.labels = data.labels;
            var max = Math.max(...data.dataplan);



            QuantityByModelChart.options.scales.yAxes[0].ticks.max = max + Math.ceil(max / 4);
            //barchartplan.options = barChartOptions;
            var data1 = data.dataactual;
            var data2 = data.dataplanpertime;
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
            dataquantitybymodel.datasets[2].backgroundColor = bgr;
            QuantityByModelChart.update();
        }
        //function UpdateChartQuantityByModelMonitor(data) {
        //    dataquantitybymodelmonitor.datasets[0].data = data.dataplan;
        //    dataquantitybymodelmonitor.datasets[1].data = data.dataplanpertime;
        //    dataquantitybymodelmonitor.datasets[2].data = data.dataactual;
        //    dataquantitybymodelmonitor.labels = data.labels;
        //    var max = Math.max(...data.dataplan);



        //    QuantityByModelChartMonitor.options.scales.yAxes[0].ticks.max = max + Math.ceil(max / 4);
        //    //barchartplan.options = barChartOptions;
        //    var data1 = data.dataactual;
        //    var data2 = data.dataplanpertime;
        //    var bgr = [];
        //    data1.forEach(function (value1, index) {
        //        var value2 = data2[index];
        //        if (value1 < value2) {
        //            bgr.push('red')
        //        }
        //        else {
        //            bgr.push('green')
        //        }
        //    });
        //    dataquantitybymodelmonitor.datasets[2].backgroundColor = bgr;
        //    QuantityByModelChartMonitor.update();
        //}
        function UpdateChartQuantityPerHour(data) {
            DataQuantityPerHourchart.datasets[0].data = data.dataplan;
            DataQuantityPerHourchart.datasets[1].data = data.dataactual;
            DataQuantityPerHourchart.datasets[2].data = data.datadiff;
            //DataQuantityPerHourchart.datasets[3].data = data.datadifftotal;
            var shift = data.shift;
            var typeplan = data.typeplan;
            if (typeplan == '2_10') {

                DataQuantityPerHourchart.labels = ['12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00', '21:00', '22:00', '23:00', '0:00', '1:00', '2:00', '3:00', '4:00', '5:00', '6:00', '7:00', '8:00'];

            }
            else if (typeplan == '2_12') {

                DataQuantityPerHourchart.labels = ['10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00', '21:00', '22:00', '23:00', '0:00', '1:00', '2:00', '3:00', '4:00', '5:00', '6:00', '7:00', '8:00', '9:00', '10:00'];


            }
            else if (typeplan == '2_12_6') {

                DataQuantityPerHourchart.labels = ['6:00', '7:00', '8:00', '9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00', '21:00', '22:00', '23:00', '0:00', '1:00', '2:00', '3:00', '4:00', '5:00', '6:00']


            }
            else {

                DataQuantityPerHourchart.labels = ['6:00', '7:00', '8:00', '9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00', '21:00', '22:00', '23:00', '0:00', '1:00', '2:00', '3:00', '4:00', '5:00', '6:00'];
            }


            var max = Math.max(...data.dataplan);



            QuantityPerHourchartCanvas.options.scales.yAxes[0].ticks.max = max + Math.ceil(max / 4);

            //var data1 = data.datadiff;
            //var data2 = data.datadifftotal;
            //var bgr = [];
            //data1.forEach(function (value1, index) {

            //    if (value1 < 0) {
            //        bgr.push('red')
            //    }
            //    else {
            //        bgr.push('green')
            //    }
            //});
            //var bgr2 = [];
            //data2.forEach(function (value1, index) {

            //    if (value1 < 0) {
            //        bgr2.push('orange')
            //    }
            //    else {
            //        bgr2.push('green')
            //    }
            //});
            //DataQuantityPerHourchart.datasets[2].borderColor = bgr;
            //DataQuantityPerHourchart.datasets[3].borderColor = bgr2;


            QuantityPerHourchartCanvas.update();
        }
        function UpdateChartQuantityByModelGroup(data) {
            dataquantitybygroupmodel.datasets[0].data = data.dataplan;
            dataquantitybygroupmodel.datasets[1].data = data.dataplanpertime;
            dataquantitybygroupmodel.datasets[2].data = data.dataactual;
            dataquantitybygroupmodel.labels = data.labels;

            var max = Math.max(...data.dataplan);
            QuantityByGroupModelChart.options.scales.yAxes[0].ticks.max = max + Math.ceil(max / 4);




            //barchartplan.options = barChartOptions;
            var data1 = data.dataactual;
            var data2 = data.dataplanpertime;
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
            dataquantitybygroupmodel.datasets[2].backgroundColor = bgr;
            QuantityByGroupModelChart.update();
        }
        $(document).ready(function () {

            // Kiểm tra SignalR
            if (typeof $.connection === 'undefined') {
                console.error("SignalR not loaded. Check jQuery and signalr/hubs scripts.");
                return;
            }
            // Kết nối tới SignalR Hub
            //$.connection.hub.qs = { page: "Urethan" };
            var hub = $.connection.UrethanHub;
            var isUpdating = true;
            var interactionTimeout;


            // Xử lý khi nhận dữ liệu mới
            hub.client.updateData = function (data) {
                if (!isUpdating) return;

                UpdateDashboard(data.QuantityPerTimechartCanvas);
                UpdateChartQuantityPerTime(data.QuantityPerTimechartCanvas);
                UpdateChartQuantityByModel(data.quantityByModel);
               /* UpdateChartQuantityByModelMonitor(data.quantityByModelMonitor)*/
                UpdateChartQuantityPerHour(data.quantityPerHour);
                UpdateChartQuantityByModelGroup(data.quantityByModelgroup)



            };
            // Bắt đầu kết nối SignalR
            $.connection.hub.start().done(function () {
                console.log("SignalR connected");
                hub.server.getInitialData();
            }).fail(function (error) {
                console.error("SignalR connection failed: ", error);
            });
        });


    </script>
</asp:Content>
