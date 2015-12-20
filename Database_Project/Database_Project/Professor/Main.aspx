<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Database_Project.Professor.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Examination System</title>
    <style type="text/css">
        .auto-style1 {
            width: 50%;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td><h1>메인 화면</h1></td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    <asp:Label ID="Label_PID" runat="server" Text="교수"></asp:Label>
                    님 환영합니다.</td>
            </tr>
            <tr>
                <td>
                    <table style="width:100%;">
                        <tr>
                            <td style="text-align:center;" class="auto-style1">현재 과제 검사 현황</td>
                            <td style="width:50%; text-align:center;">현재강의 현황</td>
                        </tr>
                        <tr>
                            <td style="text-align:center; vertical-align: top;" class="auto-style1">
                                <asp:GridView ID="GridView2" runat="server" HorizontalAlign="Center" EmptyDataText="현재 검사할 과제가 없습니다." ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AllowPaging="True">
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                    <Columns>
                                        <asp:BoundField DataField="EXDATE" HeaderText="검사일" SortExpression="EXDATE" DataFormatString="{0:yyyy/MM/dd}"/>
                                        <asp:BoundField DataField="SBID" HeaderText="강의번호" SortExpression="SBID" />
                                        <asp:BoundField DataField="PJNAME" HeaderText="과제명" SortExpression="PJNAME" />
                                        <asp:BoundField DataField="PJTYPE" HeaderText="과제 종류" SortExpression="PJTYPE" />
                                        <asp:BoundField DataField="PLACE" HeaderText="장소" SortExpression="PLACE" />
                                        <asp:ButtonField ButtonType="Button" Text="보기" />
                                        <asp:ButtonField ButtonType="Button" Text="수정" />
                                    </Columns>
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
                            <td style="width:50%; text-align:center; vertical-align: top;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="현재 강의중인 과목이 없습니다." ShowHeaderWhenEmpty="True" DataSourceID="SelSubjects" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand" DataKeyNames="SBID,SBYEAR" AllowPaging="True">
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                    <Columns>
                                        <asp:BoundField DataField="SBID" HeaderText="강의번호" SortExpression="SBID" ReadOnly="True"/>
                                        <asp:BoundField DataField="SBNAME" HeaderText="강의명" SortExpression="SBNAME" />
                                        <asp:BoundField DataField="TYEAR" HeaderText="학년" SortExpression="TYEAR" />
                                        <asp:BoundField DataField="TTERM" HeaderText="학기" SortExpression="TTERM" />
                                        <asp:BoundField DataField="SNUMBER" HeaderText="수강생 수" SortExpression="SNUMBER" />
                                        <asp:BoundField DataField="SBYEAR" HeaderText="강의년도" ReadOnly="True" SortExpression="SBYEAR" />
                                        <asp:ButtonField ButtonType="Button" CommandName="ViewSubject" Text="보기" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="Gray" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                </asp:GridView>
                                <asp:Button ID="Button_Add_Proj" runat="server" OnClick="Button_Add_Proj_Click" Text="강의 등록" />
                              <br />
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:center;" class="auto-style1">&nbsp;</td>
                            <td style="width:50%; text-align:center;">&nbsp;</td>
                        </tr>
                    </table>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
                                <asp:SqlDataSource ID="SelSubjects" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;SBID&quot;, &quot;SBNAME&quot;, &quot;TTERM&quot;, &quot;TYEAR&quot;, &quot;SNUMBER&quot;, &quot;SBYEAR&quot; FROM &quot;SUBJECT&quot; WHERE (&quot;PID&quot; = :PID)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="PID" SessionField="PID" Type="Decimal" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
    </form>
</body>
</html>
