using Microsoft.EntityFrameworkCore;
using StudentManagementSystemAPI.Data;
using StudentManagementSystemAPI.Models;
using StudentManagementSystemAPI.Repository.IRepository;

namespace StudentManagementSystemAPI.Repository
{
    public class UserRepository : IUserRepository
    {
        private readonly ApplicationDbContext _context;

        public UserRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<User> GetAsync(int id)
        {
            return await _context.Users.FindAsync(id);
        }

        public async Task CreateAsync(User user)
        {
            await _context.Users.AddAsync(user);
        }

        public async Task UpdateAsync(User user)
        {
            _context.Users.Update(user);
        }

        public async Task RemoveAsync(User user)
        {
             _context.Users.Remove(user);
        }

        public async Task SaveAsync()
        {
            await _context.SaveChangesAsync();
        }
    }


}
