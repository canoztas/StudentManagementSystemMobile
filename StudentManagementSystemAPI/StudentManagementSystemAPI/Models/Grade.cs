namespace StudentManagementSystemAPI.Models
{
    public class Grade
    {
        public int GradeId { get; set; }
        public string LessonName { get; set; }
        public int LecturerId { get; set; }
        public int StudentId { get; set; }
        public int Score { get; set; }
        public string LessonDate { get; set; }
    }
}
