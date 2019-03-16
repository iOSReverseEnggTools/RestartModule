#import "RestartMenuModuleViewController.h"
#import <spawn.h>

@implementation RestartMenuModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setGlyphImage:[UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[RestartMenuModuleViewController class]] compatibleWithTraitCollection:nil]];
    
    [self setTitle:@"Restart"];
    
    [self addActionWithTitle:@"Respring" glyph:nil handler:^{
        [self respring];
    }];
    
    [self addActionWithTitle:@"Reboot" glyph:nil handler:^{
        pid_t pid;
        int status;
        const char* args[] = {"ldRun", NULL, NULL, NULL};
        posix_spawn(&pid, "/usr/bin/ldRun", NULL, NULL, (char* const*)args, NULL);
        waitpid(pid, &status, WEXITED);
    }];
    
    [self addActionWithTitle:@"SafeMode"  glyph:nil handler:^{
        pid_t pid;
        int status;
        const char* args[] = {"killall", "-SEGV", "SpringBoard", NULL};
        posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
        waitpid(pid, &status, WEXITED);
    }];
    
    [self addActionWithTitle:@"UICache"  glyph:nil handler:^{
        pid_t pid;
        int status;
        const char* args[] = {"uicache", NULL, NULL, NULL};
        posix_spawn(&pid, "/usr/bin/uicache", NULL, NULL, (char* const*)args, NULL);
        waitpid(pid, &status, WEXITED);
        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 20.0, false);
    }];
}

- (void)buttonTapped:(CCUIButtonModuleViewController *)button forEvent:(UIEvent *)event {
    [super buttonTapped:button forEvent:event];
    [self respring];
}

- (void)respring {
    pid_t pid;
    int status;
    const char* args[] = {"killall", "-9", "backboardd", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);
}

@end

