﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace DataAccessLayer.Operations
{
    public class SearchPilot
    {
        public IEnumerable<Staff> Index(int? offSet, DateTime date)
        {
            List<Staff> lstPilot = new List<Staff>();

            using (SqlConnection con = new SqlConnection(Connection.connectionString))
            {
                SqlCommand cmd = new SqlCommand("SearchPilot", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@dateTime", date);
                cmd.Parameters.AddWithValue("@offSet", offSet);

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Staff staff = new Staff();

                    staff.StaffID = Convert.ToInt32(rdr["StaffID"]);
                    staff.FirstName = rdr["FirstName"].ToString();
                    staff.LastName = rdr["LastName"].ToString();
                    staff.Address = rdr["Address"].ToString();
                    staff.Phone = rdr["Phone"].ToString();
                    staff.Email = rdr["Email"].ToString();
                    staff.Designation = rdr["Designation"].ToString();
                    staff.HireDate = Convert.ToDateTime(rdr["HireDate"]);

                    lstPilot.Add(staff);
                }
                con.Close();
            }
            return lstPilot;
        }
    }
}