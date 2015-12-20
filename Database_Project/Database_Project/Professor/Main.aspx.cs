using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Data;



namespace Database_Project.Professor
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["PID"] = "21111797";
            Session.Add("PID", "21111797");
            LoadGridProj();
        }
        protected void LoadGridProj()
        {

            String query = "SELECT EXDATE, SBID, PJNAME, PJTYPE, PLACE FROM PROJECT WHERE ";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //index is Rows Length;
            int index = GridView1.Rows.Count;
            for (int i = 0; i < index; i++)//append where paramater into query
            {

                query += "SBID=" + GridView1.Rows[i].Cells[0].Text;
                if (i != index - 1)
                    query += " OR "; //dont append last paramater
            }
            //Response.Write(query);

            OracleCommand cmd = new OracleCommand(query, conn);

            // DataAdapter 개체 생성 -> DataSet에 data를 넣을 때, DB에 data update할 때 사용.
            OracleDataAdapter adapter = new OracleDataAdapter();
            adapter.SelectCommand = cmd;
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.DataBind();

            //Distructer
            adapter.Dispose();
            conn.Dispose();
            cmd.Dispose();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewSubject") //Refer http://www.ezzylearning.com/tutorial/using-button-columns-in-gridview
            {
                int index = Int32.Parse(e.CommandArgument.ToString());
                GridView1.SelectRow(index);
                Response.Cookies["PTAB"]["SBID"] = GridView1.SelectedRow.Cells[0].Text;
                Response.Cookies["PTAB"]["SBNAME"] = Server.UrlEncode(GridView1.SelectedRow.Cells[1].Text);
                Response.Cookies["PTAB"]["SBYEAR"] = GridView1.SelectedRow.Cells[5].Text;
                Response.Cookies["PTAB"]["TYEAR"] = GridView1.SelectedRow.Cells[2].Text;
                Response.Cookies["PTAB"]["TTERM"] = GridView1.SelectedRow.Cells[3].Text;
                Response.Cookies["PTAB"]["STNUM"] = GridView1.SelectedRow.Cells[4].Text;

                Server.Transfer("~/Professor/Subject.aspx", true);
            }
        }

        protected void Button_Add_Proj_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Professor/Subject_Add.aspx", true);
        }
    }
    


}