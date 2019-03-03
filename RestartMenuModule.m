#import "RestartMenuModule.h"

@implementation RestartMenuModule

- (instancetype)init {
    if ((self = [super init])) {
        _contentViewController = [[RestartMenuModuleViewController alloc]init];
    }
    return self;
}

@end
