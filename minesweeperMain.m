/*****************************************************************************
 *
 * minesweeperMain.m
 *
 * For the overall layout of a cocoa app the following resources were very
 * helpful:
 *
 * https://www.cocoawithlove.com/2010/09/minimalist-cocoa-programming.html
 * https://www.safaribooksonline.com/library/view
 *                            /building-cocoa-applications/0596002351/ch04.html
 *
 *****************************************************************************/
#import <Cocoa/Cocoa.h>

#include "MinesweeperAppDelegate.h"

int main( )
{
    MinesweeperAppDelegate *delegate;

    [NSApplication sharedApplication];
    delegate = [[MinesweeperAppDelegate alloc] init];
    [NSApp setDelegate:delegate];
    [NSApp run];
    
    return 0;
}
