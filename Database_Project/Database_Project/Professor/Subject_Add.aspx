<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subject_Add.aspx.cs" Inherits="Database_Project.Professor.Subject_Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


        .auto-style1 {
            width: 150px;
        }
        .auto-style2 {
            width: 15px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td><h1>
                    <asp:Label ID="Label_SBNAME" runat="server" Text="강의명"></asp:Label>
                    &nbsp;등록</h1></td>
            </tr>
            <tr>
                <td>
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style1">강의번호</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:TextBox ID="TextBox_SBID" runat="server" Width="128px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">강의명</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:TextBox ID="TextBox_SBNAME" runat="server" Width="128px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">대상 학년</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:TextBox ID="TextBox_TYEAR" runat="server" Width="128px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">학기</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:TextBox ID="TextBox_TTERM" runat="server" Width="128px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">수강생</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:GridView ID="GridView2" runat="server">
                                </asp:GridView>
                                <br />
                                <asp:FileUpload ID="FileUploadToServer" runat="server" Width="300px" />
                                <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" style="width: 99px" Text="Upload File" ValidationGroup="vg" />
                                <br />
                                <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="False"></asp:Label>
                                <br />
                                <asp:GridView ID="GridView1" runat="server" EmptyDataText="현재 수강하는 학생이 없습니다." ShowHeaderWhenEmpty="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                    <FooterStyle BackColor="#CCCCCC" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                </asp:GridView>
                            </td>
                        </tr>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button_Add" runat="server" OnClick="Button_Add_Click" Text="등록" Width="100px" />
                    <asp:Button ID="Button_Cancel" runat="server" Text="취소" Width="100px" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
