<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Management_logerror.aspx.cs" Inherits="PAPVN.Management.Management_logerror" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="padding-left: 5px; padding-right: 5px; padding-bottom: 10px; padding-top: 10px" id="dataTable" class="table table-striped table-bordered text-center">
        <thead style="background-color: #b2bac2; color: black">
            <tr class="p-0">
                <th class="p-1">Name Machine </th>
                <th class="p-1">Code Errer</th>
                <th class="p-1">Name Eror </th>
                <th class="p-1">Time Update </th>
                <th class="p-1">Action </th>

            </tr>
        </thead>
        <tbody id="tableBody" class="p-0" style="font-size: 14px">
        </tbody>
    </table>
    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Sửa thông tin lỗi</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editForm">
                        <input type="hidden" id="editId">
                        <div class="mb-3">
                            <label for="editMachineName" class="form-label">Tên máy</label>
                            <input type="text" class="form-control" id="editMachineName" required>
                        </div>
                        <div class="mb-3">
                            <label for="editErrorCode" class="form-label">Mã lỗi</label>
                            <input type="text" class="form-control" id="editErrorCode" required>
                        </div>
                        <div class="mb-3">
                            <label for="editErrorName" class="form-label">Tên lỗi</label>
                            <input type="text" class="form-control" id="editErrorName" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="button" class="btn btn-primary" id="saveEdit">Lưu thay đổi</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Bạn có chắc chắn muốn xóa mục này không?</p>
                    <div id="deleteInfo"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="button" class="btn btn-danger" id="confirmDelete">Xóa</button>
                </div>
            </div>
        </div>
    </div>
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
