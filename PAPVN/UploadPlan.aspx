<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadPlan.aspx.cs" Inherits="PAPVN.UploadPlan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #popupDiv {
            background-color: #f9f9f9;
            padding: 0px 20px 0px 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-family: Arial, sans-serif;
        }

        .ui-dialog-titlebar {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            border: none;
            border-radius: 5px 5px 0 0;
            height: 50px;
        }
        /* Style cho nút "Close" trong thanh taskbar */
        .ui-dialog-titlebar-close {
            color: black;
            font-size: 14px;
            width: 50px;
            height: 30px;
            margin-top: 10px;
            margin-left: 10px;
            padding: 0px;
            background-color: red;
        }
        /*.ui-dialog .ui-dialog-titlebar-close .ui-icon {
            background: #ff0000 !important;
        }*/
        /*table {
            width:100%;
            table-layout:fixed;
        }*/
    </style>
    <div class="m-2">
        <div class="row" style="background-color: #fffefe; border-radius: 8px;">
            <div class="col" style="margin-top: 5px; margin-bottom: 5px">
                <%--<asp:FileUpload ID="FileUpload1" runat="server" Font-Size="20px" Style="padding: 10px; background-color: #f0f0f0; border: 1px solid #ccc;" />--%>
                <asp:FileUpload ID="FileUpload1" runat="server" Font-Size="20px" />
            </div>
            <div style="display: flex; justify-content: right; margin-right: 3px; margin-top: 2px; margin-bottom: 2px">
                <select runat="server" id="cmb_TypePlan" class="form-control" style="width: 250px;margin-top:5px">
                    <option>Kế hoạch 3 ca</option>
                    <option>Kế hoạch 2 ca</option>
                </select>
            </div>
            <div class="col-sm-3" style="margin-top: 5px; margin-bottom: 5px">
                <asp:Button type="button" Text="Upload Plan" OnClick="Importdata_Click" runat="server" name="btn_Import" Style="font-size: 20px; font-weight: 600; padding: 5px" class="btn btn-outline-primary btn-block "></asp:Button>
            </div>

        </div>

    </div>
    <div class="row ml-5 mt-1 mb-1">
        <div class="col" >
            <a href="UploadPlanCa1.aspx"><span style="font-size: 20px">Điều chỉnh kế hoạch ca 1</span> </a>
        </div>
        <div class="col">
            <a href="UploadPlanCa2.aspx"><span style="font-size: 20px">Điều chỉnh kế hoạch ca 2</span></a>
        </div>
        <div class="col">
            <a href="UploadPlanCa3.aspx"><span style="font-size: 20px">Điều chỉnh kế hoạch ca 3</span></a>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <div class="text-center">
                <h1 style="font-weight: bold">Kế hoạch sản xuất ngày <%=datenow%></h1>
            </div>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <table id="example1" class="table table-bordered table-striped">
                <thead>
                    <tr style="font-size: 16px">
                        <th>Model</th>
                        <th>Plan All Day</th>
                        <th>Plan shift 1</th>
                        <th>Plan shift 2</th>
                        <th>Plan shift 3</th>
                        <th>Start Time</th>
                        <th>End Time</th>
                        <th>Monitor Sepecial</th>
                        <th>Modify Plan</th>
                    </tr>
                </thead>
                <tbody style="font-size: 16px" id="dt_plan" runat="server">
                </tbody>
            </table>
        </div>
        <!-- /.card-body -->
    </div>
    <%--    POPUP_Adjust--%>
    <div class="modal fade" id="modal-default">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <%--<h4 class="modal-title">Adjust Date Time Plan</h4>--%>
                <h2 class="modal-title"  style="margin: 0px; margin-bottom:5px; font-weight: 600; text-align:center">Adjust Model: <span id="ModelSelect"></span></h2>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                 
               <div class="d-flex flex-row">
            <div>
                <p style="font-size: 25px; font-weight: 600">Time Start:</p>
            </div>
            <div class="flex-fill">
                <div class=" input-group date" id="reservationdatetimefromplan" data-target-input="nearest">
                    <input id="datefrom" style="font-size: 20px; font-weight: 400" placeholder="Select Date Time From" type="text" class="form-control datetimepicker-input" data-target="#reservationdatetimefromplan">
                    <div class="input-group-append" data-target="#reservationdatetimefromplan" data-toggle="datetimepicker">
                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="d-flex flex-row" style="margin: 10px 0px">
            <div>
                <p style="font-size: 25px; font-weight: 600">Time End:&ensp;</p>
            </div>
            <div class="flex-fill">
                <div class=" input-group date" id="reservationdatetimetoplan" data-target-input="nearest">
                    <input id="dateto" style="font-size: 20px; font-weight: 400" placeholder="Select Date Time To" type="text" class="form-control datetimepicker-input" data-target="#reservationdatetimetoplan">
                    <div class="input-group-append" data-target="#reservationdatetimetoplan" data-toggle="datetimepicker">
                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                    </div>
                </div>
            </div>
        </div>
            </div>
            <div class="modal-footer justify-content-center">
              <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
              <button type="button" class="btn btn-primary" onclick="UpdateDateTimePlan()">Confirm Update</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->

    <script>
        var isMonitorSpecial = 0;
        var isUpdateDateTimePlan = 0;
        function showPopupLoading() {
            var windowHeight = $(window).height();
            var windowWidth = $(window).width();
            $("#popuploading").dialog({
                modal: true,
                width: windowWidth * 0.2,
                height: windowHeight * 0.2,
                closeOnEscape: false,
                open: function (event, ui) {
                    $(".ui-dialog-titlebar-close", ui.dialog).hide(); // Ẩn nút đóng trong title bar
                }
            });
        }
        function UpdateDateTimePlan() {
            if (isUpdateDateTimePlan == 0) {
                isUpdateDateTimePlan = 1;
                var datetimefrom = $("#datefrom").val();
                var datetimeto = $("#dateto").val();
                var NameModel = $('#ModelSelect').html();
                if (datetimefrom.length < 10 || datetimeto.length < 10) {
                    alert('Hãy nhập thời gian bắt đầu và kết thúc')
                }
                else {
                    $.ajax({
                        type: 'POST',
                        url: '/WebServiceModifyPlan.asmx/UpdateDateTimePlan',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: JSON.stringify({ ModelName: NameModel, TimeFrom: datetimefrom, TimeTo: datetimeto }),
                        success: function (response) {
                            if (response.d = '0') {
                                alert('Thay đổi không thành công!!!!!!!!!!\nThời gian điều trỉnh phải nằm trong khoảng thời gian bắt đầu ca và kết thúc ca')
                            }
                            else {
                                alert('Thay đổi thành công!!!!')
                            }
                            location.reload();
                        },
                        error: function (xhr, status, error) {
                            alert(error)
                            location.reload();
                        }
                    });
                }
                isUpdateDateTimePlan = 0;
            }
        }
        function showPopup(elm) {
            var datarow = elm.parentNode.parentNode;
            //var windowHeight = $(window).height();
            //var windowWidth = $(window).width();
            //$("#popupDiv").dialog({
            //    modal: true,
            //    width: windowWidth * 0.4,
            //    height: windowHeight * 0.33,
            //    //beforeClose: function (event, ui) {
            //    //    // Thêm nội dung bên trong nút close
            //    //    $(".ui-dialog-titlebar-close").html("<span class='custom-close-button'>X</span>");
            //    //    alert('close')
            //    //},
            //});
            $('#ModelSelect').html(` ${datarow.cells[0].textContent}`)
        }
        function MonitorSpecial(elm) {
            if (isMonitorSpecial == 0) {
                isMonitorSpecial = 1;
                var htmlelm = elm.innerHTML;
                var datarow = elm.parentNode.parentNode;
                var NameModel = ` ${datarow.cells[0].textContent}`;
                $.ajax({
                    type: 'POST',
                    url: '/WebServiceModifyPlan.asmx/MonitorSpecial',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    data: JSON.stringify({ ModelName: NameModel }),
                    success: function (response) {
                        var data = JSON.parse(response.d);
                        if (data.rs = '1') {
                            if (htmlelm.includes('Add')) {
                                elm.innerHTML = '<i class="fas fa-trash"></i> Remove'
                                elm.classList.remove('btn-success')
                                elm.classList.add('btn-danger');
                            }
                            else {
                                elm.innerHTML = '<i class="fas fa-plus"></i> Add </button>'
                                elm.classList.remove('btn-danger')
                                elm.classList.add('btn-success');
                            }
                        }
                    },
                    error: function (xhr, status, error) {
                        alert(error)
                    }
                });
                isMonitorSpecial = 0;
            }
        }
    </script>
</asp:Content>
