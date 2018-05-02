﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Operations
{
    public class BookingDbl
    {
        public IEnumerable<Book> GetAllBooking()
        {
            List<Book> lstBook = new List<Book>();
            using (SqlConnection con = new SqlConnection(Connection.connectionString))
            {
                SqlCommand cmd = new SqlCommand("Booking_GetAll", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Book book = new Book();
                    Users user = new Users();
                    user.UserID = Convert.ToInt32(rdr["UserID"]);
                    user.FirstName = rdr["FirStName"].ToString();
                    user.LastName = rdr["LaStName"].ToString();
                    user.Email = rdr["Email"].ToString();
                    book.BookID = Convert.ToInt32(rdr["BookID"]);
                    book.BookedBy = Convert.ToInt32(rdr["BookedBy"]);
                    book.BookedFor = Convert.ToDateTime(rdr["BookedFor"]);
                    book.BookedOn = Convert.ToDateTime(rdr["BookedOn"]);
                    //book.CanceledOn = Convert.ToDateTime(rdr["CanceledOn"]);
                    book.StaffID = Convert.ToInt32(rdr["StaffID"]);
                    book.Users = user;
                    lstBook.Add(book);
                }
                con.Close();
            }
            return lstBook;
        }
        public Book GetBookingByID(int? id)
        {
            Book book = new Book();
            Users user = new Users();
            using (SqlConnection con = new SqlConnection(Connection.connectionString))
            {
                SqlCommand cmd = new SqlCommand("Booking_GetAllByStaffID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StaffID", id);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    user.UserID = Convert.ToInt32(rdr["UserID"]);
                    user.FirstName = rdr["FirStName"].ToString();
                    user.LastName = rdr["LaStName"].ToString();
                    user.Email = rdr["Email"].ToString();
                    book.BookID = Convert.ToInt32(rdr["BookID"]);
                    book.BookedBy = Convert.ToInt32(rdr["BookedBy"]);
                    book.BookedFor = Convert.ToDateTime(rdr["BookedFor"]);
                    book.BookedOn = Convert.ToDateTime(rdr["BookedOn"]);
                    //book.CanceledOn = Convert.ToDateTime(rdr["CanceledOn"]);
                    book.StaffID = Convert.ToInt32(rdr["StaffID"]);
                    book.Users = user;
                }
                con.Close();
                return book;
            }
        }
        public int AddUpdateBooking(Book book)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.connectionString))
                {
                    SqlCommand cmd = new SqlCommand("Booking_AddUpdate", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@BookID", book.BookID);
                    cmd.Parameters.AddWithValue("@BookedFor", book.BookedFor);
                    cmd.Parameters.AddWithValue("@BookedBy", book.BookedBy);
                    cmd.Parameters.AddWithValue("@StaffID", book.StaffID);

                    SqlParameter outPutParameter = new SqlParameter();
                    outPutParameter.ParameterName = "@status";
                    outPutParameter.SqlDbType = SqlDbType.Int;
                    outPutParameter.Direction = ParameterDirection.Output;
                    cmd.Parameters.Add(outPutParameter);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return int.Parse(outPutParameter.Value.ToString());
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public int BookingCancel(int? bookID)
        {
            using (SqlConnection con = new SqlConnection(Connection.connectionString))
            {
                SqlCommand cmd = new SqlCommand("Booking_Cancel", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@BookID", bookID);
                con.Open();
                int affactedRow = cmd.ExecuteNonQuery();
                con.Close();
                return affactedRow;
            }
        }
       
    }
}
