<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PCM_RealTime.aspx.cs" Inherits="PAPVN.UI_Cutting.CuttingRealTimeMachine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        h5 {
            font-weight: 600;
            color: white;
        }


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
        .status-item {
            background: linear-gradient(135deg, #f8f9ff, #e8ecff);
            border-radius: 18px;
            padding: 5px;
            margin-bottom: 10px;
            transition: all 0.3s ease;
            border: 1px solid rgba(102, 126, 234, 0.1);
            position: relative;
            overflow: hidden;
        }

            .status-item::before {
                content: '';
                position: absolute;
                left: 0;
                top: 0;
                bottom: 0;
                width: 4px;
                background: var(--accent-color);
                border-radius: 0 4px 4px 0;
            }

            .status-item:hover {
                transform: translateX(5px);
                box-shadow: 0 10px 25px rgba(102, 126, 234, 0.15);
            }

            .status-item.status-running::before {
                background: linear-gradient(135deg, #10b981, #34d399);
            }

            .status-item.status-stopped::before {
                background: linear-gradient(135deg, #ef4444, #f87171);
            }

            .status-item.status-warning::before {
                background: linear-gradient(135deg, #f59e0b, #fbbf24);
            }

            .status-item.status-info::before {
                background: linear-gradient(135deg, #3b82f6, #60a5fa);
            }

        .status-icon {
            width: 50px;
            height: 50px;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
            margin-right: 15px;
            flex-shrink: 0;
        }

            .status-icon.icon-running {
                background: linear-gradient(135deg, #10b981, #34d399);
                color: white;
            }

            .status-icon.icon-stopped {
                background: linear-gradient(135deg, #ef4444, #f87171);
                color: white;
            }

            .status-icon.icon-warning {
                background: linear-gradient(135deg, #f59e0b, #fbbf24);
                color: white;
            }

            .status-icon.icon-info {
                background: linear-gradient(135deg, #3b82f6, #60a5fa);
                color: white;
            }

        .status-content {
            flex: 1;
        }

        .status-label {
            font-weight: 600;
            color: #374151;
            margin-bottom: 0px;
            font-size: 1rem;
        }

        .status-value {
            font-size: 1.1rem;
            font-weight: 700;
            color: #111827;
        }
        /* //*/
        .metric-card {
            background: linear-gradient(135deg, #f8f9ff, #e8ecff);
            border-radius: 18px;
            /* padding: 10px 5px;*/
            text-align: center;
            transition: all 0.3s ease;
            border: 1px solid rgba(102, 126, 234, 0.1);
            position: relative;
            overflow: hidden;
            /*            height: 180px;
*/ display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

            .metric-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: var(--metric-color);
                border-radius: 18px 18px 0 0;
            }

            .metric-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 15px 35px rgba(102, 126, 234, 0.2);
            }

            .metric-card.availability::before {
                background: linear-gradient(135deg, #10b981, #34d399);
            }

            .metric-card.performance::before {
                background: linear-gradient(135deg, #3b82f6, #60a5fa);
            }

            .metric-card.quality::before {
                background: linear-gradient(135deg, #8b5cf6, #a78bfa);
            }

        .metric-icon {
            width: 60px;
            height: 60px;
            border-radius: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
            margin: 0 auto 15px;
        }

            .metric-icon.icon-availability {
                background: linear-gradient(135deg, #10b981, #34d399);
            }

            .metric-icon.icon-performance {
                background: linear-gradient(135deg, #3b82f6, #60a5fa);
            }

            .metric-icon.icon-quality {
                background: linear-gradient(135deg, #8b5cf6, #a78bfa);
            }

        .metric-value {
            font-size: 2.2rem;
            font-weight: 800;
            color: #111827;
            margin-bottom: 0px;
        }

        .metric-label {
            font-size: 0.95rem;
            font-weight: 600;
            color: #6b7280;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .oee-main-value {
            font-size: 2rem;
            font-weight: 800;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            /* margin: 10px 0;*/
            text-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .progress {
            height: 12px;
            border-radius: 10px;
            background: rgba(102, 126, 234, 0.1);
            overflow: hidden;
        }

        .progress-bar {
            border-radius: 10px;
            background: linear-gradient(90deg, #667eea, #764ba2);
            transition: width 1.5s ease;
        }

        @media (max-width: 768px) {
            .oee-main-value {
                font-size: 3rem;
            }

            .metric-card,
            .production-card {
                height: auto;
                padding: 20px 15px;
            }

            .metric-icon {
                width: 50px;
                height: 50px;
                font-size: 1.3rem;
            }

            .metric-value {
                font-size: 1.8rem;
            }

            .production-value {
                font-size: 1.5rem;
            }
        }

        /**/
    </style>
    <%-- Row 1 --%>
    <div class="ml-1 mr-1 bg-info">
        <h1 class="mb-0 ml-4" style="font-weight: 600; color: white">PCM DASH BOARD</h1>
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
    <%-- Row 3 --%>
    <div class="row ml-1 mr-1">
        <!-- Trạng thái hiện tại -->
        <div class="card shadow m-1 col-2 p-0">
            <%-- <div class="card-header p-2 bg-gradient-pink text-center">--%>
            <div class="card-header p-2 bg-gradient-gray text-center">
                <h5 class="mb-0">Status Machine</h5>
            </div>

            <div class="card-body p-1 pl-2 pr-2 pt-3">
                <!-- Trạng thái máy -->
                <div class="status-item status-running d-flex align-items-center">
                    <div class="status-icon icon-running">
                        <i class="bi bi-cpu-fill"></i>
                    </div>
                    <div class="status-content">
                        <div class="status-label">Trạng thái máy</div>
                        <div class="status-value">
                            <span id="txt_statusmachine" class="badge bg-success pulse">
                               <%-- <i class="fas fa-play me-1"></i>--%>
                               
                            </span>
                            <span class="status-indicator indicator-running pulse"></span>
                        </div>
                    </div>
                </div>

                <!-- Nguyên nhân dừng -->
                <div id="stop-reason-container" class="status-item status-stopped d-flex align-items-start">
                    <div class="status-icon icon-stopped">
                        <i class="bi bi-exclamation-triangle-fill"></i>
                    </div>
                    <div class="status-content">
                        <div class="status-label">Nguyên nhân dừng máy</div>
                        <div id="stop-reason" class="stop-reason-text">
                           
                        </div>
                    </div>
                </div>

                <!-- Tổng số lần dừng -->
                <div class="status-item status-warning d-flex align-items-center">
                    <div class="status-icon icon-warning">
                        <i class="bi bi-x-circle-fill"></i>
                    </div>
                    <div class="status-content">
                        <div class="status-label">Tổng số lần dừng trong ca</div>
                        <div class="status-value">
                            <span id="total-stops" class="metric-highlight">3</span>
                            <small class="text-muted ms-1">lần</small>
                        </div>
                    </div>
                </div>

                <!-- Tổng thời gian dừng -->
                <div class="status-item status-info d-flex align-items-center">
                    <div class="status-icon icon-info">
                        <i class="bi bi-clock-history"></i>
                    </div>
                    <div class="status-content">
                        <div class="status-label">Tổng thời gian dừng</div>
                        <div class="status-value">
                            <span id="total-stop-time" class="metric-highlight"></span>
                            <small class="text-muted ms-1">giờ:phút:giây</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Biểu đồ Gantt -->
        <div class="card shadow col m-1 p-0">
            <%--   <div class="card-header p-2 bg-blue text-center">--%>
            <div class="card-header p-2 bg-gradient-gray text-center">
                <h5 class="m-0">Machine state graph over time</h5>
            </div>
            <div class="card-body p-2 ">

                <div class="chart-container">
                    <canvas id="chart_statusmachine" style="min-height: 300px; height: 100%"></canvas>
                </div>
                <div class="legend text-center mt-1">
                    <span class="badge" style="background-color: #4CAF50; font-size: 15px">Chạy</span>
                    <span class="badge" style="background-color: #F44336; font-size: 15px">Lỗi</span>
                    <span class="badge" style="background-color: #9E9E9E; font-size: 15px">Dừng</span>
                </div>


            </div>
        </div>


        <div class="card shadow col-3 m-1 p-0">
            <%-- <div class="card-header p-2 bg-orange text-center">--%>
            <div class="card-header p-2 bg-gradient-gray text-center">
                <h5 class="m-0">Error statistics chart</h5>
            </div>
            <div class="card-body p-2">
                <table style="padding-left: 5px; padding-right: 5px; padding-bottom: 10px; padding-top: 10px" id="dataTable" class="table table-striped table-bordered text-center">
                    <thead style="background-color: #b2bac2; color: black">
                        <tr class="p-0">
                            <th class="p-1">Time
                            </th>
                            <th class="p-1">Status
                            </th>
                            <th class="p-1">Reason
                        </tr>
                    </thead>
                    <tbody id="tableBody" class="p-0" style="font-size: 14px">
                    </tbody>
                </table>

            </div>
        </div>

        <div class="card shadow col-3 m-1 p-0">
            <%-- <div class="card-header p-2 bg-orange text-center">--%>
            <div class="card-header p-2 bg-gradient-gray text-center">
                <h5 class="m-0">Error statistics chart</h5>
            </div>
            <div class="card-body p-2">
                <div class="chart-container">
                    <canvas id="chart_sumary_error" style="min-height: 300px; height: 100%"></canvas>
                </div>

            </div>
        </div>



    </div>
    <%-- Row 4 --%>
    <div class="row  ml-1 mr-1">
        <div class="card shadow col-2 m-1 p-0">
            <%-- OEE--%>
            <div class="card-header p-2 bg-gradient-gray text-center">
                <h5 class="m-0">OEE</h5>
            </div>
            <div class="card-body p-2">
                <div class="oee-main-display">
                    <div class="oee-main-value text-center" id="oeeMainValue">85%</div>

                    <div class="mt-2 mb-2">
                        <div class="progress">
                            <div class="progress-bar" id="oeeProgressBar" style="width: 85%"></div>
                        </div>
                    </div>
                </div>

                <div class=" mb-2">
                    <div class="metric-card availability" data-bs-toggle="tooltip"
                        data-bs-placement="top" title="Tỷ lệ thời gian thiết bị hoạt động">
                        <%--  <div class="metric-icon icon-availability">
                      <i class="bi bi-clock-fill"></i>
                  </div>--%>
                        <div class="metric-value">92%</div>
                        <div class="metric-label">Availability</div>
                    </div>
                </div>

                <div class=" mb-2">
                    <div class="metric-card performance" data-bs-toggle="tooltip"
                        data-bs-placement="top" title="Tốc độ sản xuất thực tế so với kế hoạch">
                        <%--  <div class="metric-icon icon-performance">
                      <i class="bi bi-speedometer2"></i>
                  </div>--%>
                        <div class="metric-value">97%</div>
                        <div class="metric-label">Performance</div>
                    </div>
                </div>

                <div class=" mb-2">
                    <div class="metric-card quality" data-bs-toggle="tooltip"
                        data-bs-placement="top" title="Tỷ lệ sản phẩm đạt chất lượng">
                        <%-- <div class="metric-icon icon-quality">
                      <i class="bi bi-award-fill"></i>
                  </div>--%>
                        <div class="metric-value">90%</div>
                        <div class="metric-label">Quality</div>
                    </div>
                </div>

            </div>
        </div>

        <!-- Biểu đồ sạn lượng theo model -->
        <div class="card shadow col-4 mt-0 m-1 p-0">
            <%--<div class="card-header p-2 bg-yellow text-center">--%>
            <div class="card-header p-2 bg-gradient-gray text-center">
                <h5 class="m-0">Production Chart by Model</h5>
            </div>
            <div class="card-body p-2">
                <div class="chart-container">
                    <canvas id="chart_quantitymodel" style="min-height: 350px; height: 100%"></canvas>
                </div>
            </div>
        </div>
        <!-- Biểu đồ sạn lượng theo Thời gian -->
        <div class="card shadow col mt-0 m-1 p-0">
            <%-- <div class="card-header p-2 bg-gradient-indigo text-center">--%>
            <div class="card-header p-2 bg-gradient-gray text-center">
                <h5 class="m-0">Output graph over time</h5>
            </div>
            <div class="card-body p-2">
                <div class="chart-container">
                    <canvas id="chart_quantitybytime" style="min-height: 350px; height: 100%"></canvas>
                </div>
            </div>
        </div>

    </div>

    <script>


        ///
        // quantitypertime
        var DataLineChart = {
            labels: ['06:00', '06:05', '06:10', '06:15', '06:20', '06:25', '06:30', '06:35', '06:40', '06:45', '06:50', '06:55', '07:00', '07:05', '07:10', '07:15', '07:20', '07:25', '07:30', '07:35', '07:40', '07:45', '07:50', '07:55', '08:00', '08:05', '08:10', '08:15', '08:20', '08:25', '08:30', '08:35', '08:40', '08:45', '08:50', '08:55', '09:00', '09:05', '09:10', '09:15', '09:20', '09:25', '09:30', '09:35', '09:40', '09:45', '09:50', '09:55', '10:00', '10:05', '10:10', '10:15', '10:20', '10:25', '10:30', '10:35', '10:40', '10:45', '10:50', '10:55', '11:00', '11:05', '11:10', '11:15', '11:20', '11:25', '11:30', '11:35', '11:40', '11:45', '11:50', '11:55', '12:00', '12:05', '12:10', '12:15', '12:20', '12:25', '12:30', '12:35', '12:40', '12:45', '12:50', '12:55', '13:00', '13:05', '13:10', '13:15', '13:20', '13:25', '13:30', '13:35', '13:40', '13:45', '13:50', '13:55', '14:00', '14:05', '14:10', '14:15', '14:20', '14:25', '14:30', '14:35', '14:40', '14:45', '14:50', '14:55', '15:00', '15:05', '15:10', '15:15', '15:20', '15:25', '15:30', '15:35', '15:40', '15:45', '15:50', '15:55', '16:00', '16:05', '16:10', '16:15', '16:20', '16:25', '16:30', '16:35', '16:40', '16:45', '16:50', '16:55', '17:00', '17:05', '17:10', '17:15', '17:20', '17:25', '17:30', '17:35', '17:40', '17:45', '17:50', '17:55', '18:00', '18:05', '18:10', '18:15', '18:20', '18:25', '18:30', '18:35', '18:40', '18:45', '18:50', '18:55', '19:00', '19:05', '19:10', '19:15', '19:20', '19:25', '19:30', '19:35', '19:40', '19:45', '19:50', '19:55', '20:00', '20:05', '20:10', '20:15', '20:20', '20:25', '20:30', '20:35', '20:40', '20:45', '20:50', '20:55', '21:00', '21:05', '21:10', '21:15', '21:20', '21:25', '21:30', '21:35', '21:40', '21:45', '21:50', '21:55', '22:00', '22:05', '22:10', '22:15', '22:20', '22:25', '22:30', '22:35', '22:40', '22:45', '22:50', '22:55', '23:00', '23:05', '23:10', '23:15', '23:20', '23:25', '23:30', '23:35', '23:40', '23:45', '23:50', '23:55', '00:00', '00:05', '00:10', '00:15', '00:20', '00:25', '00:30', '00:35', '00:40', '00:45', '00:50', '00:55', '01:00', '01:05', '01:10', '01:15', '01:20', '01:25', '01:30', '01:35', '01:40', '01:45', '01:50', '01:55', '02:00', '02:05', '02:10', '02:15', '02:20', '02:25', '02:30', '02:35', '02:40', '02:45', '02:50', '02:55', '03:00', '03:05', '03:10', '03:15', '03:20', '03:25', '03:30', '03:35', '03:40', '03:45', '03:50', '03:55', '04:00', '04:05', '04:10', '04:15', '04:20', '04:25', '04:30', '04:35', '04:40', '04:45', '04:50', '04:55', '05:00', '05:05', '05:10', '05:15', '05:20', '05:25', '05:30', '05:35', '05:40', '05:45', '05:50', '05:55', '06:00'],
            datasets: [
                {
                    type: 'line',
                    yAxisID: 'y', // Thay đổi từ 'y-axis-1' thành 'y'
                    label: 'Plan',
                    borderColor: 'rgb(75, 192, 192)',
                    data: [0, 10, 20, 30, 40, 40, 40, 60, 80, 90, 100, 110],
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
                    data: [0, 10, 20, 30, 40, 40, 40, 60, 80, 85, 101, 120],
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
                    data: [0, 0, 0, 0, 0, 0, 0, 0, 0, -5, 1, 10],

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


        var barChartCanvas = $('#chart_quantitymodel').get(0).getContext('2d');

        var databarchart = {
            labels: ['Q1', 'Q2', 'Q3', 'Q4'], // Thêm labels - quan trọng!
            datasets: [
                {
                    type: 'bar',
                    label: 'Plan',
                    backgroundColor: 'rgba(26, 83, 255, 0.7)',
                    order: 2,

                    data: [100, 500, 200, 400]
                },
                {
                    type: 'bar',
                    label: 'Plan/Time',
                    backgroundColor: 'rgba(245, 225, 12, 0.8)',
                    categoryPercentage: 0.6,
                    categoryPercentage: 0.6,
                    order: 1,
                    data: [80, 400, 150, 300]
                },
                {
                    type: 'bar',
                    label: 'Actual',
                    backgroundColor: 'rgba(36, 143, 36, 0.9)',
                    order: 0,
                    categoryPercentage: 0.35,
                    data: [60, 400, 130, 100]
                }
            ]
        };

        var barChartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            datasetFill: false,
            scales: {
                // Chart.js 3: Thay đổi từ xAxes/yAxes thành x/y
                x: {
                    ticks: {
                        font: {
                            size: 20 // Thay đổi từ fontSize thành font.size
                        }
                    },
                    grid: {
                        display: false // Thay đổi từ gridLines thành grid
                    },
                    stacked: true,
                },
                y: {
                    ticks: {
                        font: {
                            size: 15
                        },
                        beginAtZero: true,
                    },
                }
            },
            // Chart.js 3: legend được chuyển vào plugins
            plugins: {
                legend: {
                    position: 'bottom',
                    labels: {
                        font: {
                            size: 15 // Thay đổi từ fontSize thành font.size
                        }
                    }
                }
            },
            animation: {
                duration: 1,
                onComplete: function (context) { // Chart.js 3: thêm context parameter
                    var chart = context.chart; // Thay đổi cách lấy chart instance
                    var ctx = chart.ctx;
                    ctx.font = "500 18px Arial";
                    ctx.fillStyle = '#000000';
                    ctx.textAlign = 'center';
                    ctx.textBaseline = 'bottom';

                    chart.data.datasets.forEach(function (dataset, i) {
                        var meta = chart.getDatasetMeta(i); // Thay đổi cách lấy meta
                        meta.data.forEach(function (bar, index) {
                            var data = dataset.data[index];
                            // Chart.js 3: Thay đổi cách lấy position
                            var position = bar.getProps(['x', 'y'], true);
                            ctx.fillText(data, position.x, position.y);
                        });
                    });
                }
            }
        }



        //Biểu đồ trạng thái máy theo thời gian
        // Lưu reference của chart để có thể cập nhật sau
        let ganttChart;

        function generateMachineData(machineName, date = '2025-05-03') {
            const states = ['Chạy', 'Dừng', 'Lỗi'];
            const weights = { 'Chạy': 0.7, 'Dừng': 0.15, 'Lỗi': 0.15 }; // Chạy chiếm đa số
            const getRandomState = () => {
                const r = Math.random();
                if (r < weights['Chạy']) return 'Chạy';
                if (r < weights['Chạy'] + weights['Dừng']) return 'Dừng';
                return 'Lỗi';
            };
            const result = [];
            let currentTime = new Date(`${date}T00:00:00`);
            const endTime = new Date(`${date}T23:59:59`);
            while (currentTime < endTime) {
                const status = getRandomState();
                const duration = Math.floor(Math.random() * 60) + 30; // từ 30 đến 90 phút
                const start = new Date(currentTime);
                const end = new Date(start.getTime() + duration * 60000);
                if (end > endTime) end.setTime(endTime.getTime());
                result.push({
                    machine: machineName,
                    status: status,
                    start: start.toISOString(),
                    end: end.toISOString()
                });
                currentTime = new Date(end.getTime());
            }
            return result;
        }

        function generateColors(count) {
            const colors = [];
            const hueStep = 360 / count;

            for (let i = 0; i < count; i++) {
                const hue = i * hueStep;
                const saturation = 70 + (i % 3) * 10; // 70-90%
                const lightness = 50 + (i % 2) * 10;  // 50-60%
                colors.push(`hsl(${hue}, ${saturation}%, ${lightness}%)`);
            }
            return colors;
        }

        $(document).ready(function () {

            // Khởi tạo DataTable
            var table = $('#dataTable').DataTable({
                pageLength: 3,
                lengthChange: false,
                paging: true,
                searching: false,
                ordering: false, 
                info: false,
               

            });
            ///
            var linechart = new Chart(lineChartCanvas, {
                type: 'line',
                data: DataLineChart,
                options: LineChartOption
            })
            ///
            var barchartplan = new Chart(barChartCanvas, {
                type: 'bar',
                data: databarchart,
                options: barChartOptions
            })

            // Kiểm tra SignalR
            if (typeof $.connection === 'undefined') {
                console.error("SignalR not loaded. Check jQuery and signalr/hubs scripts.");
                return;
            }
            // Kết nối tới SignalR Hub
            var proxy = $.connection.PCMHub;
            var isUpdating = true;
            var interactionTimeout;
            // Bắt đầu kết nối SignalR
            $.connection.hub.start().done(function () {
                console.log("SignalR connected");
                //proxy.server.getInitialData();
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
                $('#RemainQuantity').html(data_quantityPCM.PlanQuantity);
                /*Row2_1*/
                var data_statusMachine = data.statusMachine;
                $('#txt_statusmachine').html(data_statusMachine.Status);
                if (data_statusMachine.Status.toUpperCase() == 'RUNNING') {
                    $('#txt_statusmachine').removeClass('bg-danger')
                    $('#txt_statusmachine').addClass('bg-success')
                }
                else {
                    $('#txt_statusmachine').removeClass('bg-success')
                    $('#txt_statusmachine').addClass('bg-danger')
                }
                $('#stop - reason').html(data_statusMachine.ReasonStop);
                $('#total-stops').html(data_statusMachine.TimeStop);
                $('#total-stop-time').html(data_statusMachine.TotalTimeStop);
                /*Row2_2*/
                var data_dataGanttCharts = data.dataGanttCharts;
                ganttchart.data.datasets = [data_dataGanttCharts];
                ganttchart.update();
                /*Row2_3*/
                var data_statusMachineDetail = data.statusMachineDetail;
                table.clear();
                $.each(data_statusMachineDetail, function (index, item) {
                    // Thêm dòng với class
                    table.row.add([
                        item.TimeInsert,
                        item.Status,
                        item.Reason,
                       
                    ]);
                });
                table.draw(false);
                /*Row2_4*/
                /*Row3_1*/
                /*Row3_2*/
                /*Row3_3*/

            };


            // Hàm xử lý tương tác chuột
            function handleMouseInteraction() {
                isUpdating = false;
                clearTimeout(interactionTimeout);

                interactionTimeout = setTimeout(function () {
                    isUpdating = true;
                    proxy.server.getInitialData();
                }, 5000);
            }
            // Gắn sự kiện chuột trên table
            $('#dataTable').on('mousemove click', handleMouseInteraction);


            // Dữ liệu Gantt

            const machineData = [
                ...generateMachineData("Máy 1"),
                /* ...generateMachineData("Máy 2")*/
            ];

            const ganttDatasets = [{
                data: machineData.map(item => ({
                    x: [new Date(item.start), new Date(item.end)],
                    y: '' // Tất cả đều có cùng 1 tên để hiển thị trên 1 dòng
                })),
                backgroundColor: machineData.map(item => {
                    return item.status === "Run" ? "#4CAF50" :
                        item.status === "Stop" ? "#F44336" : "#9E9E9E";
                }),
                borderColor: machineData.map(item => {
                    return item.status === "Run" ? "#4CAF50" :
                        item.status === "Stop" ? "#F44336" : "#9E9E9E";
                }),
                borderWidth: 1
            }];

            const ganttCtx = document.getElementById('chart_statusmachine').getContext('2d');
            var ganttchart = new Chart(ganttCtx, {
                type: 'bar',
                //data: { datasets: ganttDatasets },
                options: {
                    indexAxis: 'y',
                    // Cách 1: Sử dụng barThickness để đặt độ dày cố định (pixel)
                    // barThickness: 20, // Độ dày cố định 20px cho mỗi thanh
                    // Điều chỉnh để hiển thị trên 1 dòng
                    categoryPercentage: 0.5, // Sử dụng toàn bộ không gian category
                    barPercentage: 0.5,      // Các thanh chiếm 80% không gian
                    // Cách 3: Sử dụng maxBarThickness để giới hạn độ dày tối đa
                    // maxBarThickness: 50, // Độ dày tối đa 50px
                    // Cách 4: Sử dụng minBarLength để đặt độ dài tối thiểu
                    // minBarLength: 10, // Độ dài tối thiểu 10px
                    scales: {
                        x: {
                            type: 'time',
                            time: { unit: 'hour', displayFormats: { hour: 'HH:mm' } },
                            title: {
                                /*display: true, text: 'Thời gian', font: { size: 14 }, color: 'black' // màu chữ cho tiêu đề trục X*/
                                display: false, text: 'Thời gian', font: { size: 14 }, color: 'black' // màu chữ cho tiêu đề trục X
                            },
                            ticks: {
                                font: {
                                    size: 15,
                                    weight: 'bold'
                                },
                                color: 'black'
                            },
                            min: '2025-05-03 08:00:00',
                            max: '2025-05-03 24:00:00'
                        },
                        y: {
                            ticks: {
                                font: {
                                    size: 15,
                                    weight: 'bold'
                                },
                                color: 'black'
                            },
                            /* title: { display: true, text: 'Máy', font: { size: 14 }, color: 'black' }*/
                            title: { display: false, text: 'Máy', font: { size: 14 }, color: 'black' }
                        }
                    },
                    plugins: {
                        legend: {
                            display: false, labels: {
                                color: 'black', // nếu có legend, đổi màu chữ
                                font: { size: 15 }
                            }
                        },
                        tooltip: {
                            callbacks: {
                                label: function (context) {
                                    const data = context.raw;
                                    const start = new Date(data.x[0]).toLocaleTimeString('vi-VN');
                                    const end = new Date(data.x[1]).toLocaleTimeString('vi-VN');
                                    return `${context.dataset.label}: ${start} - ${end}`;
                                }
                            },
                            //titleFont: { size: 14 },
                            //bodyFont: { size: 12 },
                            //titleColor: 'black',
                            //bodyColor: 'black'
                        }
                    },
                    maintainAspectRatio: false
                }
            });




            // --- Vẽ biểu đồ lỗi ---
            // Dữ liệu mẫu về các loại lỗi máy
            let errorData = {
                labels: [
                    'Lỗi cơ khí',
                    'Lỗi điện',
                    'Lỗi cảm biến',
                    'Lỗi phần mềm'
                ],
                data: [45, 32, 28, 15]
            };

            // Tự động tạo màu sắc dựa trên số lượng labels
            errorData.colors = generateColors(errorData.labels.length);

            const errorCtx = document.getElementById('chart_sumary_error').getContext('2d');
            new Chart(errorCtx, {
                type: 'bar',
                data: {
                    labels: errorData.labels,
                    datasets: [{
                        label: 'Số lượng lỗi',
                        data: errorData.data,
                        backgroundColor: errorData.colors.map(color => color.replace('hsl', 'hsla').replace(')', ', 0.7)')),
                        borderColor: errorData.colors,
                        //borderWidth: 2,
                        //borderRadius: 8,
                        //borderSkipped: false,
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            display: false
                        },
                        tooltip: {
                            backgroundColor: 'rgba(0,0,0,0.8)',
                            titleColor: 'white',
                            bodyColor: 'white',
                            callbacks: {
                                label: function (context) {
                                    return `${context.label}: ${context.parsed.y} lỗi`;
                                }
                            }
                        }
                    },
                    scales: {
                        y: {
                            ticks: {
                                font: {
                                    size: 15,
                                    weight: 'bold'
                                },
                                color: 'black'
                            },
                            beginAtZero: true,
                            grid: {
                                color: 'rgba(0,0,0,0.1)'
                            },
                            //ticks: {
                            //    callback: function (value) {
                            //        return value + ' lỗi';
                            //    }
                            //}
                        },
                        x: {
                            ticks: {
                                font: {
                                    size: 15,
                                    weight: 'bold'
                                },
                                color: 'black'
                            },
                            grid: {
                                display: false
                            }
                        }
                    },
                    animation: {
                        duration: 2000,
                        easing: 'easeInOutQuart'
                    }
                }
            });
        });
    </script>
</asp:Content>
