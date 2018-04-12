using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamLLama.Entity
{
    public class Account
    {
        public int accountID { get; set; }
        public string accountType { get; set; }
        public string name { get; set; }
        public string nric { get; set; }
        public string password { get; set; }
        public string email { get; set; }
        public string address { get; set; }
        public string photo { get; set; }
        public List<Review> reviews { get; set; }
        public List<Appointment> appointments { get; set; }
        public List<DoctorAppointment> doctorAppointments { get; set; }
        public FacilityStaff facilityStaff { get; set; }

    }
}