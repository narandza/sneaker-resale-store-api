using SneakerResaleStore.Application.UseCases.DTO;
using SneakerResaleStore.Application.UseCases.Queries;
using SneakerResaleStore.Application.UseCases.Queries.Searches;
using SneakerResaleStore.DataAccess;
using SneakerResaleStore.Domain.Entities;
using SneakerResaleStore.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SneakerResaleStore.Implementation.UseCases.Queries.UserQueries
{
    public class EfSearchUsersQuery : EfUseCase, ISearchUsersQuery
    {
        public EfSearchUsersQuery(SneakerResaleStoreContext context) : base(context)
        {
        }

        public int Id => 41;

        public string Name => "Search users";

        public string Description => "";

        public PagedResponse<UserDTO> Execute(UserSearch search)
        {
            IQueryable<User> query = Context.Users;

            return query.ToPagedResponse(search, x => new UserDTO
            {
                Id = x.Id,
                Email = x.Email,
                FirstName = x.FirstName,
                LastName = x.LastName,
                Address = new AddressDTO
                {
                    StreetAddress = x.Address.StreetAddress,
                    City = x.Address.City,
                    PostalCode = x.Address.PostalCode
                },
                RoleId = x.RoleId,
                RoleName = x.Role.Name
            });
        }
    }
}
