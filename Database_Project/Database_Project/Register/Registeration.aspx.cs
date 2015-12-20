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
    public partial class Registeration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Registration(object sender, EventArgs e)
        {
            String SID = "";
            String Passwd = "";
            String sname = "";
            String dname = "";
            String sex = "";
            String phone = "";
            String msg = "";

            SID = Request.Params["SID"];
            Passwd = Request.Params["Passwd"];
            sname = Request.Params["sname"];
            dname = Request.Params["dname"];
            sex = Request.Params["sex"];
            phone = Request.Params["phone"];

            if (SID == "")
            {
                msg = "학번을 입력해 주세요!";
                Response.Write("<script type='text/javascript'> alert('" + msg + "');</script>");
            }
            else if (Passwd == "")
            {
                msg = "비밀번호를 입력해 주세요!";
                Response.Write("<script type='text/javascript'> alert('" + msg + "');</script>");
            }
            else if (sname == "")
            {
                msg = "이름을 입력해 주세요!";
                Response.Write("<script type='text/javascript'> alert('" + msg + "');</script>");
            }
            else if (dname == "")
            {
                msg = "학과를 입력해 주세요!";
                Response.Write("<script type='text/javascript'> alert('" + msg + "');</script>");
            }
            else if (sex == null)
            {
                msg = "성별을 선택해 주세요!";
                Response.Write("<script type='text/javascript'> alert('" + msg + "');</script>");
            }
            else if (phone == "")
            {
                msg = "전화번호를 입력해 주세요!";
                Response.Write("<script type='text/javascript'> alert('" + msg + "');</script>");
            }
            else
            {
                String query_sid = String.Format("select sid from student where sid = '{0}'", SID);
                String query_passwd = String.Format("select spwd from student where spwd = '{0}'", Passwd);

                // sql 쿼리 수행
                OracleConnection conn = new OracleConnection();
                conn.ConnectionString = "Data Source=xe; User ID=team43; Password=12345678";
                OracleCommand cmd = new OracleCommand(query_sid, conn);

                // DataAdapter 개체 생성 -> DataSet에 data를 넣을 때, DB에 data update할 때 사용.
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = cmd;

                // DataSet 개체 생성
                DataSet dataset = new DataSet();
                // dataset에 adapter 개체의 값을 집어 넣기.
                adapter.Fill(dataset, "student");
                // DataSet 안에 DataTable이 있고, DataTable 안에 DataRow가 있고, DataRow에서 DataColumn을 참조해서 출력.
                DataTable table = new DataTable();
                table = dataset.Tables["student"];
                // 만약 아이디가 존재한다면
                if (table != null && table.Rows.Count > 0)
                {
                    DataRow[] row = table.Select();
                    // 아이디가 일치하지 않는다면
                    if (row[0]["sid"].ToString().Equals(SID) == false)
                    {
                        msg = "잘못된 학번입니다! 다시 입력해 주세요!";
                        Response.Write("<script type='text/javascript'> alert('" + msg + "');</script>");
                    }
                    else
                    {
                        cmd.CommandText = query_passwd;
                        cmd.CommandType = CommandType.Text;
                        adapter.SelectCommand = cmd;
                        dataset.Clear();
                        adapter.Fill(dataset, "student");
                        table = dataset.Tables["student"];
                        row = table.Select();
                        if (row.Length != 0)
                        {
                            Session.Add("SID", SID);
                            // 페이지 이동
                            Server.Transfer("Rereg.aspx");
                        }
                        else
                        {
                            msg = "잘못된 비밀번호입니다! 다시 입력해 주세요!";
                            Response.Write("<script type='text/javascript'> alert('" + msg + "');</script>");
                        }
                    }
                }
                else
                {
                    msg = "존재하지 않는 학생입니다! 다시 입력해 주세요!";
                    Response.Write("<script type='text/javascript'> alert('" + msg + "');</script>");
                }
            }
        }
        protected void goback(object sender, EventArgs e)
        {
            Response.Redirect("../Index.aspx");
        }
    }
}