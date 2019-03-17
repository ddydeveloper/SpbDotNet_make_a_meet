using System.Collections.Generic;
using System.Threading.Tasks;
using UsersApi.Dtos;

namespace UsersApi.Services
{
    public interface IUsersService
    {
        Task<User> GetUserAsync(int id);

        Task<IEnumerable<User>> GetCompanyUsersAsync(int companyId);

        Task<Company> GetCompanyAsync(int companyId);
    }
}
