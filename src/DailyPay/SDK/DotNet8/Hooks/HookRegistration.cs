namespace DailyPay.SDK.DotNet8.Hooks
{
    public static class HookRegistration
    {
        public static void InitHooks(IHooks hooks)
        {
            hooks.RegisterBeforeRequestHook(new PatchAcceptHeaderHook());
        }
    }
}