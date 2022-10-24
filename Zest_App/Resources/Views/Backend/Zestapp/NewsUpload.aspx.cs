using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Common;
using Zest_App.Models;
using Zest_App.Resources.Layout;

namespace Zest_App.Resources.Views.Backend.Zestapp
{
    public partial class NewsUpload : System.Web.UI.Page
    {
        [WebMethod]
        public static string heartbeat()
        {
            var heartbeat = DateTime.Now;
            HttpContext.Current.Session["Heartbeat"] = heartbeat;
            return heartbeat.ToString();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            var master = Master as backend;
            if (master != null)
            {
                master.load();
            }
            if (!this.IsPostBack)
            {
            }

        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                string FolderPath = "/newsfile/";

                string FilePath = Server.MapPath(FolderPath + FileName);

                FileUpload1.SaveAs(FilePath);
                Import_To_Grid(FilePath, Extension, rbHDR.SelectedItem.Text);
            }
        }
        private void Import_To_Grid(string FilePath, string Extension, string isHDR)
        {
            string conStr = "";
            switch (Extension)
            {
                case ".xls": //Excel 97-03
                    conStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Extended Properties='Excel 8.0;HDR={1}'";
                    break;
                case ".xlsx": //Excel 07
                    conStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='Excel 8.0;HDR={1}'";
                    break;
            }
            conStr = String.Format(conStr, FilePath, isHDR);
            OleDbConnection connExcel = new OleDbConnection(conStr);
            OleDbCommand cmdExcel = new OleDbCommand();
            OleDbDataAdapter oda = new OleDbDataAdapter();
            DataTable dt = new DataTable();
            cmdExcel.Connection = connExcel;

            //Get the name of First Sheet
            connExcel.Open();
            DataTable dtExcelSchema;
            dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
            string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
            connExcel.Close();

            //Read Data from First Sheet
            connExcel.Open();
            cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";
            oda.SelectCommand = cmdExcel;
            oda.Fill(dt);
            connExcel.Close();

            //Bind Data to GridView
            dgvTable.Caption = Path.GetFileName(FilePath);
            dgvTable.DataSource = dt;
            dgvTable.DataBind();
        }

        protected void dgvTable_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            string FolderPath = "/newsfile/";
            string FileName = dgvTable.Caption;
            string Extension = Path.GetExtension(FileName);
            string FilePath = Server.MapPath(FolderPath + FileName);

            Import_To_Grid(FilePath, Extension, rbHDR.SelectedItem.Text);
            dgvTable.PageIndex = e.NewPageIndex;
            dgvTable.DataBind();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                foreach (GridViewRow item in dgvTable.Rows)
                {
                    string url_img = item.Cells[3].Text;
                    string symbol = item.Cells[6].Text;

                    var logo = (from t in ctx.assets_logos
                                where t.asset_code == symbol
                                select t).FirstOrDefault();

                    if(logo != null)
                    {
                        url_img = logo.img_url;
                    }

                    news new_item = new news
                    {
                        created_at = DateTime.Now,
                        updated_at = DateTime.Parse(item.Cells[0].Text),
                        estado = "A",
                        descripcion = item.Cells[3].Text,
                        nota_codigo = symbol,
                        tags = item.Cells[5].Text,
                        tipo = item.Cells[1].Text == "MACRO" ? "MERCADO" : item.Cells[1].Text,
                        titular = item.Cells[2].Text,
                        url_img = url_img,
                        web_mobile = "mobile",
                        cta = item.Cells[4].Text,
                    };

                    ctx.news.Add(new_item);

                }
                ShowMessage.success("Las noticias han sido guardadas y publicadas correctamente ", this);
                ctx.SaveChanges();
                dgvTable.DataSource = null;
                dgvTable.DataBind();
                SendNotification.send("Noticias Zest", "Revisa los eventos macroeconómicos más importantes del día");

            }
        }
    }
}