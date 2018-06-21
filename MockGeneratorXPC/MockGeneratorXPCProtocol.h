#import <Foundation/Foundation.h>

@protocol MockGeneratorXPCProtocol

- (void)generateMockFromFileContents:(nonnull NSString *)contents projectURL:(nonnull NSURL *)projectURL line:(NSInteger)line column:(NSInteger)column templateName:(nonnull NSString *)templateName withReply:(nonnull void (^)(NSArray<NSString *> *_Nullable, NSError *_Nullable))reply;

#ifdef DEBUG
- (void)crash;
#endif

@end
