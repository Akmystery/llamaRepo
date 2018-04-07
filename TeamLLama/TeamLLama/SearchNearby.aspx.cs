using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeamLLama.Controller;
using TeamLLama.Entity;

namespace TeamLLama
{
    public partial class SearchNearby : System.Web.UI.Page
    {
        protected Tuple <double, double> location;
        protected Tuple<double, double> lowerbound;
        protected Tuple<double, double> upperbound;
        protected List<Tuple<double, double>> location_list;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Request.QueryString["q"]))
            {
                return;
            }
            FacilityManagementSystem app = new FacilityManagementSystem();
            List<SearchResults> locations = app.getAPIData(Uri.EscapeDataString(Request.QueryString["q"]));

            if (locations == null || locations.Count == 0)
            {
                return;
            }

            SearchResults location = locations[0];
            List<Facility> facilities = app.SearchNearby(Decimal.Parse(location.x), Decimal.Parse(location.y));
            location_list = facilities.Select(f => Svy21.ComputeLatitudeLongitude((double)f.x, (double)f.y)).ToList();
            this.location = Svy21.ComputeLatitudeLongitude(Double.Parse(location.x), Double.Parse(location.y));
            var points = location_list.Concat(new[] { this.location });
            this.upperbound = Tuple.Create(points.Select(p => p.Item1).Max(), points.Select(p => p.Item2).Max());
            this.lowerbound = Tuple.Create(points.Select(p => p.Item1).Min(), points.Select(p => p.Item2).Min());
            grdFacility.DataSource = facilities;
            grdFacility.DataBind();
        }
    }

}