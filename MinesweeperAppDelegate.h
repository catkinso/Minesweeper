#import <Cocoa/Cocoa.h>

#include "MinesweeperView.h"

@interface MinesweeperAppDelegate : NSObject <NSApplicationDelegate>
{
    NSWindow *window;
    MinesweeperView *view;
}
@end
