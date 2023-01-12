using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using StudentManagementSystemAPI.Repository.IRepository;
using StudentManagementSystemAPI.Models;
using System.Diagnostics;

namespace StudentManagementSystemAPI.Controllers
{
    [Route("api/[controller]")]
    public class GradeController : Controller
    {
        private readonly IGradeRepository _gradeRepository;

        public GradeController(IGradeRepository gradeRepository)
        {
            _gradeRepository = gradeRepository;
        }

        [HttpGet]
        public async Task<ActionResult<Grade>> Get(int? gradeId, int? lecturerId, int? studentId)
        {
            if (gradeId != null)
            {
                var grade = await _gradeRepository.GetAsync(gradeId.Value);
                return Ok(grade);
            }
            if (studentId != null)
            {
                var grade = _gradeRepository.GetByStudentId(studentId.Value);
                return Ok(grade);
            }
            if (lecturerId != null)
            {
                var grade =  _gradeRepository.GetByLecturerId(lecturerId.Value);
                return Ok(grade);
            }
            return BadRequest();
        }


        [HttpPost]
        public async Task<ActionResult> Create(Grade grade)
        {
            await _gradeRepository.CreateAsync(grade);
            return Ok();
        }

        [HttpPut]
        public async Task<ActionResult> Update(Grade grade)
        {
            await _gradeRepository.UpdateAsync(grade);
            return Ok();
        }

        [HttpDelete]
        public async Task<ActionResult> Delete(Grade grade)
        {
            await _gradeRepository.RemoveAsync(grade);
            return Ok();
        }
    }

}
