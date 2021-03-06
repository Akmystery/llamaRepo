﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeamLLama.Controller;
using TeamLLama.Entity;


namespace TeamLLama
{
    public partial class AdminDeleteAccPage : System.Web.UI.Page
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
            if (!Page.IsPostBack)
            {
                bindAppointments();
            }
        }

        private void bindAppointments()
        {
            grdAllDocAcc.DataSource = AccountManagementSystem.getAllDoctorAcc();
            grdAllDocAcc.DataBind();

        }

        protected void grdAllDocAcc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdAllDocAcc.PageIndex = e.NewPageIndex;
            bindAppointments();
        }
        /*
        protected void lbn_view_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            GridViewRow row = (GridViewRow)button.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            System.Web.UI.WebControls.Label lblAccountID = grdAllDocAcc.Rows[i].FindControl("lblAccountID") as System.Web.UI.WebControls.Label;
            string accountID = lblAccountID.Text;

            AccountManagementSystem ams = new AccountManagementSystem();

            DoctorAccount ap = ams.getDoctorAcc(accountID);
            if (ap != null)
            {
                lbl_id.Text = ap.accountID.ToString();
                lbl_photoDetail.Text = ap.photo;
                lbl_NameDetail.Text = ap.name;
                lbl_NRICDetail.Text = ap.nric;
                lbl_FacilityDetail.Text = ap.facility;
                lbl_DepartmentDetail.Text = ap.department;
            }

            btnDelete.Visible = true;
            mp2.Show();
        }
        */


        protected void btnUpdate_click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            GridViewRow row = (GridViewRow)button.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            System.Web.UI.WebControls.Label lblAccountID = grdAllDocAcc.Rows[i].FindControl("lblAccountID") as System.Web.UI.WebControls.Label;
            String id = lblAccountID.Text;
            Session["doc_id"] = id;
            Response.Redirect("AdminUpdateAccPage.aspx");
        }

        protected void btnDelete_click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            GridViewRow row = (GridViewRow)button.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            System.Web.UI.WebControls.Label lblAccountID = grdAllDocAcc.Rows[i].FindControl("lblAccountID") as System.Web.UI.WebControls.Label;
            //int accountID = Convert.ToInt32(lblAccountID.Text);
            lbl_id.Text = lblAccountID.Text;
            deletePopup.Show();
        }


        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            int accountID = Convert.ToInt32(lbl_id.Text);
            AccountManagementSystem.DeleteAccount(accountID);
            Response.Write("<script type=\"text/javascript\">alert('Account Deleted!');location.href='AdminDeleteAccPage.aspx'</script>");
        }
    }
}