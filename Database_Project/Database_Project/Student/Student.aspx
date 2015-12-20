<%@ Page Language="C#" AutoEventWireup="true" Inherits="Database_Project.Student.WebForm1" %>
<%@ Import Namespace="System.Data.OracleClient" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 8px;
        }
        .auto-style2 {
            width: 131px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Table ID="Table1" runat="server" Width="257px">
            <asp:TableHeaderRow>      
                <asp:TableCell>검사 가능 시간대</asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="DropDownList1" runat="server"> 
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableHeaderRow>
        </asp:Table>
    </form>
    <script runat="server" >
        protected void Page_Load(object sender, EventArgs e)
        {
            
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = "Data Source=xe; User ID=team43; Password=12345678";
            OracleCommand cmd = new OracleCommand(query_sid, conn);

            // DataAdapter 개체 생성 -> DataSet에 data를 넣을 때, DB에 data update할 때 사용.
            OracleDataAdapter adapter = new OracleDataAdapter();
            adapter.SelectCommand = cmd;

            ArrayList arr = new ArrayList();
            arr.Add("")
            DropDownList1.
        }
    </script>
</body>
</html>
