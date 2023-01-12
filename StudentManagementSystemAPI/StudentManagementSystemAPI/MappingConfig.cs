using AutoMapper;
using StudentManagementSystemAPI.Models.DTO;
using StudentManagementSystemAPI.Models;

namespace StudentManagementSystemAPI
{
    public class MappingConfig : Profile
    {
        public MappingConfig() 
        {
           CreateMap<User, LoginRequestDTO>().ReverseMap();
           CreateMap<User, LoginResponseDTO>().ReverseMap();
        }
        
    }
}
