using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Data;

namespace Database_Project.Register
{
    public partial class Rereg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Change(object sender, EventArgs e)
        {
            String Passwd = Request.Params["passwd"];
            String ID = Session["SID"].ToString();

            // update쿼리문
            String query_passwd = String.Format("update student set spwd = '{0}' where sid = '{1}'", Passwd, ID);
            // select 쿼리문
            String query_pwd = String.Format("select spwd from student where sid = '{0}'", ID);

            // sql 쿼리 수행
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = "Data Source=xe; User ID=team43; Password=12345678";
            OracleCommand cmd = new OracleCommand(query_pwd, conn);

            // DataAdapter 개체 생성 -> DataSet에 data를 넣을 때, DB에 data update할 때 사용.
            OracleDataAdapter adapter = new OracleDataAdapter();
            // OracleDataAdapter 클래스의 select문에 관련된 설정.
            adapter.SelectCommand = cmd;
            cmd = new OracleCommand(query_passwd, conn);
            // OracleDataAdapter 클래스의 update문에 관련된 설정.
            adapter.UpdateCommand = cmd;

            DataSet dataset = new DataSet();
            adapter.Fill(dataset, "student");
            DataTable table = new DataTable();
            table = dataset.Tables["student"];
            DataRow[] row = table.Select();

            row[0]["spwd"] = Passwd;

            adapter.Update(row);

            Response.Redirect("../Index.aspx");
        }
    }
}