using Microsoft.EntityFrameworkCore;
using StudentManagementSystemAPI.Models;
using StudentManagementSystemAPI.Models.DTO;

namespace StudentManagementSystemAPI.Repository.IRepository
{
    public interface IGradeRepository
    {
        Task<GradeResponseDTO> GetAsync(int id);
        Task CreateAsync(Grade grade);
        Task UpdateAsync(Grade grade);
        Task RemoveAsync(Grade grade);
        List<GradeResponseDTO> GetByStudentId(int id);
        List<GradeResponseDTO> GetByLecturerId(int id);
        Task SaveAsync();
    }
}
