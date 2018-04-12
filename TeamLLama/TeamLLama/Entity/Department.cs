using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamLLama.Entity
{
    public class Department
    {
        public int departmentID { get; set; }
        public string departmentName { get; set; }
        public int facilityId { get; set; }
        public Facility facility { get; set; }
        public List<FacilityStaff> facilityStaffs { get; set; }
        public List<Appointment> appointments { get; set; }
    }
}