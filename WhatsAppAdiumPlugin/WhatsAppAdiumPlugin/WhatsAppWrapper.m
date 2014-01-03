#import "WhatsAppWrapper.h"
#import "WhatsAppService.h"

extern void purple_init_whatsapp_plugin();

@implementation WhatsAppWrapper
- (void)installPlugin
{
    purple_init_whatsapp_plugin();
    [WhatsAppService registerService];
}
- (void) installLibpurplePlugin
{
}
- (void) loadLibpurplePlugin
{
}
- (void)uninstallPlugin
{
}
- (NSString *)pluginAuthor
{
	return @"ThYpHoOn <thyphoon@5on5.org>, WhatsApp libpurple plugin by David G. F. http://davidgf.net";
}

-(NSString *)pluginVersion
{
	return @"1.0";
}

-(NSString *)pluginDescription
{
	return @"WhatsApp";
}
@end