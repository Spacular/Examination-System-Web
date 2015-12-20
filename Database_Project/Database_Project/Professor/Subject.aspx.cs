using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_Project.Professor
{
    public partial class Subject : System.Web.UI.Page
    {
        String SBID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.PreviousPage != null)
            {
                //refer : http://www.aspsnippets.com/Articles/Pass-Selected-Row-of-ASPNet-GridView-control-to-another-Page.aspx
                //refer : http://www.codeproject.com/Articles/16756/Cross-Page-Postbacks-on-a-GridView
                GridView GridView1 = (GridView)this.PreviousPage.Form.FindControl("GridView1");
                GridViewRow selectedRow = GridView1.SelectedRow;
                //Response.Write("Bingo!!! I got the selected Username: " + selectedRow.Cells[0].Text);
                
                //Set SubJect
                TextBox_SBID.Text = SBID = selectedRow.Cells[0].Text;
                TextBox_SBNAME.Text = Label1.Text = selectedRow.Cells[1].Text;
                Label_SubYear.Text = selectedRow.Cells[5].Text + "년";
                TextBox_TYEAR.Text = selectedRow.Cells[2].Text;
                TextBox_TTERM.Text = selectedRow.Cells[3].Text;
                Label_StuNumber.Text = selectedRow.Cells[4].Text + "명";

                //Bind Gridview
                //SelProjects.SelectParameters.Add(":SBID", DbType.Decimal, SBID);
                SelProjects.SelectParameters["SBID"].DefaultValue = SBID;
            }
            

        }

        protected void Button_AddProj_Click(object sender, EventArgs e)
        {

        }

        protected void Button_modify_Click(object sender, EventArgs e)
        {
            String query = "UPDATE SUBJECT SET ";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            //query
            //query += "SBID=" + SBID;
            //query += " AND SBYEAR=" + Label_SubYear.Text;
            //Response.Write(query);
            conn.Open();
            OracleCommand cmd = new OracleCommand(query, conn);
            cmd.ExecuteNonQuery();

            GridView1.DataBind();
            conn.Dispose();
            cmd.Dispose();
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewProject")
            {
                int index = Int32.Parse(e.CommandArgument.ToString());
                GridView1.SelectRow(index);
                Server.Transfer("~/Professor/Subject.aspx", true);
            }
            if (e.CommandName == "ModifyProject")
            {
                int index = Int32.Parse(e.CommandArgument.ToString());
                GridView1.SelectRow(index);
                Server.Transfer("~/Professor/Subject.aspx", true);
            }
            if (e.CommandName == "DeleteProject") //refer : http://www.java2s.com/Tutorial/CSharp/0560__ADO.Net/DoadeletecommandtoOracledatabase.htm
            {
                String query = "DELETE FROM PROJECT WHERE EXDATE=to_date(:EXDATE,'yyyy/MM/dd') AND SBID=:SBID AND PJNAME=:PJNAME";
                
                OracleConnection conn = new OracleConnection();
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                
                int index = Int32.Parse(e.CommandArgument.ToString());
                GridView1.SelectRow(index);
                GridViewRow selectedRow = GridView1.SelectedRow;
                conn.Open();
                OracleCommand cmd = new OracleCommand(query, conn);
                cmd.Parameters.Add(new OracleParameter("EXDATE", selectedRow.Cells[0].Text));
                cmd.Parameters.Add(new OracleParameter("SBID", selectedRow.Cells[1].Text));
                cmd.Parameters.Add(new OracleParameter("PJNAME", selectedRow.Cells[2].Text));
                cmd.ExecuteNonQuery();

                GridView1.DataBind();
                conn.Dispose();
                cmd.Dispose();
            }
        }
    }
}