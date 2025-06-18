<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Management_logerror.aspx.cs" Inherits="PAPVN.Management.Management_logerror" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="m-2">
      <div class="row" style="background-color: #fffefe; border-radius: 8px;">
          <div class="col" style="margin-top: 5px; margin-bottom: 5px">
             <asp:FileUpload ID="FileUpload1" runat="server" Font-Size="20px" />
          </div>
          
          <div class="col-sm-3" style="margin-top: 5px; margin-bottom: 5px">
              <asp:Button type="button" Text="Upload" OnClick="btnImport_Click" runat="server" name="btn_Import" Style="font-size: 20px; font-weight: 600; padding: 5px" class="btn btn-outline-primary btn-block "></asp:Button>
          </div>

      </div>

  </div>
    <table style="padding-left: 5px; padding-right: 5px; padding-bottom: 10px; padding-top: 10px" id="dataTable" class="table table-striped table-bordered text-center">
        <thead style="background-color: #b2bac2; color: black">
            <tr class="p-0">
                <th class="p-1">Name Machine </th>
                <th class="p-1">Code Error</th>
                <th class="p-1">Name Error </th>
                <th class="p-1">Time Update </th>
            </tr>
        </thead>
        <tbody id="tableBody" class="p-0" style="font-size: 14px" runat="server">
        </tbody>
    </table>
    <script>
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
            let machineErrors = [
                {
                    id: 1,
                    machineName: "Máy cắt CNC-001",
                    errorCode: "E001",
                    errorName: "Lỗi motor bước",
                    timeUpdate: "2024-06-15 10:30:00"
                },
                {
                    id: 2,
                    machineName: "Máy phay VMC-002",
                    errorCode: "E002",
                    errorName: "Lỗi cảm biến nhiệt độ",
                    timeUpdate: "2024-06-15 11:45:00"
                },
                {
                    id: 3,
                    machineName: "Máy tiện LAT-003",
                    errorCode: "E003",
                    errorName: "Lỗi hệ thống thủy lực",
                    timeUpdate: "2024-06-15 14:20:00"
                },
                {
                    id: 4,
                    machineName: "Máy hàn ROB-004",
                    errorCode: "E004",
                    errorName: "Lỗi robot arm",
                    timeUpdate: "2024-06-15 16:10:00"
                },
                {
                    id: 5,
                    machineName: "Máy ép PRS-005",
                    errorCode: "E005",
                    errorName: "Lỗi áp suất không khí",
                    timeUpdate: "2024-06-16 08:15:00"
                }
            ];
            let databody +=  machineErrors.forEach(function (error) {
                let row = `
                                <tr data-id="${error.id}">
                                    <td class="p-2">${error.machineName}</td>
                                    <td class="p-2">${error.errorCode}</td>
                                    <td class="p-2">${error.errorName}</td>
                                    <td class="p-2">${error.timeUpdate}</td>
                                    <td class="p-2">
                                        <button class="btn btn-warning btn-sm action-btn edit-btn" data-id="${error.id}" title="Sửa">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-danger btn-sm action-btn delete-btn" data-id="${error.id}" title="Xóa">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                            `;
               
            });
        });
    </script>
</asp:Content>
