using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamLLama.Entity
{
    public class FacilityStaff
    {
        public int accountID { get; set; }
        public int departmentID { get; set; }
        public Account account { get; set; }
        public Department department { get; set; }
    }
}