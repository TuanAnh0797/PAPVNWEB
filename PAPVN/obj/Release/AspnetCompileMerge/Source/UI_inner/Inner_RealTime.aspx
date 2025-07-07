<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inner_RealTime.aspx.cs" Inherits="PAPVN.UI_inner.Inner_RealTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .oee-card {
            text-align: center;
            padding: 20px;
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
        /**/


        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .status-active {
            background-color: #d4edda;
            color: #155724;
        }

        .status-completed {
            background-color: #cce5ff;
            color: #004085;
        }

        .status-delayed {
            background-color: #f8d7da;
            color: #721c24;
        }



        .station-card {
            background: white;
            border-radius: 15px;
            padding: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            cursor: pointer;
            border-left: 5px solid #667eea;
            margin-bottom: 5px;
        }

            .station-card:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 15px rgba(0, 0, 0, 0.15);
            }

            .station-card.active {
                border-left-color: #28a745;
                background: linear-gradient(135deg, #d4edda 0%, #ffffff 100%);
            }

            .station-card.idle {
                border-left-color: #ffc107;
                background: linear-gradient(135deg, #fff3cd 0%, #ffffff 100%);
            }

            .station-card.maintenance {
                border-left-color: #dc3545;
                background: linear-gradient(135deg, #f8d7da 0%, #ffffff 100%);
            }

        .station-title {
            font-size: 1.3rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        .station-status {
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .station-info {
            margin-top: 15px;
        }

        .station-metric {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 2px 0;
            border-bottom: 1px solid #eee;
        }

            .station-metric:last-child {
                border-bottom: none;
            }

        .metric-label {
            color: #666;
            font-size: 0.9rem;
        }

        .metric-value {
            font-weight: bold;
            color: #333;
        }

        .current-task {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 10px;
            margin-top: 5px;
        }

        .task-serial {
            font-family: 'Courier New', monospace;
            background: #e9ecef;
            padding: 2px 6px;
            border-radius: 4px;
            font-size: 0.8rem;
        }

        .filter-section {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .worker-avatar {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 0.8rem;
            margin-right: 5px;
        }
    </style>


    <%-- Row 1 --%>
    <div class="ml-1 mr-1 bg-info">
        <h1 class="mb-0 ml-4" style="font-weight: 600; color: white">Inner & Linner DASH BOARD</h1>
    </div>
    <%-- Row 2 --%>
    <div class=" row p-0 ml-2 mr-2">
        <div class="oee-card bg-blue col m-2">
            <h2 style="font-weight: 600">Plan Quantity</h2>
            <div class="value" id="PlanQuantity"></div>
            <%-- <small>Thời gian hoạt động</small>--%>
        </div>
        <div class="oee-card bg-success col m-2">
            <h2 style="font-weight: 600">OK Quantity</h2>
            <div class="value" id="OkQuantity"></div>
            <%-- <small>Hiệu suất sản xuất</small>--%>
        </div>
        <div class="oee-card bg-danger col m-2">
            <h2 style="font-weight: 600">NG Quantity</h2>
            <div class="value" id="NgQuantity"></div>
            <%-- <small>Chất lượng sản phẩm</small>--%>
        </div>
        <div class="oee-card bg-warning col m-2">
            <h2 style="font-weight: 600; color: white">Remaining Quantity</h2>
            <div style="color: white" class="value" id="RemainQuantity"></div>
            <%-- <small>Hiệu quả tổng thể</small>--%>
        </div>
    </div>
    <!-- Station Cards -->

    <div class="row m-2">
        <div class="col card shadow p-0 mr-2 mb-0">
            <div id="stationCards" class=" row p-2">
            </div>
        </div>


        <div class="col card shadow p-0 m-0">
            <div class="card-header p-2 bg-gradient-gray text-center">
                <h5 class="m-0">Output graph over time</h5>
            </div>
            <div class="card-body p-2">
                <div class="chart-container">
                    <canvas id="chart_quantitybytime" style="min-height: 500px; height: 100%; max-height:1000px ";></canvas>
                </div>

            </div>
        </div>
    </div>
    <div class="card shadow p-0 mr-2 ml-2">
        <div class="card-header p-2 bg-gradient-gray text-center">
            <h5 class="m-0">Evaluation table</h5>
        </div>
        <div class="card-body p-1">
            <table style="padding-left: 5px; padding-right: 5px; padding-bottom: 10px; padding-top: 10px" id="dataTable" class="table table-striped table-bordered text-center">
                <thead style="background-color: #b2bac2; color: black">
                    <tr class="p-0">
                        <th class="p-1">Name </th>
                        <th class="p-1">EmpID</th>
                        <th class="p-1">Dep.</th>
                        <th class="p-1">Main Skill</th>
                        <th class="p-1">Score</th>
                        <th class="p-1">Skill 1</th>
                        <th class="p-1">Score 1</th>
                        <th class="p-1">Skill 2</th>
                        <th class="p-1">Score 2</th>
                        <th class="p-1">Skill 3</th>
                        <th class="p-1">Score 3</th>
                        <th class="p-1">Total Score</th>
                        <th class="p-1">Evaluate</th>
                        <th class="p-1">Evaluate</th>
                        <th class="p-1">Need Traning</th>

                    </tr>
                </thead>
                <tbody id="tableBody" class="p-0" style="font-size: 14px">
                    <tr class="p-0 bg-danger">
                        <td class="p-1">Nguyen Van A</td>
                        <td class="p-1">E001</td>
                        <td class="p-1">Assembly</td>
                        <td class="p-1">Lắp ráp linner C33</td>
                        <td class="p-1">2</td>
                        <td class="p-1">Lắp ráp linner GARD</td>
                        <td class="p-1">1</td>
                        <td class="p-1">Lắp ráp linner BV</td>
                        <td class="p-1">3</td>
                        <td class="p-1">Lắp ráp linner BL</td>
                        <td class="p-1">2</td>
                        <td class="p-1">8</td>
                        <td class="p-1">Below Average</td>
                        <td class="p-1">Needs Improvement</td>
                        <td class="p-1">YES</td>
                    </tr>

                    <tr class="p-0 ">
                        <td class="p-1">Tran Thi B</td>
                        <td class="p-1">E002</td>
                        <td class="p-1">Assembly</td>
                        <td class="p-1">Lắp ráp linner GARD</td>
                        <td class="p-1">4</td>
                        <td class="p-1">Lắp ráp linner BL</td>
                        <td class="p-1">3</td>
                        <td class="p-1">Lắp ráp linner C37</td>
                        <td class="p-1">2</td>
                        <td class="p-1">Lắp ráp linner C33</td>
                        <td class="p-1">3</td>
                        <td class="p-1">12</td>
                        <td class="p-1">Good</td>
                        <td class="p-1">Satisfactory</td>
                        <td class="p-1">NO</td>
                    </tr>

                    <tr class="p-0  bg-danger">
                        <td class="p-1">Le Van C</td>
                        <td class="p-1">E003</td>
                        <td class="p-1">Assembly</td>
                        <td class="p-1">Lắp ráp linner BV</td>
                        <td class="p-1">1</td>
                        <td class="p-1">Lắp ráp linner GARD</td>
                        <td class="p-1">2</td>
                        <td class="p-1">Lắp ráp linner C37</td>
                        <td class="p-1">2</td>
                        <td class="p-1">Lắp ráp linner BL</td>
                        <td class="p-1">1</td>
                        <td class="p-1">6</td>
                        <td class="p-1">Poor</td>
                        <td class="p-1">Needs Training</td>
                        <td class="p-1">YES</td>
                    </tr>

                    <tr class="p-0">
                        <td class="p-1">Pham Thi D</td>
                        <td class="p-1">E004</td>
                        <td class="p-1">Assembly</td>
                        <td class="p-1">Lắp ráp linner BL</td>
                        <td class="p-1">5</td>
                        <td class="p-1">Lắp ráp linner C37</td>
                        <td class="p-1">4</td>
                        <td class="p-1">Lắp ráp linner BV</td>
                        <td class="p-1">3</td>
                        <td class="p-1">Lắp ráp linner C33</td>
                        <td class="p-1">5</td>
                        <td class="p-1">17</td>
                        <td class="p-1">Excellent</td>
                        <td class="p-1">Outstanding</td>
                        <td class="p-1">NO</td>
                    </tr>

                    <tr class="p-0">
                        <td class="p-1">Do Van E</td>
                        <td class="p-1">E005</td>
                        <td class="p-1">Assembly</td>
                        <td class="p-1">Lắp ráp linner C37</td>
                        <td class="p-1">3</td>
                        <td class="p-1">Lắp ráp linner C33</td>
                        <td class="p-1">2</td>
                        <td class="p-1">Lắp ráp linner GARD</td>
                        <td class="p-1">3</td>
                        <td class="p-1">Lắp ráp linner BV</td>
                        <td class="p-1">2</td>
                        <td class="p-1">10</td>
                        <td class="p-1">Average</td>
                        <td class="p-1">Acceptable</td>
                        <td class="p-1">NO</td>
                    </tr>

                </tbody>
            </table>

        </div>
    </div>

    <script>
        // Sample data - replace with your actual data source
        const productionData = [
            {
                id: 1,
                time: '2024-06-15 08:30:00',
                station: 'A1',
                model: 'Model-X1',
                serial: 'SN001234',
                operationTime: 245,
                worker1: 'Nguyễn Văn A',
                worker2: 'Trần Thị B',
                status: 'completed'
            },
            {
                id: 2,
                time: '2024-06-15 09:15:00',
                station: 'A2',
                model: 'Model-X2',
                serial: 'SN001235',
                operationTime: 320,
                worker1: 'Lê Văn C',
                worker2: 'Phạm Thị D',
                status: 'active'
            },
            {
                id: 3,
                time: '2024-06-15 10:00:00',
                station: 'B1',
                model: 'Model-Y1',
                serial: 'SN001236',
                operationTime: 180,
                worker1: 'Hoàng Văn E',
                worker2: 'Nguyễn Thị F',
                status: 'completed'
            },
            {
                id: 4,
                time: '2024-06-15 10:45:00',
                station: 'B2',
                model: 'Model-X1',
                serial: 'SN001237',
                operationTime: 420,
                worker1: 'Đỗ Văn G',
                worker2: 'Lý Thị H',
                status: 'delayed'
            },
            {
                id: 5,
                time: '2024-06-15 11:30:00',
                station: 'A1',
                model: 'Model-Y1',
                serial: 'SN001238',
                operationTime: 195,
                worker1: 'Nguyễn Văn A',
                worker2: 'Trần Thị B',
                status: 'active'
            }
        ];
        let filteredData = [...productionData];

        // Initialize dashboard
        $(document).ready(function () {
            renderStationCards();
            // Khởi tạo DataTable
            var table = $('#dataTable').DataTable({
                pageLength: 10,
                lengthChange: false,
                paging: true,
                searching: false,
                ordering: false,
                info: false,


            });

            // Chart
            var DataLineChart = {
                labels: ['06:00', '06:05', '06:10', '06:15', '06:20', '06:25', '06:30', '06:35', '06:40', '06:45', '06:50', '06:55', '07:00', '07:05', '07:10', '07:15', '07:20', '07:25', '07:30', '07:35', '07:40', '07:45', '07:50', '07:55', '08:00', '08:05', '08:10', '08:15', '08:20', '08:25', '08:30', '08:35', '08:40', '08:45', '08:50', '08:55', '09:00', '09:05', '09:10', '09:15', '09:20', '09:25', '09:30', '09:35', '09:40', '09:45', '09:50', '09:55', '10:00', '10:05', '10:10', '10:15', '10:20', '10:25', '10:30', '10:35', '10:40', '10:45', '10:50', '10:55', '11:00', '11:05', '11:10', '11:15', '11:20', '11:25', '11:30', '11:35', '11:40', '11:45', '11:50', '11:55', '12:00', '12:05', '12:10', '12:15', '12:20', '12:25', '12:30', '12:35', '12:40', '12:45', '12:50', '12:55', '13:00', '13:05', '13:10', '13:15', '13:20', '13:25', '13:30', '13:35', '13:40', '13:45', '13:50', '13:55', '14:00', '14:05', '14:10', '14:15', '14:20', '14:25', '14:30', '14:35', '14:40', '14:45', '14:50', '14:55', '15:00', '15:05', '15:10', '15:15', '15:20', '15:25', '15:30', '15:35', '15:40', '15:45', '15:50', '15:55', '16:00', '16:05', '16:10', '16:15', '16:20', '16:25', '16:30', '16:35', '16:40', '16:45', '16:50', '16:55', '17:00', '17:05', '17:10', '17:15', '17:20', '17:25', '17:30', '17:35', '17:40', '17:45', '17:50', '17:55', '18:00', '18:05', '18:10', '18:15', '18:20', '18:25', '18:30', '18:35', '18:40', '18:45', '18:50', '18:55', '19:00', '19:05', '19:10', '19:15', '19:20', '19:25', '19:30', '19:35', '19:40', '19:45', '19:50', '19:55', '20:00', '20:05', '20:10', '20:15', '20:20', '20:25', '20:30', '20:35', '20:40', '20:45', '20:50', '20:55', '21:00', '21:05', '21:10', '21:15', '21:20', '21:25', '21:30', '21:35', '21:40', '21:45', '21:50', '21:55', '22:00', '22:05', '22:10', '22:15', '22:20', '22:25', '22:30', '22:35', '22:40', '22:45', '22:50', '22:55', '23:00', '23:05', '23:10', '23:15', '23:20', '23:25', '23:30', '23:35', '23:40', '23:45', '23:50', '23:55', '00:00', '00:05', '00:10', '00:15', '00:20', '00:25', '00:30', '00:35', '00:40', '00:45', '00:50', '00:55', '01:00', '01:05', '01:10', '01:15', '01:20', '01:25', '01:30', '01:35', '01:40', '01:45', '01:50', '01:55', '02:00', '02:05', '02:10', '02:15', '02:20', '02:25', '02:30', '02:35', '02:40', '02:45', '02:50', '02:55', '03:00', '03:05', '03:10', '03:15', '03:20', '03:25', '03:30', '03:35', '03:40', '03:45', '03:50', '03:55', '04:00', '04:05', '04:10', '04:15', '04:20', '04:25', '04:30', '04:35', '04:40', '04:45', '04:50', '04:55', '05:00', '05:05', '05:10', '05:15', '05:20', '05:25', '05:30', '05:35', '05:40', '05:45', '05:50', '05:55', '06:00'],
                datasets: [
                    {
                        type: 'line',
                        yAxisID: 'y', // Thay đổi từ 'y-axis-1' thành 'y'
                        label: 'Plan',
                        borderColor: 'rgb(75, 192, 192)',
                        //data: [0, 10, 20, 30, 40, 40, 40, 60, 80, 90, 100, 110],
                        fill: false,
                        //tension: 0, // làm line đỡ mượt
                        borderWidth: 2,
                        pointRadius: 2,

                    },
                    {
                        type: 'line',
                        yAxisID: 'y', // Thay đổi từ 'y-axis-1' thành 'y'
                        label: 'Actual',
                        borderColor: '#b38600',
                        //data: [0, 10, 20, 30, 40, 40, 40, 60, 80, 85, 101, 120],
                        fill: false,
                        //tension: 0, // làm line đỡ mượt
                        borderWidth: 2,
                        pointRadius: 2,

                    },
                    {
                        type: 'bar',
                        label: 'Diff',
                        backgroundColor: function (context) {
                            var value = context.dataset.data[context.dataIndex];
                            return value < 0 ? 'red' : 'green';
                        },
                        yAxisID: 'y1', // Thay đổi từ 'y-axis-2' thành 'y1'
                        order: 1,
                        //data: [0, 0, 0, 0, 0, 0, 0, 0, 0, -5, 1, 10],

                    }
                ]
            };
            var LineChartOption = {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    x: {
                        ticks: {
                            font: {
                                size: 15,
                                weight: 'bold'
                            },
                            color: 'black'
                        },
                        type: 'category', // Sử dụng linear scale cho trục x
                        position: 'bottom'
                    },
                    y: {
                        beginAtZero: true,
                        type: 'linear',
                        position: 'left', // Vị trí của trục y thứ nhất
                        ticks: {
                            font: {
                                size: 15,
                                weight: 'bold'
                            },
                            color: 'black',
                            beginAtZero: true
                            //max: 3000, // Đặt giá trị tối đa của trục y là 100
                            //min: 0,   // (Tùy chọn) Đặt giá trị tối thiểu nếu cần
                            //stepSize: 300 // (Tùy chọn) Đặt khoảng cách giữa các giá trị trên trục y
                        }
                    },
                    y1: { // Trục y thứ hai
                        type: 'linear',
                        position: 'right', // Vị trí của trục y thứ hai
                        ticks: {
                            font: {
                                size: 15,
                                weight: 'bold'
                            },
                            color: 'black',
                            beginAtZero: true
                            //max: 300, // Đặt giá trị tối đa của trục y là 100
                            //min: -300,   // (Tùy chọn) Đặt giá trị tối thiểu nếu cần
                            //stepSize: 300 // (Tùy chọn) Đặt khoảng cách giữa các giá trị trên trục y
                        },
                        grid: {
                            display: false
                        }
                    }
                },
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            font: {
                                size: 15,
                                weight: 'bold'
                            },
                            color: 'black'
                        }
                    }
                }
            };
            var lineChartCanvas = $('#chart_quantitybytime').get(0).getContext('2d');

            ///
            var linechart = new Chart(lineChartCanvas, {
                type: 'line',
                data: DataLineChart,
                options: LineChartOption
            })
            // Kiểm tra SignalR
            if (typeof $.connection === 'undefined') {
                console.error("SignalR not loaded. Check jQuery and signalr/hubs scripts.");
                return;
            }
            // Kết nối tới SignalR Hub
            var proxy = $.connection.InnerLinerHub;
            var isUpdating = true;
            var interactionTimeout;
            // Bắt đầu kết nối SignalR
            $.connection.hub.start().done(function () {
                console.log("SignalR connected");
                proxy.server.getInitialData();
            }).fail(function (error) {
                console.error("SignalR connection failed: ", error);
            });

            // Xử lý khi nhận dữ liệu mới
            proxy.client.updateData = function (data) {
                if (!isUpdating) return;

                /*Row1*/
                var data_quantityPCM = data.quantityPCM;
                $('#PlanQuantity').html(data_quantityPCM.PlanQuantity);
                $('#OkQuantity').html(data_quantityPCM.OkQuantity);
                $('#NgQuantity').html(data_quantityPCM.NgQuantity);
                $('#RemainQuantity').html(data_quantityPCM.RemainQuantity);
                /*Row2*/
                var data_DataLineChartQuantityPerTime = JSON.parse(data.DataLineChartQuantityPerTime);
                DataLineChart.datasets[0].data = data_DataLineChartQuantityPerTime.dataplan;
                DataLineChart.datasets[1].data = data_DataLineChartQuantityPerTime.dataactual;
                DataLineChart.datasets[2].data = data_DataLineChartQuantityPerTime.datadiff;
                linechart.update();
            };


            // Hàm xử lý tương tác chuột
            function handleMouseInteraction() {
                isUpdating = false;
                clearTimeout(interactionTimeout);

                interactionTimeout = setTimeout(function () {
                    isUpdating = true;
                    //proxy.server.getInitialData();
                }, 5000);
            }
            // Gắn sự kiện chuột trên table
            $('#dataTable').on('mousemove click', handleMouseInteraction);


        });





        function renderStationCards() {
            const stations = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2', 'D1', 'D2'];
            const workers = ['Nguyễn Văn A', 'Trần Thị B', 'Lê Văn C', 'Phạm Thị D', 'Hoàng Văn E', 'Đỗ Văn G', 'Lý Thị H', 'Nguyễn Thị F'];
            const stationContainer = $('#stationCards');
            stationContainer.empty();

            stations.forEach(stationName => {
                const stationTasks = productionData.filter(item => item.station === stationName);
                const currentTask = stationTasks.find(task => task.status === 'active');
                const completedToday = stationTasks.filter(task => task.status === 'completed').length;
                const totalTime = stationTasks.reduce((sum, task) => sum + task.operationTime, 0);
                const avgTime = stationTasks.length > 0 ? Math.round(totalTime / stationTasks.length) : 0;
                const worker = currentTask ? currentTask.worker : workers[Math.floor(Math.random() * workers.length)];


                let stationStatus = 'maintenance';
                let statusText = 'Stop';
                let statusIcon = 'fas fa-exclamation-triangle';

                if (currentTask) {
                    if (currentTask.operationTime > 300) {
                        stationStatus = 'maintenance';
                        statusText = 'Stop';
                        statusIcon = 'fas fa-exclamation-triangle';
                    } else {
                        stationStatus = 'active';
                        statusText = 'Run';
                        statusIcon = 'fas fa-play-circle';
                    }
                }
                const cardHtml = `
                    <div class="col-3 mb-2">
                        <div class="station-card ${stationStatus}" onclick="filterByStation('${stationName}')">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <div class="station-title">
                                    <i class="fas fa-desktop me-2"></i>${stationName}
                                </div>
                                <span class="station-status status-${stationStatus}">
                                    <i class="${statusIcon}"></i> ${statusText}
                                </span>
                            </div>
                            <div class="d-flex align-items-center mb-2">
                               
                                <span class="worker-name">${worker}</span>
                                </div>
                            <div class="station-info">
                                <div class="station-metric">
                                    <span class="metric-label">Average time:</span>
                                    <span class="metric-value">${avgTime}s</span>
                                </div>
                            </div>
                             <div class="station-info">
     <div class="station-metric">
         <span class="metric-label">Number of cycle time passes:</span>
         <span class="metric-value">${avgTime}s</span>
     </div>
 </div>
  <div class="station-info">
     <div class="station-metric">
         <span class="metric-label">Number of cycle time failures:</span>
         <span class="metric-value">${avgTime}s</span>
     </div>
 </div>
                            ${currentTask ? `
                                <div class="current-task">
                                   
                                    <div class="d-flex justify-content-between align-items-center mt-1">
                                        <small class="text-muted">Model:</small>
                                        <strong>${currentTask.model}</strong>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center mt-1">
                                        <small class="text-muted">Cycle Time:</small>
                                        <strong>${currentTask.operationTime}s</strong>
                                    </div>
                                </div>
                            ` : `<div class="current-task">
   
    <div class="d-flex justify-content-between align-items-center mt-1">
        <small class="text-muted">Model:</small>
       
    </div>
    <div class="d-flex justify-content-between align-items-center mt-1">
        <small class="text-muted">Thời gian:</small>
        
    </div>
</div>`}
                        </div>
                    </div>
                `;

                stationContainer.append(cardHtml);
            });
        }




    </script>

</asp:Content>
