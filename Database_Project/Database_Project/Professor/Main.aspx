<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Database_Project.Professor.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Examination System</title>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td>Wellcome Professor!</td>
            </tr>
            <tr>
                <td>
                    <table style="width:100%;">
                        <tr>
                            <td style="width:50%; text-align:center;">현재과제 현황</td>
                            <td style="width:50%; text-align:center;">현재강의 현황</td>
                        </tr>
                        <tr>
                            <td style="width:50%; text-align:center;">
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" EmptyDataText="현재 과제가 없습니다." ShowHeaderWhenEmpty="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SelProjects" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center">
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                    <Columns>
                                        <asp:BoundField DataField="EXDATE" HeaderText="EXDATE" SortExpression="EXDATE" />
                                        <asp:BoundField DataField="PJNAME" HeaderText="PJNAME" SortExpression="PJNAME" />
                                        <asp:BoundField DataField="PJTYPE" HeaderText="PJTYPE" SortExpression="PJTYPE" />
                                        <asp:BoundField DataField="PLACE" HeaderText="PLACE" SortExpression="PLACE" />
                                        <asp:BoundField DataField="SBYEAR" HeaderText="SBYEAR" SortExpression="SBYEAR" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SelProjects" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;EXDATE&quot;, &quot;PJTYPE&quot;, &quot;PLACE&quot;, &quot;PJNAME&quot;, &quot;SBYEAR&quot; FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
                            </td>
                            <td style="width:50%; text-align:center;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="현재 강의중인 과목이 없습니다." ShowHeaderWhenEmpty="True" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center">
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                    <Columns>
                                        <asp:BoundField DataField="SBID" HeaderText="과목번호" SortExpression="SBID" />
                                        <asp:BoundField DataField="SBNAME" HeaderText="과목이름" SortExpression="SBNAME" />
                                        <asp:BoundField DataField="TTERM" HeaderText="학기" SortExpression="TTERM" />
                                        <asp:BoundField DataField="TYEAR" HeaderText="과목년도" SortExpression="TYEAR" />
                                        <asp:BoundField DataField="SNUMBER" HeaderText="수강생 수" SortExpression="SNUMBER" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;SBID&quot;, &quot;SBNAME&quot;, &quot;TTERM&quot;, &quot;TYEAR&quot;, &quot;SNUMBER&quot; FROM &quot;SUBJECT&quot; WHERE (&quot;PID&quot; = :PID)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="PID" SessionField="PID" Type="Decimal" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:50%; text-align:center;">&nbsp;</td>
                            <td style="width:50%; text-align:center;">&nbsp;</td>
                        </tr>
                    </table>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
