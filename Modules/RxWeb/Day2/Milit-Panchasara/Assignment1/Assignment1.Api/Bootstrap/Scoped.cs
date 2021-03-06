#region Namespace
using Assignment1.BoundedContext.Main;
using Assignment1.Infrastructure.Security;
using Assignment1.UnitOfWork.DbEntityAudit;
using Assignment1.UnitOfWork.Main;
using Microsoft.Extensions.DependencyInjection;
using RxWeb.Core;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data;
using RxWeb.Core.Security;

#endregion Namespace



namespace Assignment1.Api.Bootstrap
{
    public static class ScopedExtension
    {

        public static void AddScopedService(this IServiceCollection serviceCollection)
        {
            serviceCollection.AddScoped<IRepositoryProvider, RepositoryProvider>();
            serviceCollection.AddScoped<ITokenAuthorizer, TokenAuthorizer>();
            serviceCollection.AddScoped<IModelValidation, ModelValidation>();
            serviceCollection.AddScoped<IAuditLog, AuditLog>();
            serviceCollection.AddScoped<IApplicationTokenProvider, ApplicationTokenProvider>();
            serviceCollection.AddScoped(typeof(IDbContextManager<>), typeof(DbContextManager<>));

            #region ContextService

            serviceCollection.AddScoped<ILoginContext, LoginContext>();
            serviceCollection.AddScoped<ILoginUow, LoginUow>();
                        serviceCollection.AddScoped<IUberContext, UberContext>();
            serviceCollection.AddScoped<IUberUow, UberUow>();
            #endregion ContextService




            #region DomainService

            #endregion DomainService
        }
    }
}




