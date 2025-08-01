using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace DailyPay.SDK.DotNet8.Hooks
{
    class PatchAcceptHeaderHook : IBeforeRequestHook
    {
        /// <summary>
        /// Operations that should not have the Accept header patched.
        /// </summary>
        private HashSet<string> omittedOperations = new HashSet<string>
        {
            "requestToken",
            "createGenericCardToken",
            "getHealth",
        };

        public Task<HttpRequestMessage> BeforeRequestAsync(
            BeforeRequestContext hookCtx,
            HttpRequestMessage request
        )
        {
            if (omittedOperations.Contains(hookCtx.OperationID))
            {
                return Task.FromResult(request);
            }

            request.Headers.Accept.Clear();
            request.Headers.Accept.ParseAdd("application/vnd.api+json");
            return Task.FromResult(request);
        }
    }
}