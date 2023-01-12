using Microsoft.AspNetCore.Mvc;
using StudentManagementSystemAPI.Models;
using StudentManagementSystemAPI.Models.DTO;
using StudentManagementSystemAPI.Repository.IRepository;
using System.Net;
using AutoMapper;
using FluentValidation;
using Azure;
using Microsoft.AspNetCore.Cors;

namespace StudentManagementSystemAPI.Controllers
{
    [Route("api/login")]
    public class AuthController : Controller
    {
        private readonly IAuthRepository _authRepository;

        public AuthController(IAuthRepository authRepository)
        {
            _authRepository = authRepository;
        }

        [HttpPost]
        [HttpOptions]
        [DisableCors]
        public async Task<ActionResult> Login([FromBody] LoginRequestDTO model)
        {
            var loginResponse = await _authRepository.Login(model);
            if (loginResponse == null)
            {
                return BadRequest();
            }
            return Ok(loginResponse);
        }


    }
}
