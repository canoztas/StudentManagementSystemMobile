using StudentManagementSystemAPI.Models.DTO;

namespace StudentManagementSystemAPI.Repository.IRepository
{
    public interface IAuthRepository
    {
        Task<LoginResponseDTO> Login(LoginRequestDTO loginRequestDTO);
    }
}
