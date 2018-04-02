using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamLLama.Entity
{
    public class Facility
    {
        public int facilityID { get; set; }
        public string facilityType { get; set; }
        public string facilityName { get; set; }
        public string generalInfo { get; set; }
        public int phoneNumber { get; set; }
        public string openingHrs { get; set; }
        public string closingHrs { get; set; }
        public string address { get; set; }
        public string region { get; set; }
        public string image { get; set; }
        public string x { get; set; }
        public string y { get; set; }
    }
}