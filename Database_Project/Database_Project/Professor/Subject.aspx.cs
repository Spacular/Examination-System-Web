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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.PreviousPage != null)
            {
                //refer : http://www.aspsnippets.com/Articles/Pass-Selected-Row-of-ASPNet-GridView-control-to-another-Page.aspx
                //refer : http://www.codeproject.com/Articles/16756/Cross-Page-Postbacks-on-a-GridView
                if (Request.Cookies["PTAB"] != null)
                {
                    String curCookie = Server.UrlDecode(Request.Cookies.Get("PTAB")["SBNAME"]);
                    Label_SBID.Text = Request.Cookies["PTAB"]["SBID"];
                    TextBox_SBNAME.Text = Label_SBNAME.Text = curCookie;
                    Label_SubYear.Text = Request.Cookies["PTAB"]["SBYEAR"];
                    TextBox_TYEAR.Text = Request.Cookies["PTAB"]["TYEAR"];
                    TextBox_TTERM.Text = Request.Cookies["PTAB"]["TTERM"];
                    Label_StuNumber.Text = Request.Cookies["PTAB"]["STNUM"];
                }
                
                //Bind Gridview
                //SelProjects.SelectParameters.Add(":SBID", DbType.Decimal, SBID);
                SelProjects.SelectParameters["SBID"].DefaultValue = Label_SBID.Text;

            }
            
        }

        protected void Button_AddProj_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Professor/Project_Add.aspx", true);
            GridView1.DataBind();
        }

        protected void Button_modify_Click(object sender, EventArgs e)
        {
            String query = "UPDATE SUBJECT SET SBNAME=:SBNAME,TYEAR=:TYEAR,TTERM=:TTERM WHERE SBID=:SBID AND SBYEAR=:SBYEAR AND PID=:PID";
            //String query_cascade_Proj = "UPDATE PROJECT SET SBID=:NEWSBID WHERE SBID=:OLDSBID AND SBYEAR=:SBYEAR";
            //String query_cascade_Atten = "UPDATE ATTENDEE SET SBID=:NEWSBID WHERE SBID=:OLDSBID AND SBYEAR=:SBYEAR";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            
            conn.Open();
            OracleCommand cmd = new OracleCommand(query, conn);
            cmd.Parameters.Add(new OracleParameter("SBID", Label_SBID.Text));
            cmd.Parameters.Add(new OracleParameter("SBYEAR", Label_SubYear.Text));
            cmd.Parameters.Add(new OracleParameter("SBNAME", TextBox_SBNAME.Text));
            cmd.Parameters.Add(new OracleParameter("TYEAR", TextBox_TYEAR.Text));
            cmd.Parameters.Add(new OracleParameter("TTERM", TextBox_TTERM.Text));
            cmd.Parameters.Add(new OracleParameter("PID", Session["PID"].ToString()));
            cmd.ExecuteNonQuery();
            GridView1.DataBind();
            conn.Dispose();
            cmd.Dispose();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
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