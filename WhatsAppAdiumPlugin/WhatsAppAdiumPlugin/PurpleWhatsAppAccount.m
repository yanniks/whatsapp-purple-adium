#import "PurpleWhatsAppAccount.h"

@implementation PurpleWhatsAppAccount
- (const char*)protocolPlugin
{
	return "prpl-whatsapp";
}

- (NSString *)host
{
    return @"c3.whatsapp.net";
}

- (int)port
{
    return 443;
}
@end
