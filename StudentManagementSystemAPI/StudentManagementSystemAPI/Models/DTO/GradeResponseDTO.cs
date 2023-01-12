namespace StudentManagementSystemAPI.Models.DTO
{
    public class GradeResponseDTO
    {
        public Grade Grade { get; set; }  

        public User Lecturer { get; set; }

        public User Student { get; set; }
    }
}
