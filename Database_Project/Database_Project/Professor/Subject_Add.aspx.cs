using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.OracleClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_Project.Professor
{
    public partial class Subject_Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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

        protected void Button_Add_Click(object sender, EventArgs e)
        {
            try
            {
                String query_atten;
                String query_student;
                String query;
                String SBYEAR = DateTime.Now.ToString("yyyy");

                query_student = "INSERT INTO STUDENT (SID, SNAME, DNAME, SEX, GRADE) ";
                query_student += "VALUES(:SID, :SNAME, :DNAME, :SEX, :GRADE)";
                query_atten = "INSERT INTO ATTENDEE (SID, SBID, STATUS, SBYEAR) ";
                query_atten += "VALUES(:SID, :SBID, :STATUS, :SBYEAR)";

                query = "INSERT INTO SUBJECT (SBID, SBNAME, TYEAR, TTERM, SNUMBER, PID, SBYEAR) ";
                query += "VALUES(:SBID, :SBNAME, :TYEAR, :TTERM, :SNUMBER, :PID, :SBYEAR)";

                OracleConnection conn = new OracleConnection();
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                conn.Open();

                OracleCommand cmd = new OracleCommand(query_student, conn);
                int index = GridView1.Rows.Count;

                for (int i = 0; i < index; i++)
                {
                    cmd.Parameters.Add(new OracleParameter("SID", GridView1.Rows[i].Cells[0].Text));
                    cmd.Parameters.Add(new OracleParameter("SBNAME", GridView1.Rows[i].Cells[1].Text));
                    cmd.Parameters.Add(new OracleParameter("DNAME", GridView1.Rows[i].Cells[2].Text));
                    cmd.Parameters.Add(new OracleParameter("SEX", GridView1.Rows[i].Cells[3].Text));
                    cmd.Parameters.Add(new OracleParameter("GRADE", GridView1.Rows[i].Cells[4].Text));

                    cmd.ExecuteNonQuery();

                    cmd.Parameters.Clear();
                }
                cmd.CommandText = query_atten;
                for (int i = 0; i < index; i++)//append where paramater into query
                {
                    cmd.Parameters.Add(new OracleParameter("SID", GridView1.Rows[i].Cells[0].Text));
                    cmd.Parameters.Add(new OracleParameter("SBID", TextBox_SBID.Text));
                    cmd.Parameters.Add(new OracleParameter("STATUS", "N"));
                    cmd.Parameters.Add(new OracleParameter("SBYEAR", SBYEAR));

                    cmd.ExecuteNonQuery();

                    cmd.Parameters.Clear();

                }
                cmd.CommandText = query;

                query = "INSERT INTO SUBJECT (SBID, SBNAME, TYEAR, TTERM, SNUMBER, PID, SBYEAR) ";
                query += "VALUES(:SBID, :SBNAME, :TYEAR, :TTERM, :SNUMBER, :PID, :SBYEAR)";

                cmd.Parameters.Add(new OracleParameter("SBID", TextBox_SBID.Text));
                cmd.Parameters.Add(new OracleParameter("SBNAME", TextBox_SBNAME.Text));
                cmd.Parameters.Add(new OracleParameter("TYEAR", TextBox_TYEAR.Text));
                cmd.Parameters.Add(new OracleParameter("TTERM", TextBox_TTERM.Text));
                cmd.Parameters.Add(new OracleParameter("SNUMBER", index));
                cmd.Parameters.Add(new OracleParameter("PID", Session["PID"]));
                cmd.Parameters.Add(new OracleParameter("SBYEAR", SBYEAR));
                cmd.ExecuteNonQuery();

                conn.Dispose();
                cmd.Dispose();

                Server.Transfer("~/Professor/Main.aspx", true);
            }
            catch (Exception E)
            {
                Response.Write(E);
            }
            
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            //Get path from web.config file to upload
            string FilePath = "~/";
            string filename = string.Empty;
            //To check whether file is selected or not to uplaod
            if (FileUploadToServer.HasFile)
            {
                try
                {
                    string[] allowdFile = { ".xls", ".xlsx" };
                    //Here we are allowing only excel file so verifying selected file pdf or not
                    string FileExt = System.IO.Path.GetExtension(FileUploadToServer.PostedFile.FileName);
                    //Check whether selected file is valid extension or not
                    bool isValidFile = allowdFile.Contains(FileExt);
                    if (!isValidFile)
                    {
                        lblMsg.Visible = true;
                        lblMsg.ForeColor = System.Drawing.Color.Red;
                        lblMsg.Text = "Please upload only Excel";
                    }
                    else
                    {
                        // Get size of uploaded file, here restricting size of file
                        int FileSize = FileUploadToServer.PostedFile.ContentLength;
                        if (FileSize <= 1048576)//1048576 byte = 1MB
                        {
                            //Get file name of selected file
                            filename = Path.GetFileName(Server.MapPath(FileUploadToServer.FileName));

                            //Save selected file into server location
                            FileUploadToServer.SaveAs(Server.MapPath(FilePath) + filename);
                            //Get file path
                            string filePath = Server.MapPath(FilePath) + filename;
                            //Open the connection with excel file based on excel version
                            OleDbConnection con = null;
                            if (FileExt == ".xls")
                            {
                                con = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filePath + ";Extended Properties=Excel 8.0;");

                            }
                            else if (FileExt == ".xlsx")
                            {
                                con = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";Extended Properties=Excel 12.0;");
                            }
                            con.Open();
                            //Get the list of sheet available in excel sheet
                            DataTable dt = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                            //Get first sheet name
                            string getExcelSheetName = dt.Rows[0]["Table_Name"].ToString();
                            //Select rows from first sheet in excel sheet and fill into dataset
                            OleDbCommand ExcelCommand = new OleDbCommand(@"SELECT * FROM [" + getExcelSheetName + @"]", con);
                            OleDbDataAdapter ExcelAdapter = new OleDbDataAdapter(ExcelCommand);
                            DataSet ExcelDataSet = new DataSet();
                            ExcelAdapter.Fill(ExcelDataSet);
                            con.Close();
                            //Bind the dataset into gridview to display excel contents
                            GridView1.DataSource = ExcelDataSet;
                            GridView1.DataBind();
                            lblMsg.Visible = false;
                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Attachment file size should not be greater then 1 MB!";
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error occurred while uploading a file: " + ex.Message;
                }
            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Please select a file to upload.";
            }
        }
    }
}