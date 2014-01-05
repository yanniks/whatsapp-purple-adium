#import "WhatsAppService.h"
#import "PurpleWhatsAppAccount.h"

#import <Adium/AISharedAdium.h>
#import <Adium/AIStatusControllerProtocol.h>
#import <AIUtilities/AIStringUtilities.h>
#import <AIUtilities/AIImageAdditions.h>

@implementation WhatsAppService
- (Class)accountClass {
	return [PurpleWhatsAppAccount class];
}

//Service Description
- (NSString *)serviceCodeUniqueID {
	return @"libpurple-whatsapp";
}
- (NSString *)serviceID{
	return @"WhatsApp";
}
- (NSString *)serviceClass {
	return @"WhatsApp";
}
- (NSString *)shortDescription {
	return @"WhatsApp";
}
- (NSString *)longDescription {
	return @"WhatsApp IM";
}

- (NSCharacterSet *)allowedCharacters {
  NSMutableCharacterSet *allowed = [NSMutableCharacterSet alphanumericCharacterSet];
  [allowed formUnionWithCharacterSet:[NSCharacterSet  punctuationCharacterSet]];
  return allowed;
}

- (NSUInteger)allowedLength {
	return 64;
}

- (BOOL)caseSensitive {
	return NO;
}

- (BOOL)requiresPassword {
    return YES;
}

- (BOOL)supportsProxySettings {
    return NO;
}

- (AIServiceImportance)serviceImportance {
	return AIServicePrimary;
}

- (NSString *)userNameLabel {
    return AILocalizedString(@"Phone Number", nil); // Sign-in name
}

- (NSString *)UIDPlaceholder
{
    return @"e.g. 49150123456";
}


- (NSURL *)serviceAccountSetupURL {
    return [NSURL URLWithString:@"https://github.com/tgalal/yowsup/wiki/yowsup-cli#wiki-registration"];
}

- (void)registerStatuses {
  #define ADDSTATUS(name, type) \
    [adium.statusController registerStatus:name \
    withDescription:[adium.statusController localizedDescriptionForCoreStatusName:name] \
    ofType:type forService:self]

  ADDSTATUS(STATUS_NAME_AVAILABLE, AIAvailableStatusType);
  ADDSTATUS(STATUS_NAME_BUSY, AIAvailableStatusType);
  ADDSTATUS(STATUS_NAME_AWAY, AIAwayStatusType);
  ADDSTATUS(STATUS_NAME_EXTENDED_AWAY, AIAwayStatusType);
  ADDSTATUS(STATUS_NAME_OFFLINE, AIOfflineStatusType);
}

- (NSImage *)defaultServiceIconOfType:(AIServiceIconType)iconType
{
  if ((iconType == AIServiceIconSmall) || (iconType == AIServiceIconList)) {
    return [NSImage imageNamed:@"whatsapp16" forClass:[self class] loadLazily:YES];
  } else {
    return [NSImage imageNamed:@"whatsapp" forClass:[self class] loadLazily:YES];
  }
}

- (NSString *)pathForDefaultServiceIconOfType:(AIServiceIconType)iconType
{
  if ((iconType == AIServiceIconSmall) || (iconType == AIServiceIconList)) {
		return [[NSBundle bundleForClass:[self class]] pathForImageResource:@"whatsapp16"];
	}
	return [[NSBundle bundleForClass:[self class]] pathForImageResource:@"whatsapp"];
}


@end