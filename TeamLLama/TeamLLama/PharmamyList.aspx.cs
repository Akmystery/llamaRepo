using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeamLLama.Controller;

namespace TeamLLama
{
    public partial class pharmacy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("pharmacy_name");
                dt.Columns.Add("pharmacy_address");
                
                grdPharmacy.DataSource = dt;
                grdPharmacy.DataBind();
            }
        }
        private void bindData()
        {
            string selected = rbnCategory.SelectedValue;
            FacilityManagementSystem app = new FacilityManagementSystem();

            grdPharmacy.DataSource = app.getPharmacyData(selected);
            grdPharmacy.DataBind();

        }
        protected void rbnCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void grdPharmacy_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdPharmacy.PageIndex = e.NewPageIndex;
            bindData();
        }

        protected void bnSelect_Click(object sender, EventArgs e)
        {
            bindData();
        }
    }
}