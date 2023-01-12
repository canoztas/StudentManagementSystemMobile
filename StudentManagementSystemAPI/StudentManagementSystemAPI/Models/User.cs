namespace StudentManagementSystemAPI.Models
{
    public class User
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string PasswordHash { get; set; }
        public string PhotoPath { get; set; }
        public string UserType { get; set; }
    }
}
