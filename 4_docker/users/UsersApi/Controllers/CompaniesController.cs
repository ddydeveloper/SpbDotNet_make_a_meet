﻿using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using UsersApi.Dtos;
using UsersApi.Services;

namespace UsersApi.Controllers
{
    [Route("users-api/[controller]")]
    [ApiController]
    public class CompaniesController : ControllerBase
    {
        private readonly IUsersService _usersService;

        public CompaniesController(IUsersService usersService)
        {
            _usersService = usersService;
        }
        
        [HttpGet("{id}")]
        public async Task<ActionResult<Company>> Get(int id)
        {
            return Ok(await _usersService.GetCompanyAsync(id));
        }

        [HttpGet("{id}/users")]
        public async Task<ActionResult<IEnumerable<User>>> GetUsers(int id)
        {
            return Ok(await _usersService.GetCompanyUsersAsync(id));
        }
    }
}
