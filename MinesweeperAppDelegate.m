/*****************************************************************************
 *
 * MinesweeperAppDelegate
 *
 *
 *****************************************************************************/
#include "MinesweeperAppDelegate.h"
#include "coordinates.h"

@implementation MinesweeperAppDelegate

- (id)init {
    NSMenuItem *progNameItem, *gameMenuItem;
    NSMenu *progNameMenu, *gameMenu, *menuBarMenu;

    NSRect windowRect;
    
    self = [super init];

    /* Menu and items for program name ("Minesweeper") menu. */
    progNameMenu = [[NSMenu alloc] initWithTitle:@""];
    [progNameMenu setAutoenablesItems:NO];
    [progNameMenu addItemWithTitle:@"About" action:@selector(aboutMenuAction:) 
                                                           keyEquivalent: @""];
    [progNameMenu addItemWithTitle:@"Quit" action:@selector(quitMenuAction:)
                                                           keyEquivalent: @""];

    /* Menu and items for "Game" menu. */
    gameMenu = [[NSMenu alloc] initWithTitle:@"Game"];
    [gameMenu setAutoenablesItems:NO];
    [gameMenu addItemWithTitle:@"Start" action:@selector(startMenuAction:)
                                                            keyEquivalent:@""];
    [gameMenu addItemWithTitle:@"Reset" action:@selector(resetMenuAction:)
                                                            keyEquivalent:@""];

    /* Menu, items and sub menus for the main menu bar. */
    menuBarMenu = [[NSMenu alloc] initWithTitle: @""];
    progNameItem = [menuBarMenu addItemWithTitle:@"" action:NULL
                                                            keyEquivalent:@""];
    gameMenuItem = [menuBarMenu addItemWithTitle:@"" action:NULL
                                                        keyEquivalent:@""];
    [menuBarMenu setSubmenu:progNameMenu forItem:progNameItem];
    [menuBarMenu setSubmenu:gameMenu forItem:gameMenuItem];

    /*
     * Getting a menu bar without a XIB:
     * http://lapcatsoftware.com/blog/2007/06/17
     *                              /working-without-a-nib-part-4-setapplemenu/
     */
    [NSApp performSelector:@selector(setAppleMenu:) withObject:progNameMenu];
    [NSApp setMainMenu: menuBarMenu];



    windowRect = NSMakeRect(0, 0, WIN_WIDTH, WIN_HEIGHT);
    window = [[NSWindow alloc] initWithContentRect:windowRect
               styleMask:NSWindowStyleMaskTitled|NSWindowStyleMaskClosable
                 backing:NSBackingStoreBuffered defer:NO];


    view = [[MinesweeperView alloc] initWithFrame:windowRect];
    [window setContentView:view];

    [window cascadeTopLeftFromPoint:NSMakePoint(20,20)];
    [window makeKeyAndOrderFront:nil];
    [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];

    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    [NSApp activateIgnoringOtherApps:YES];
}

- (void)startMenuAction:(id)sender
{
    NSLog(@"Start menu action.");
}

- (void)resetMenuAction:(id)sender
{
    NSLog(@"Reset menu action.");
}

- (void)windowWillClose:(NSNotification *)notification
{
    [NSApp terminate:self];
}

- (void)aboutMenuAction:(id)sender
{
    NSLog(@"About menu action.");
}

- (void)quitMenuAction:(id)sender
{
    [NSApp terminate:self];
}

@end
