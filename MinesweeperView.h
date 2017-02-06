#import <Cocoa/Cocoa.h>

#import "coordinates.h"
#import "minesweeperGame.h"

@interface MinesweeperView : NSView
{
    MinesweeperGame mgame;
}

- (void)drawRect:(NSRect)rect;

@end
