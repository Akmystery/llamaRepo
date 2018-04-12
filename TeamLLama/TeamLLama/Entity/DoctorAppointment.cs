using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamLLama.Entity
{
    public class DoctorAppointment
    {
        public int accountId { get; set; }
        public int appointmentId { get; set; }
        public Account account { get; set; }
        public Appointment appointment { get; set; }
    }
}