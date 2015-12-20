using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OracleClient;

namespace Database_Project
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void Login(object sender, EventArgs e)
        {
            String ID = "";
            String Passwd = "";
            String query_sid = "";
            String query_plid = "";
            String query_spwd = "";
            String query_ppwd = "";
            String msg = "";

            ID = Request.Params["loginID"];
            Passwd = Request.Params["password"];
            // HTML 폼에서 입력한 값들을 C# 변수에 할당.

            if(ID == "")
            {
                msg = "아이디를 입력해 주세요.";
                Response.Write("<script type='text/javascript'> alert('" + msg + "');</script>");
            }
            else if(Passwd == "")
            {
                msg = "비밀번호를 입력해주세요.";
                Response.Write("<script type='text/javascript'> alert('" + msg + "');</script>");
            }
            else
            {
                query_sid = String.Format("select sid from student where sid = '{0}'", ID);
                query_plid = String.Format("select plid from professor where plid = '{0}'", ID);
                query_spwd = String.Format("select spwd from student where spwd = '{0}'", Passwd);
                query_ppwd = String.Format("select ppwd from professor where ppwd = '{0}'", Passwd);

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

                // 만약 table의 row가 하나라도 있다면 체크
                if (table != null && table.Rows.Count > 0)
                {
                    DataRow[] row = table.Select();
                    // 아이디가 일치하지 않는다면
                    if (row[0]["sid"].ToString().Equals(ID) == false)
                    {
                        // 쿼리문 교체 및 dataset 초기화
                        cmd.CommandText = query_plid;
                        cmd.CommandType = CommandType.Text;
                        adapter.SelectCommand = cmd;
                        dataset.Clear();
                        adapter.Fill(dataset, "professor");
                        row = table.Select();
                    }
                    else
                    {
                        cmd.CommandText = query_spwd;
                        cmd.CommandType = CommandType.Text;
                        adapter.SelectCommand = cmd;
                        dataset.Clear();
                        adapter.Fill(dataset, "student");
                        row = table.Select();
                        // 비밀번호까지 일치하면
                        if (row.Length != 0)
                        {
                            // 학생 페이지로 이동
                            Session.Add("SID", ID);
                            Server.Transfer("~/Student/Student.aspx");
                        }
                        else
                        {
                            // 비밀번호가 다르면 에러메세지 띄우고 다시.
                            msg = "비밀번호가 일치하지 않습니다. 다시 로그인 해주세요.";
                            Response.Write("<script type='text/javascript'> alert('" + msg + "');</script>");
                        }
                    }
                }
                // 학생 ID가 아니라면
                else
                {
                    DataRow[] row = table.Select();
                    // 쿼리문 교체하고 dataset 초기화
                    cmd.CommandText = query_plid;
                    cmd.CommandType = CommandType.Text;
                    adapter.SelectCommand = cmd;
                    dataset.Clear();
                    adapter.Fill(dataset, "professor");
                    table = dataset.Tables["professor"];
                    row = table.Select();
                    // 만약 존재하는 교번이라면
                    if (table != null && table.Rows.Count > 0)
                    {
                        // 만약 교번마저 일치하지 않는다면
                        if (row[0]["plid"].ToString().Equals(ID) == false)
                        {
                            msg = "아이디가 일치하지 않습니다. 다시 로그인 해주세요.";
                            Response.Write("<script type='text/javascript'> alert('" + msg + "');</script>");
                        }
                        // 교번이 일치한다면 비밀번호를 확인!
                        else
                        {
                            // 쿼리문 교체 dataset 초기화
                            cmd.CommandText = query_ppwd;
                            cmd.CommandType = CommandType.Text;
                            adapter.SelectCommand = cmd;
                            dataset.Clear();
                            adapter.Fill(dataset, "professor");
                            table = dataset.Tables["professor"];
                            row = table.Select();
                            if (row.Length != 0)
                            {
                                // 페이지 이동
                                Session.Add("PLID", ID);
                                Server.Transfer("~/Professor/Main.aspx");
                            }
                            else
                            {
                                msg = "비밀번호가 일치하지 않습니다. 다시 로그인 해주세요.";
                                Response.Write("<script type='text/javascript'> alert('" + msg + "');</script>");
                            }
                        }
                    }
                    // 교번이 존재하지 않는다면
                    else
                    {
                        msg = "아이디가 존재하지 않습니다. 다시 로그인 해주세요.";
                        Response.Write("<script type='text/javascript'> alert('" + msg + "');</script>");
                    }
                }
            }
        }

        protected void Register(object sender, EventArgs e)
        {
            Response.Redirect("~/Register/Registeration.aspx");
        }
    }
}