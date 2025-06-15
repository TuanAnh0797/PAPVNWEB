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
            <div class="value" id="PlanQuantity">1000</div>
            <%-- <small>Thời gian hoạt động</small>--%>
        </div>
        <div class="oee-card bg-success col m-2">
            <h2 style="font-weight: 600">OK Quantity</h2>
            <div class="value" id="OkQuantity">800</div>
            <%-- <small>Hiệu suất sản xuất</small>--%>
        </div>
        <div class="oee-card bg-danger col m-2">
            <h2 style="font-weight: 600">NG Quantity</h2>
            <div class="value" id="NgQuantity">0</div>
            <%-- <small>Chất lượng sản phẩm</small>--%>
        </div>
        <div class="oee-card bg-warning col m-2">
            <h2 style="font-weight: 600; color: white">Remaining Quantity</h2>
            <div style="color: white" class="value" id="RemainQuantity">0</div>
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
                    <canvas id="chart_sumary_error" style="min-height: 300px; height: 100%"></canvas>
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
        });





        function renderStationCards() {
            const stations = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2', 'D1', 'D2'];
            const stationContainer = $('#stationCards');
            stationContainer.empty();

            stations.forEach(stationName => {
                const stationTasks = productionData.filter(item => item.station === stationName);
                const currentTask = stationTasks.find(task => task.status === 'active');
                const completedToday = stationTasks.filter(task => task.status === 'completed').length;
                const totalTime = stationTasks.reduce((sum, task) => sum + task.operationTime, 0);
                const avgTime = stationTasks.length > 0 ? Math.round(totalTime / stationTasks.length) : 0;



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
                                        <small class="text-muted">Thời gian:</small>
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




        // Generate more sample data for demonstration
        function generateMoreData() {
            const stations = ['A1', 'A2', 'B1', 'B2', 'C1', 'D1', 'D2'];
            const models = ['Model-X1', 'Model-X2', 'Model-Y1', 'Model-Z1'];
            const workers = ['Nguyễn Văn A', 'Trần Thị B', 'Lê Văn C', 'Phạm Thị D', 'Hoàng Văn E'];
            const statuses = ['active', 'completed', 'delayed'];

            for (let i = 6; i <= 50; i++) {
                const randomDate = new Date();
                randomDate.setHours(randomDate.getHours() - Math.floor(Math.random() * 24));

                productionData.push({
                    id: i,
                    time: randomDate.toISOString().slice(0, 19).replace('T', ' '),
                    station: stations[Math.floor(Math.random() * stations.length)],
                    model: models[Math.floor(Math.random() * models.length)],
                    serial: `SN${String(i).padStart(6, '0')}`,
                    operationTime: Math.floor(Math.random() * 400) + 120,
                    worker1: workers[Math.floor(Math.random() * workers.length)],
                    worker2: workers[Math.floor(Math.random() * workers.length)],
                    status: statuses[Math.floor(Math.random() * statuses.length)]
                });
            }
        }

        // Generate more sample data
        generateMoreData();
        filteredData = [...productionData];
    </script>

</asp:Content>
