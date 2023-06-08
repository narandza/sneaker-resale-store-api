using SneakerResaleStore.Application;
using System.Collections.Generic;

namespace SneakerResaleStore.API.Jwt
{
    public class UnauthorizedActor : IApplicationActor
    {
        public int Id => 0;

        public string Email => "";

        public IEnumerable<int> AllowedUseCases => new List<int>{};
    }
}
