using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamLLama.Entity
{
    public class Appointment
    {
        public int appointmentID { get; set; }
        public int accountID { get; set; }
        public int facilityID { get; set; }
        public string facilityName { get; set; }
        public int departmentID { get; set; }
        public string departmentName { get; set; }
        public string time { get; set; }
        public string date { get; set; }
        public bool taken { get; set; }
        public string comments { get; set; }
    }
}