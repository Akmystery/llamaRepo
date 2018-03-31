using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeamLLama.Controller;
using TeamLLama.Entity;
using System.IO;
using System.Data;

namespace TeamLLama
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Create_Click(object sender, EventArgs e)
        {
            Validation vc = new Validation();
            bool check = true;

            if (vc.isEmpty(txtName.Text))
            {
                lblName.Text = "Name cannot be empty";
                check = false;
            }
            if (vc.isEmpty(txtInfo.Text))
            {
                lblInfo.Text = "Info cannot be empty";
                check = false;
            }
            if (vc.isEmpty(txtPhoneNumber.Text))
            {
                lblPhoneNumber.Text = "PhoneNumber cannot be empty";
                check = false;
            }
            if (vc.isEmpty(txtOpening.Text))
            {
                lblOpening.Text = "Opening Hours cannot be empty";
                check = false;
            }
            if (vc.isEmpty(txtClosing.Text))
            {
                lblClosing.Text = "Closing Hours cannot be empty";
                check = false;
            }
            if (vc.isEmpty(txtAddress.Text))
            {
                lblAddress.Text = "Address cannot be empty";
                check = false;
            }
            if (vc.isEmpty(txtRegion.Text))
            {
                lblRegion.Text = "Region cannot be empty";
                check = false;
            }
            if (ImageUpload.HasFile)
            {
                string ext = System.IO.Path.GetExtension(ImageUpload.PostedFile.FileName);
                if (!vc.ImageCheck(ext))
                {
                    check = false;
                    lblImage.Text = "Invalid image type";
                }
            }

            if (check == true)
            {
                Facility f = new Facility();
                f.facilityName = txtName.Text;
                f.facilityType = listFacility.SelectedItem.Text;
                f.generalInfo = txtInfo.Text;
                f.phoneNumber = Int32.Parse(txtPhoneNumber.Text);
                f.openingHrs = txtOpening.Text;
                f.closingHrs = txtClosing.Text;
                f.address = txtAddress.Text;
                f.region = txtRegion.Text;


                if (ImageUpload.HasFile)
                {
                    f.image = Path.GetFileName(ImageUpload.PostedFile.FileName);
                    ImageUpload.PostedFile.SaveAs(Server.MapPath("~/upload/facility/") + f.image);
                }

                FacilityManagementSystem app = new FacilityManagementSystem();

                app.CreateFacility(f);

                Response.Redirect("AdminHomePage.aspx", false);

            }

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHomePage.aspx");
        }

        protected void bn_search_Click(object sender, EventArgs e)
        {
            bindData();
        }
        private void bindData()
        {
            FacilityManagementSystem app = new FacilityManagementSystem();
            List<SearchResults> results = app.getAPIData(txtName.Text);
            DataTable dt = new DataTable();
            dt.Columns.Add("Building");
            dt.Columns.Add("Address");
            dt.Columns.Add("Postal");

            for (int i = 0; i < results.Count; i++)
            {
                dt.Rows.Add();
                dt.Rows[i]["Building"] = results.ElementAt(i).building;
                dt.Rows[i]["Address"] = results.ElementAt(i).address;
                dt.Rows[i]["Postal"] = results.ElementAt(i).postal;
            }
            grdFacilities.DataSource = dt;
            grdFacilities.DataBind();

            confirmPopup.Show();
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            GridViewRow row = (GridViewRow)button.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            System.Web.UI.WebControls.Label lblAddress = grdFacilities.Rows[i].FindControl("lblAddress") as System.Web.UI.WebControls.Label;
            System.Web.UI.WebControls.Label lblBuilding = grdFacilities.Rows[i].FindControl("lblBuilding") as System.Web.UI.WebControls.Label;

            txtAddress.Text = lblAddress.Text;
            txtName.Text = lblBuilding.Text;
            confirmPopup.Hide();
        }

        protected void grdFacilities_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdFacilities.PageIndex = e.NewPageIndex;
            bindData();
        }
    }
}