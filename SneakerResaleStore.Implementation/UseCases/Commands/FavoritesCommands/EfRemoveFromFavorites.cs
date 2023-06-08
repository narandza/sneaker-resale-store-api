using SneakerResaleStore.Application.Exceptions;
using SneakerResaleStore.Application.UseCases.Commands;
using SneakerResaleStore.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SneakerResaleStore.Implementation.UseCases.Commands.FavoritesCommands
{
    public class EfRemoveFromFavorites : EfUseCase, IRemoveFromFavorites
    {
        public EfRemoveFromFavorites(SneakerResaleStoreContext context) : base(context)
        {
        }

        public int Id => 65;

        public string Name => "Remove from Favorites";

        public string Description => "";

        public void Execute(int request)
        {
            var favourite = Context.Favorites.Find(request);

            if (favourite == null || !favourite.IsActive || favourite.DeletedAt.HasValue)
            {
                throw new EntityNotFoundException(request, nameof(favourite));
            }

            favourite.DeletedAt = DateTime.UtcNow;
            favourite.IsActive = false;
            Context.SaveChanges();
        }
    }
}
