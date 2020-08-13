//
//  DPLDeepLinkRouter+LBHandleSelector.h
//  DeepLinkKit
//
//  Created by yao wang on 2020/8/12.
//

#import "DPLDeepLinkRouter.h"

NS_ASSUME_NONNULL_BEGIN

@interface DPLDeepLinkRouter (LBHandleSelector)

- (BOOL)handleSelWithURLString:(NSString *)url
                      selector:(NSString *)selector
                        params:(id)params
                      complete:(void(^)(BOOL handled, NSError *error))completionHandler;
@end

NS_ASSUME_NONNULL_END
