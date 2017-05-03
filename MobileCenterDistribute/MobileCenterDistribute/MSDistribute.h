#import "MSDistributeDelegate.h"
#import "MSServiceAbstract.h"

/**
 * Mobile Center Distribute service.
 */
@interface MSDistribute : MSServiceAbstract

/**
 * Set a Distribute delegate
 *
 * @param delegate A Distribute delegate.
 *
 * @discussion If Distribute delegate is set and releaseAvailableWithDetails is returning <code>YES</code>, you must
 * call notifyUpdateAction: with one of update actions to handle a release properly.
 *
 * @see releaseAvailableWithDetails:
 * @see notifyUpdateAction:
 */
+ (void)setDelegate:(id<MSDistributeDelegate>)delegate;

/**
 * Notify SDK with an update action to handle the release.
 */
+ (void)notifyUpdateAction:(MSUpdateAction)action;

/**
 * Change The URL that will be used for generic update related tasks.
 *
 * @param apiUrl The new URL.
 */
+ (void)setApiUrl:(NSString *)apiUrl;

/**
 * Change the base URL that is used to install update.
 *
 * @param installUrl The new URL.
 */
+ (void)setInstallUrl:(NSString *)installUrl;

/**
 * Process URL request for the service.
 *
 * @param url  The url with parameters.
 *
 * @return `YES` if the URL was handled by Mobile Center Distribute, `NO` otherwise.
 *
 * @discussion Place this method call into your app delegate's openUrl method.
 */
+ (BOOL)openUrl:(NSURL *)url;

@end
