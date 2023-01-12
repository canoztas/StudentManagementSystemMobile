namespace StudentManagementSystemAPI.Models.DTO
{
    public class LoginResponseDTO
    {
        public User User { get; set; }  

        public string Token { get; set; }
    }
}
