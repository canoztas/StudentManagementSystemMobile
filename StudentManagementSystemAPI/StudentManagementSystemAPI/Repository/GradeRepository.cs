using Microsoft.EntityFrameworkCore;
using StudentManagementSystemAPI.Data;
using StudentManagementSystemAPI.Models;
using StudentManagementSystemAPI.Models.DTO;
using StudentManagementSystemAPI.Repository.IRepository;
using System;
using System.Diagnostics;
using System.Linq;
using static Azure.Core.HttpHeader;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace StudentManagementSystemAPI.Repository
{
    public class GradeRepository : IGradeRepository
    {
        private readonly ApplicationDbContext _context;

        public GradeRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<GradeResponseDTO> GetAsync(int id)
        {

            Grade grade = new Grade();
            grade = await _context.Grades.FindAsync(id);
            List<User> query = _context.Users.ToList();
            GradeResponseDTO gradeResponseDTO = new GradeResponseDTO()
            {
                Grade = grade,
                Lecturer = query.SingleOrDefault(g => g.UserId == grade.LecturerId),
                Student = query.SingleOrDefault(g => g.UserId == grade.StudentId)
            };
            gradeResponseDTO.Student.PasswordHash = null;
            gradeResponseDTO.Lecturer.PasswordHash = null;
            return gradeResponseDTO;

        }

        public List<GradeResponseDTO> GradeListToDTO(List<Grade> grades)
        {
            List<User> query = _context.Users.ToList();
            List<GradeResponseDTO> gradeList = new List <GradeResponseDTO>();
            foreach (var grade in grades) {
                GradeResponseDTO gradeResponseDTO = new GradeResponseDTO()
                {
                    Grade = grade,
                    Lecturer = query.SingleOrDefault(g => g.UserId == grade.LecturerId),
                    Student = query.SingleOrDefault(g => g.UserId == grade.StudentId)
                };
                gradeResponseDTO.Student.PasswordHash = null;
                gradeResponseDTO.Lecturer.PasswordHash = null;
                gradeList.Add(gradeResponseDTO);
            }
            return gradeList;

        }

        public List<GradeResponseDTO> GetByStudentId(int id)
        {
            List<Grade> query = _context.Grades.ToList();

            List<Grade> grades = query.Where(g => g.StudentId == id).ToList();

            List<GradeResponseDTO> gradeList = new List<GradeResponseDTO>();

            gradeList = GradeListToDTO(grades);

            return (gradeList);
        }

        public List<GradeResponseDTO> GetByLecturerId(int id)
        {
            List<Grade> query = _context.Grades.ToList();

            List<Grade> grades = query.Where(g => g.LecturerId == id).ToList();

            List<GradeResponseDTO> gradeList = new List<GradeResponseDTO>();

            gradeList = GradeListToDTO(grades);

            return (gradeList);
        }


        public async Task CreateAsync(Grade grade)
        {
            await _context.Grades.AddAsync(grade);
        }

        public async Task UpdateAsync(Grade grade)
        {
            _context.Grades.Update(grade);
        }

        public async Task RemoveAsync(Grade grade)
        {
            _context.Grades.Remove(grade);
        }

        public async Task SaveAsync()
        {
            await _context.SaveChangesAsync();
        }
    }

}
