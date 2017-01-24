/*****************************************************************************
 *
 * MinesweeperView.m
 *
 *****************************************************************************/
#include "MinesweeperView.h"
#include "coordinates.h"

@implementation MinesweeperView

- (id)initWithFrame:(NSRect)frameRect
{
    int j, k;

    self = [super initWithFrame:frameRect];

    for (j = 0; j < NUM_GRID_SQUARES_X; j++)
        for (k = 0; k < NUM_GRID_SQUARES_Y; k++)
            squares[j][k] = 1;

    return self;
}

- (void)drawRect:(NSRect)rect
{
    NSDictionary *textAttributes;
    NSAttributedString *titleStr;

    /* Set app background colour. */
    [[NSColor redColor] setFill];
    NSRectFill(rect);

    /* Display title. */
    textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                         [NSFont fontWithName:@"Helvetica" size:36],
                         NSFontAttributeName, [NSColor whiteColor], 
                         NSForegroundColorAttributeName, nil];
    titleStr = [[NSAttributedString alloc] initWithString:@"Minesweeper"
                   attributes:textAttributes];
    [titleStr drawAtPoint:NSMakePoint(25.0, 550.0)];

    /* Display grid and grid symbols. */
    [self drawGrid];
    [self drawGridSymbols];
}

- (void)drawGrid
{
    int z;
    float startX, startY, endX, endY;
    NSBezierPath *path;

    /* Draw horizontal grid lines. */
    for (z = 0; z <= NUM_GRID_SQUARES_Y; z++) {
        startX = GRID_OFFSET_X;
        startY = GRID_OFFSET_Y + (z * GRID_SQUARE_SIZE_Y);
        endX = startX + (NUM_GRID_SQUARES_X * GRID_SQUARE_SIZE_X);
        endY = startY;

        path = [NSBezierPath bezierPath];
        [path moveToPoint:NSMakePoint(startX, startY)];
        [path lineToPoint:NSMakePoint(endX, endY)];
        path.lineWidth = 2.0;
        [path stroke];
    }

    /* Draw verticial grid lines. */
    for (z = 0; z <= NUM_GRID_SQUARES_X; z++) {
        startX = GRID_OFFSET_X + (z * GRID_SQUARE_SIZE_X);
        startY = GRID_OFFSET_Y;
        endX = startX;
        endY = GRID_OFFSET_Y + (NUM_GRID_SQUARES_Y * GRID_SQUARE_SIZE_Y);

        path = [NSBezierPath bezierPath];
        [path moveToPoint:NSMakePoint(startX, startY)];
        [path lineToPoint:NSMakePoint(endX, endY)];
        path.lineWidth = 2.0;
        [path stroke];
    }
}

- (void)drawGridSymbols
{
    int g, h;

    /* Cycle through each grid square and draw appropriate symbol. */
    for (g = 0; g < NUM_GRID_SQUARES_Y; g++) {
        for (h = 0; h < NUM_GRID_SQUARES_X; h++) {
            if (squares[h][g] == 1) {
                float x1 = GRID_OFFSET_X + SQUARE_SYMBOL_OFFSET_X
                                                    + (h * GRID_SQUARE_SIZE_X);
                float y1 = GRID_OFFSET_Y + SQUARE_SYMBOL_OFFSET_Y
                                                    + (g * GRID_SQUARE_SIZE_Y);
                float x2 = x1 + SQUARE_SYMBOL_SIZE_X;
                float y2 = y1;
                float x3 = x2;
                float y3 = y1 + SQUARE_SYMBOL_SIZE_Y;
                float x4 = x1;
                float y4 = y3;

                NSBezierPath *path = [NSBezierPath bezierPath];
                [path moveToPoint:NSMakePoint(x1, y1)];
                [path lineToPoint:NSMakePoint(x2, y2)];
                [path lineToPoint:NSMakePoint(x3, y3)];
                [path lineToPoint:NSMakePoint(x4, y4)];
                [[NSColor whiteColor] set];
                [path fill];
            }
        }
    }
}

- (void)mouseUp:(NSEvent*)event
{
    float aoiStartX, aoiEndX, aoiStartY, aoiEndY;    
    NSPoint mousePoint;

    aoiStartX = GRID_OFFSET_X;
    aoiEndX = aoiStartX + (NUM_GRID_SQUARES_X * GRID_SQUARE_SIZE_X);
    aoiStartY = GRID_OFFSET_Y;
    aoiEndY = aoiStartY + (NUM_GRID_SQUARES_Y * GRID_SQUARE_SIZE_Y);

    [self setNeedsDisplay:YES];
    mousePoint = [event locationInWindow];

    /* Toggle square value if the mouse click was inside the respective 
       grid square. */
    if (mousePoint.x > aoiStartX && mousePoint.x < aoiEndX
                       && mousePoint.y > aoiStartY && mousePoint.y < aoiEndY) {
        int x = (int)(mousePoint.x - GRID_OFFSET_X) / GRID_SQUARE_SIZE_X;
        int y = (int)(mousePoint.y - GRID_OFFSET_Y) / GRID_SQUARE_SIZE_Y;

        if (squares[x][y] == 1)
            squares[x][y] = 0;
        else
            squares[x][y] = 1;
    }
}

- (void)flagsChanged:(NSEvent *)event
{
    if ([event modifierFlags] & NSEventModifierFlagShift)
        NSLog(@"Shift key pressed.");

    if ([event modifierFlags] & NSEventModifierFlagCapsLock)
        NSLog(@"CAPS lock on.");
}

- (BOOL)canBecomeKeyView
{
    return YES;
}

- (BOOL)acceptsFirstResponder
{
    return YES;
}

@end
