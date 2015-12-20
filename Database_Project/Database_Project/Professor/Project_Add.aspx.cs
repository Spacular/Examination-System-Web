using System;
using System.Collections.Generic;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_Project.Professor
{
    public partial class Project_Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label tempLabel;
            Label tempLabel2;
            Label tempLabel3;
            if (this.PreviousPage != null)
            {
                tempLabel = (Label)this.PreviousPage.Form.FindControl("Label_SBNAME");
                tempLabel2 = (Label)this.PreviousPage.Form.FindControl("Label_SubYear");
                tempLabel3 = (Label)this.PreviousPage.FindControl("Label_SBID");
                Label_SBNAME.Text = tempLabel.Text;
                Label_SBYEAR.Text = tempLabel2.Text;
                Label_SBID.Text = tempLabel3.Text;
            }

            SelAtten.SelectParameters["SBID"].DefaultValue = Label_SBID.Text;
            SelAtten.SelectParameters["SBYEAR"].DefaultValue = Label_SBYEAR.Text;
            //refer http://egloos.zum.com/nom3203/v/1999538
            if (!IsPostBack) //백 버튼 구현 
            {
                ViewState["History"] = -1;
            }
            else
            {
                ViewState["History"] = Convert.ToInt32(ViewState["History"]) - 1;
            }
            Button_Cancel.Attributes["onclick"] = "history.go(" + ViewState["History"].ToString() + ");return false";
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox_EXDATE.Text = Calendar1.SelectedDate.ToShortDateString();
            
            Calendar1.Visible = false;
        }

        protected void DropDownList_PJTYPE_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList_PJTYPE.SelectedIndex == 1)
            {
                Label_MINNUM.Visible = true;
                Label_MINNUM_semicolon.Visible = true;
                TextBox_MINNUM.Visible = true;
                Label_MINNUM_unit.Visible = true;
                Label_MAXNUM.Visible = true;
                Label_semicolon.Visible = true;
                TextBox_MAXNUM.Visible = true;
                Label_MAXNUM_unit.Visible = true;
            }
            else
            {
                Label_MINNUM.Visible = false;
                Label_MINNUM_semicolon.Visible = false;
                TextBox_MINNUM.Visible = false;
                Label_MINNUM_unit.Visible = false;
                Label_MAXNUM.Visible = false;
                Label_semicolon.Visible = false;
                TextBox_MAXNUM.Visible = false;
                Label_MAXNUM_unit.Visible = false;
            }
        }

        protected void Button_Add_Click(object sender, EventArgs e)
        {
            String query;
            if (DropDownList_PJTYPE.SelectedIndex == 1)
            {
                query = "INSERT INTO PROJECT (EXDATE, SBID, PJTYPE, MINNUM, MAXNUM, EXNUM, PLACE, PJNAME, SBYEAR, EXSTIME, EXETIME)";
                query += "VALUES(to_date(:EXDATE,'yyyy/MM/dd'), :SBID, :PJTYPE, :MINNUM, :MAXNUM, :EXNUM, :PLACE, :PJNAME, :SBYEAR, :EXSTIME, :EXETIME)";

            }
            else
            {
                query = "INSERT INTO PROJECT (EXDATE, SBID, PJTYPE, EXNUM, PLACE, PJNAME, SBYEAR, EXSTIME, EXETIME)";
                query += "VALUES(to_date(:EXDATE,'yyyy/MM/dd'), :SBID, :PJTYPE, :EXNUM, :PLACE, :PJNAME, :SBYEAR, :EXSTIME, :EXETIME)";
            }
           
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            conn.Open();
            OracleCommand cmd = new OracleCommand(query, conn);
            
            DateTime exsdate = Convert.ToDateTime(TextBox_EXDATE.Text + " " + DropDownList_EXSTIME.SelectedValue);
            DateTime exedate = Convert.ToDateTime(TextBox_EXDATE.Text + " " + DropDownList_EXETIME.SelectedValue);
            cmd.Parameters.Add(new OracleParameter("EXDATE", TextBox_EXDATE.Text));
            cmd.Parameters.Add(new OracleParameter("SBID", Label_SBID.Text));
            cmd.Parameters.Add(new OracleParameter("PJTYPE", DropDownList_PJTYPE.SelectedValue));
            if (DropDownList_PJTYPE.SelectedIndex == 1)
            {
                cmd.Parameters.Add(new OracleParameter("MINNUM", TextBox_MINNUM.Text));
                cmd.Parameters.Add(new OracleParameter("MAXNUM", TextBox_MAXNUM.Text));
            }

            cmd.Parameters.Add(new OracleParameter("EXNUM", TextBox_EXNUM.Text));
            cmd.Parameters.Add(new OracleParameter("PLACE", TextBox_PLACE.Text));
            cmd.Parameters.Add(new OracleParameter("PJNAME", TextBox_PJNAME.Text));
            cmd.Parameters.Add(new OracleParameter("SBYEAR", Label_SBYEAR.Text));
            cmd.Parameters.Add(new OracleParameter("EXSTIME", exsdate.ToString("yyyy/MM/dd HH:mm")));
            cmd.Parameters.Add(new OracleParameter("EXETIME", exedate.ToString("yyyy/MM/dd HH:mm")));
            cmd.ExecuteNonQuery();

            conn.Dispose();
            cmd.Dispose();

            Server.Transfer("~/Professor/Subject.aspx", true);
            //Response.Write("<script>history.go(" + ViewState["History"].ToString() + ");return false</script>");
            //Response.Clear();
            //Response.Write("<html><body><script>history.go(" + ViewState["History"].ToString() + ");location.reload();</script></body></html>");
            //Response.Write("<html><body><script>window.location.reload(history.go(" + ViewState["History"].ToString() + "));location.reload();</script></body></html>");
            //Response.Flush();
            //Response.End();
           // Response.Redirect("~/Professor/Subject.aspx");
        }
    }
}