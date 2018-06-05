#import "MSHttpSender.h"

extern NSString *const kMSOneCollectorApiVersion;
extern NSString *const kMSOneCollectorApiPath;
extern NSString *const kMSOneCollectorContentType;
extern NSString *const kMSOneCollectorApiKey;
extern NSString *const kMSOneCollectorClientVersionKey;

// Assign value to avoid "format is not a string literal" warning.
static NSString *const kMSOneCollectorClientVersionFormat = @"ACS-iOS-ObjectiveC-no-%@-no";
extern NSString *const kMSOneCollectorUploadTimeKey;

@interface MSOneCollectorIngestion : MSHttpSender

/**
 * Initialize the Sender.
 *
 * @param baseUrl Base url.
 *
 * @return A sender instance.
 */
- (id)initWithBaseUrl:(NSString *)baseUrl;

@end
