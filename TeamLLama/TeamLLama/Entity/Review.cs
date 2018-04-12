using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamLLama.Entity
{
    public class Review
    {
        public int reviewId { get; set; }
        public int rating { get; set; }
        public string comment { get; set; }
        public int accountId { get; set; }
        public int facilityId { get; set; }
        public Facility facility { get; set; }
        public Account account { get; set; }
    }
}