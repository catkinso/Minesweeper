#import <Cocoa/Cocoa.h>

@interface MinesweeperView : NSView
{
    int i;
    int squares[10][12];
}

- (void)drawRect:(NSRect)rect;

@end
