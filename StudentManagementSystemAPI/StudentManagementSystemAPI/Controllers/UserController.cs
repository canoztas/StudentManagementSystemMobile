using Microsoft.AspNetCore.Mvc;
using StudentManagementSystemAPI.Models;
using StudentManagementSystemAPI.Repository.IRepository;

namespace StudentManagementSystemAPI.Controllers
{
 [Route("api/[controller]")]
    public class UserController : Controller
    {
        private readonly IUserRepository _userRepository;

        public UserController(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<User>> Get(int id)
        {
            var user = await _userRepository.GetAsync(id);
            return Ok(user);
        }

        [HttpPost]
        public async Task<ActionResult> Create(User user)
        {
            await _userRepository.CreateAsync(user);
            return Ok();
        }

        [HttpPut]
        public async Task<ActionResult> Update(User user)
        {
            await _userRepository.UpdateAsync(user);
            return Ok();
        }

        [HttpDelete]
        public async Task<ActionResult> Delete(User user)
        {
            await _userRepository.RemoveAsync(user);
            return Ok();
        }
    }
}