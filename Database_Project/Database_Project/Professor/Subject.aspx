<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subject.aspx.cs" Inherits="Database_Project.Professor.Subject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 98px;
        }
        .auto-style2 {
            width: 15px;
        }
        .auto-style3 {
            width: 98px;
            height: 26px;
        }
        .auto-style4 {
            width: 15px;
            height: 26px;
        }
        .auto-style5 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td><h1>
                    <asp:Label ID="Label1" runat="server" Text="강의명"></asp:Label>
&nbsp;강의</h1></td>
            </tr>
            <tr>
                <td>
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style1">강의번호</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:TextBox ID="TextBox_SBID" runat="server" Width="64px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">강의명</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:TextBox ID="TextBox_SBNAME" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">강의년도</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:Label ID="Label_SubYear" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">대상 학년</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:TextBox ID="TextBox_TYEAR" runat="server" Width="32px"></asp:TextBox>
                                <asp:Label ID="Label2" runat="server" Text="학년"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">대상 학기</td>
                            <td class="auto-style4">:</td>
                            <td class="auto-style5">
                                <asp:TextBox ID="TextBox_TTERM" runat="server" Width="32px"></asp:TextBox>
                                학기</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">수강생 수</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:Label ID="Label_StuNumber" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button_modify" runat="server" Text="수정" Width="100px" OnClick="Button_modify_Click" />
                    <asp:Button ID="Button_ModifyAttendee" runat="server" Text="수강생 수정" Width="100px" />
                </td>
            </tr>
            <tr>
                <td><hr /></td>
            </tr>
            <tr>
                <td><h1>과제 현황</h1></td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    <asp:Button ID="Button_AddProj" runat="server" Text="과제 등록" OnClick="Button_AddProj_Click" />
                </td>
            </tr>
            <tr>
                <td>
                                <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" EmptyDataText="현재 검사할 과제가 없습니다." ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SelProjects" ForeColor="Black" GridLines="Vertical" OnRowCommand="GridView2_RowCommand" AllowPaging="True">
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                    <Columns>
                                        <asp:BoundField DataField="EXDATE" HeaderText="검사일" SortExpression="EXDATE" DataFormatString="{0:yyyy년 MM월 dd일}"/>
                                        <asp:BoundField DataField="SBID" HeaderText="강의번호" SortExpression="SBID" />
                                        <asp:BoundField DataField="PJNAME" HeaderText="과제명" SortExpression="PJNAME" />
                                        <asp:BoundField DataField="PJTYPE" HeaderText="과제종류" SortExpression="PJTYPE" />
                                        <asp:BoundField DataField="PLACE" HeaderText="장소" SortExpression="PLACE" />
                                        <asp:BoundField DataField="EXSTIME" HeaderText="검사시작시간" SortExpression="EXSTIME" DataFormatString="{0:HH시}"/>
                                        <asp:BoundField DataField="EXETIME" HeaderText="검사종료시간" SortExpression="EXETIME" DataFormatString="{0:HH시}"/>
                                        <asp:ButtonField ButtonType="Button" CommandName="ViewProject" Text="보기" />
                                        <asp:ButtonField ButtonType="Button" CommandName="ModifyProject" Text="수정" />
                                        <asp:ButtonField ButtonType="Button" CommandName="DeleteProject" Text="삭제" />
                                    </Columns>
                                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#CCCCCC" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SelProjects" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;EXDATE&quot;, &quot;SBID&quot;, &quot;PJNAME&quot;, &quot;PJTYPE&quot;, &quot;PLACE&quot;, &quot;EXSTIME&quot;, &quot;EXETIME&quot; FROM &quot;PROJECT&quot; WHERE (&quot;SBID&quot; = :SBID)" DeleteCommand="DELETE FROM PROJECT WHERE (EXDATE = :EXDATE) AND (SBID = :SBID) AND (PJNAME = :PJNAME)">
                                    <DeleteParameters>
                                        <asp:ControlParameter ControlID="GridView1" Name="EXDATE" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="GridView1" Name="SBID" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="GridView1" Name="PJNAME" PropertyName="SelectedValue" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:Parameter Name="SBID" Type="Decimal" />
                                    </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
