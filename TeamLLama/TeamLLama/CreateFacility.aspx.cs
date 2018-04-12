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
using System.Collections;

namespace TeamLLama
{
    public partial class WebForm3 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Account a = new Account();
            a = (Account)Session["Account"];

            if (a == null)
            {
                Response.Redirect("LoginPage.aspx");
            }
            if (!a.accountType.Equals("admin"))
            {
                Response.Redirect("LoginPage.aspx");
            }
        }


        protected void Create_Click(object sender, EventArgs e)
        {
            bool check = true;

            if (Validation.isEmpty(txtName.Text))
            {
                lblName.Text = "Name cannot be empty";
                check = false;
            }
            if (Validation.isEmpty(txtInfo.Text))
            {
                lblInfo.Text = "Info cannot be empty";
                check = false;
            }
            if (Validation.isEmpty(txtPhoneNumber.Text))
            {
                lblPhoneNumber.Text = "PhoneNumber cannot be empty";
                check = false;
            }
            if (Validation.isEmpty(txtOpeninghr.Text))
            {
                lblOpening.Text = "Opening Hours cannot be empty";
                check = false;
            }
            if (Validation.isEmpty(txtClosinghr.Text))
            {
                lblClosing.Text = "Closing Hours cannot be empty";
                check = false;
            }
            if (Validation.isEmpty(txtAddress.Text))
            {
                lblAddress.Text = "Address cannot be empty";
                check = false;
            }
            if (Validation.isEmpty(txtRegion.Text))
            {
                lblRegion.Text = "Region cannot be empty";
                check = false;
            }
            if (ImageUpload.HasFile)
            {
                string ext = System.IO.Path.GetExtension(ImageUpload.PostedFile.FileName);
                byte[] bytes = ImageUpload.FileBytes;
                int width;
                int height;

                using (Stream memStream = new MemoryStream(bytes))
                {
                    using (System.Drawing.Image img = System.Drawing.Image.FromStream(memStream))
                    {
                        width = img.Width;
                        height = img.Height;
                    }
                }
                if (!Validation.ImageCheck(ext))
                {
                    check = false;
                    lblImage.Text = "Invalid image type";
                }
                else if (width > 720 || height > 480)
                {
                    lblImage.Text = "Profile Picture size does not meet specified requirements 720x480 pixels";
                    check = false;
                }
            }

            if (CreateDepartmentList.Items.Cast<ListItem>().Count(li => li.Selected) == 0)
            {
                check = false;
                lblDepartmentList.Text = "Please select at least 1 department";
            }

            if (check == true)
            {
                Facility f = new Facility();
                f.facilityName = txtName.Text;
                f.facilityType = listFacility.SelectedItem.Text;
                f.generalInfo = txtInfo.Text;
                f.phoneNumber = Int32.Parse(txtPhoneNumber.Text);
                f.openingHrs = txtOpeninghr.SelectedItem.Text + ":"+"00";
                f.closingHrs = txtClosinghr.SelectedItem.Text + ":" + "00";
                f.address = txtAddress.Text;
                f.region = txtRegion.Text;
                f.x = Decimal.Parse(lblSelectedX.Text);
                f.y = Decimal.Parse(lblSelectedY.Text);


                if (ImageUpload.HasFile)
                {
                    f.image = Path.GetFileName(ImageUpload.PostedFile.FileName);
                    ImageUpload.PostedFile.SaveAs(Server.MapPath("~/upload/facility/") + f.image);
                }
                
                if (!FacilityManagementSystem.CheckFacilityName(f.facilityName))
                {

                    FacilityManagementSystem.CreateFacility(f);


                    /////////////////////////To add data department table///////////////////////////
                    int facility_id = FacilityManagementSystem.GetFacilityId(f.facilityName); //only after facility is created will there be facility id

                    Department[] dp = new Department[12];
                    int index = 0;
                    foreach (ListItem listItem in CreateDepartmentList.Items)
                    {
                        if (listItem.Selected)
                        {
                            dp[index] = new Department();
                            dp[index].facilityId = facility_id;
                            dp[index].departmentName = listItem.Value;

                            index++;
                        }
                    }

                    DepartmentManagementSystem.AddDepartment(dp);


                    txtName.Text = txtInfo.Text = txtPhoneNumber.Text = txtOpeninghr.Text = txtClosinghr.Text = txtAddress.Text = txtRegion.Text = "";
                    lblName.Text = lblInfo.Text = lblPhoneNumber.Text = lblOpening.Text = lblClosing.Text = lblAddress.Text = lblRegion.Text = "";

                    foreach (ListItem listItem in CreateDepartmentList.Items)
                    {
                        if (listItem.Selected)
                        {
                            listItem.Selected = false;
                        }
                    }

                    Response.Write("<script type=\"text/javascript\">alert('Facility Created!');location.href='AdminHomePage.aspx'</script>");

                    //Response.Redirect("AdminHomePage.aspx", false);
                }
                else
                    lblImage.Text = "This hospital already exist in the database";


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
            List<SearchResults> results = FacilityManagementSystem.getAPIData(txtName.Text);
            DataTable dt = new DataTable();
            dt.Columns.Add("Building");
            dt.Columns.Add("Address");
            dt.Columns.Add("Postal");
            dt.Columns.Add("x");
            dt.Columns.Add("y");

            if (results != null)
            {
                for (int i = 0; i < results.Count; i++)
                {
                    dt.Rows.Add();
                    dt.Rows[i]["Building"] = results.ElementAt(i).building;
                    dt.Rows[i]["Address"] = results.ElementAt(i).address;
                    dt.Rows[i]["Postal"] = results.ElementAt(i).postal;
                    dt.Rows[i]["x"] = results.ElementAt(i).x;
                    dt.Rows[i]["y"] = results.ElementAt(i).y;
                }
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
            System.Web.UI.WebControls.Label lblX = grdFacilities.Rows[i].FindControl("lblX") as System.Web.UI.WebControls.Label;
            System.Web.UI.WebControls.Label lblY = grdFacilities.Rows[i].FindControl("lblY") as System.Web.UI.WebControls.Label;

            txtAddress.Text = lblAddress.Text;
            txtName.Text = lblBuilding.Text;
            lblSelectedX.Text = lblX.Text;
            lblSelectedY.Text = lblY.Text;

            confirmPopup.Hide();



            IEnumerator ie = CreateDepartmentList.Items.GetEnumerator();
            while (ie.MoveNext())
            {
                ListItem li = (ListItem)ie.Current;
                li.Selected = true;
            }
        }

        protected void grdFacilities_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdFacilities.PageIndex = e.NewPageIndex;
            bindData();
        }
    }
}