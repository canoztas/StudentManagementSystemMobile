using StudentManagementSystemAPI.Models;

namespace StudentManagementSystemAPI.Repository.IRepository
{
    public interface IUserRepository
    {
        Task<User> GetAsync(int id);
        Task CreateAsync(User user); 
        Task UpdateAsync(User user);
        Task RemoveAsync(User user);
        Task SaveAsync();
    }
}
