<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project_Add.aspx.cs" Inherits="Database_Project.Professor.Project_Add" %>

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
        .auto-style3 {
            width: 150px;
            height: 26px;
        }
        .auto-style4 {
            width: 15px;
            height: 26px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style6 {
            width: 150px;
            height: 5px;
        }
        .auto-style7 {
            width: 15px;
            height: 5px;
        }
        .auto-style8 {
            height: 5px;
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
                    강의의 과제 등록</h1></td>
            </tr>
            <tr>
                <td>
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style1">과제명</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:TextBox ID="TextBox_PJNAME" runat="server" Width="128px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">검사일</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:TextBox ID="TextBox_EXDATE" runat="server" Width="128px"></asp:TextBox>
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/res/calender.png" OnClick="ImageButton1_Click"/>
                                <asp:Calendar ID="Calendar1" runat="server" onselectionchanged="Calendar1_SelectionChanged" Visible="False"></asp:Calendar>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6">과제유형</td>
                            <td class="auto-style7">:</td>
                            <td class="auto-style8">
                                <asp:DropDownList ID="DropDownList_PJTYPE" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList_PJTYPE_SelectedIndexChanged">
                                    <asp:ListItem Selected="True">개인</asp:ListItem>
                                    <asp:ListItem>팀</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label_MINNUM" runat="server" Text="최소학생 수" Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style2">
                                <asp:Label ID="Label_MINNUM_semicolon" runat="server" Text=":" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_MINNUM" runat="server" Width="32px" Visible="False"></asp:TextBox>
                                <asp:Label ID="Label_MINNUM_unit" runat="server" Text="명" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label_MAXNUM" runat="server" Text="최대학생 수" Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style4">
                                <asp:Label ID="Label_semicolon" runat="server" Text=":" Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style5">
                                <asp:TextBox ID="TextBox_MAXNUM" runat="server" Width="32px" Visible="False"></asp:TextBox>
                                <asp:Label ID="Label_MAXNUM_unit" runat="server" Text="명" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>검사 장소</td>
                            <td>:</td>
                            <td>
                                <asp:TextBox ID="TextBox_PLACE" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">검사시작시간</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:DropDownList ID="DropDownList_EXSTIME" runat="server" AutoPostBack="true">
                                    <asp:ListItem Value="00:00">00시</asp:ListItem>
                                    <asp:ListItem Value="01:00">01시</asp:ListItem>
                                    <asp:ListItem Value="02:00">02시</asp:ListItem>
                                    <asp:ListItem Value="03:00">03시</asp:ListItem>
                                    <asp:ListItem Value="04:00">04시</asp:ListItem>
                                    <asp:ListItem Value="05:00">05시</asp:ListItem>
                                    <asp:ListItem Value="06:00">06시</asp:ListItem>
                                    <asp:ListItem Value="07:00">07시</asp:ListItem>
                                    <asp:ListItem Value="08:00">08시</asp:ListItem>
                                    <asp:ListItem Value="09:00" Selected="True">09시</asp:ListItem>
                                    <asp:ListItem Value="10:00">10시</asp:ListItem>
                                    <asp:ListItem Value="11:00">11시</asp:ListItem>
                                    <asp:ListItem Value="12:00">12시</asp:ListItem>
                                    <asp:ListItem Value="13:00">13시</asp:ListItem>
                                    <asp:ListItem Value="14:00">14시</asp:ListItem>
                                    <asp:ListItem Value="15:00">15시</asp:ListItem>
                                    <asp:ListItem Value="16:00">16시</asp:ListItem>
                                    <asp:ListItem Value="17:00">17시</asp:ListItem>
                                    <asp:ListItem Value="18:00">18시</asp:ListItem>
                                    <asp:ListItem Value="19:00">19시</asp:ListItem>
                                    <asp:ListItem Value="20:00">20시</asp:ListItem>
                                    <asp:ListItem Value="21:00">21시</asp:ListItem>
                                    <asp:ListItem Value="22:00">22시</asp:ListItem>
                                    <asp:ListItem Value="23:00">23시</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">검사종료시간</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:DropDownList ID="DropDownList_EXETIME" runat="server" AutoPostBack="true">
                                    <asp:ListItem Value="00:00">00시</asp:ListItem>
                                    <asp:ListItem Value="01:00">01시</asp:ListItem>
                                    <asp:ListItem Value="02:00">02시</asp:ListItem>
                                    <asp:ListItem Value="03:00">03시</asp:ListItem>
                                    <asp:ListItem Value="04:00">04시</asp:ListItem>
                                    <asp:ListItem Value="05:00">05시</asp:ListItem>
                                    <asp:ListItem Value="06:00">06시</asp:ListItem>
                                    <asp:ListItem Value="07:00">07시</asp:ListItem>
                                    <asp:ListItem Value="08:00">08시</asp:ListItem>
                                    <asp:ListItem Value="09:00">09시</asp:ListItem>
                                    <asp:ListItem Value="10:00">10시</asp:ListItem>
                                    <asp:ListItem Value="11:00">11시</asp:ListItem>
                                    <asp:ListItem Value="12:00">12시</asp:ListItem>
                                    <asp:ListItem Value="13:00">13시</asp:ListItem>
                                    <asp:ListItem Value="14:00">14시</asp:ListItem>
                                    <asp:ListItem Value="15:00">15시</asp:ListItem>
                                    <asp:ListItem Value="16:00">16시</asp:ListItem>
                                    <asp:ListItem Value="17:00">17시</asp:ListItem>
                                    <asp:ListItem Value="18:00" Selected="True">18시</asp:ListItem>
                                    <asp:ListItem Value="19:00">19시</asp:ListItem>
                                    <asp:ListItem Value="20:00">20시</asp:ListItem>
                                    <asp:ListItem Value="21:00">21시</asp:ListItem>
                                    <asp:ListItem Value="22:00">22시</asp:ListItem>
                                    <asp:ListItem Value="23:00">23시</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">시간대별 예약 인원</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:TextBox ID="TextBox_EXNUM" runat="server" Width="32px">8</asp:TextBox>
                                명</td>
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
            <tr>
                <td>
                    수강중인 수강생
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="현재 수강하는 학생이 없습니다." ShowHeaderWhenEmpty="True"  BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="SBID,SBYEAR" DataSourceID="SelAtten" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="SID" HeaderText="학번" SortExpression="SID" />
                            <asp:BoundField DataField="SNAME" HeaderText="학생명" SortExpression="SNAME" />
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
                    <asp:SqlDataSource ID="SelAtten" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ATTENDEE.SID, STUDENT.SNAME, ATTENDEE.SBID, ATTENDEE.SBYEAR FROM ATTENDEE, STUDENT WHERE ATTENDEE.SID = STUDENT.SID AND (ATTENDEE.SBID = :SBID) AND (ATTENDEE.SBYEAR = :SBYEAR)">
                        <SelectParameters>
                            <asp:Parameter Name="SBID" Type="Decimal" />
                            <asp:Parameter Name="SBYEAR" Type="Decimal" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    
    </div>
        <p>
            <asp:Label ID="Label_SBID" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="Label_SBYEAR" runat="server" Visible="False"></asp:Label>
        </p>
    </form>
</body>
</html>
