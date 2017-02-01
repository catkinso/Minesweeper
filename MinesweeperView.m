/*****************************************************************************
 *
 * MinesweeperView.m
 *
 *****************************************************************************/
#import "MinesweeperView.h"

@implementation MinesweeperView

- (id)initWithFrame:(NSRect)frameRect
{
    int j, k;

    self = [super initWithFrame:frameRect];

    for (j = 0; j < NUM_GRID_SQUARES_X; j++)
        for (k = 0; k < NUM_GRID_SQUARES_Y; k++)
            squares[j][k] = GRID_SYMBOL_SOLID;

    return self;
}

- (void)drawRect:(NSRect)rect
{
    NSDictionary *textAttributes;
    NSAttributedString *titleStr;
    int g, h;

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

    [self drawGrid];

    /* Cycle through each grid square and draw appropriate symbol. */
    for (g = 0; g < NUM_GRID_SQUARES_Y; g++) {
        for (h = 0; h < NUM_GRID_SQUARES_X; h++) {
            switch (squares[h][g]) {
            case GRID_SYMBOL_SOLID:
                [self drawSquareSymbolAtGridsquareX:h squareY:g];
                break;
            case GRID_SYMBOL_SOLID_FLAG:
                [self drawFlagSymbolAtGridsquareX:h squareY:g];
                break;
            case GRID_SYMBOL_X:
                [self drawXSymbolAtGridsquareX:h squareY:g];
                break;
            case GRID_SYMBOL_ONE:
                [self drawNumSymbolAtGridsquareX:h squareY:g number:1];
                break;
            case GRID_SYMBOL_TWO:
                [self drawNumSymbolAtGridsquareX:h squareY:g number:2];
                break;
            case GRID_SYMBOL_THREE:
                [self drawNumSymbolAtGridsquareX:h squareY:g number:3];
                break;
            case GRID_SYMBOL_FOUR:
                [self drawNumSymbolAtGridsquareX:h squareY:g number:4];
                break;
            case GRID_SYMBOL_FIVE:
                [self drawNumSymbolAtGridsquareX:h squareY:g number:5];
                break;
            case GRID_SYMBOL_SIX:
                [self drawNumSymbolAtGridsquareX:h squareY:g number:6];
                break;
            case GRID_SYMBOL_SEVEN:
                [self drawNumSymbolAtGridsquareX:h squareY:g number:7];
                break;
            case GRID_SYMBOL_EIGHT:
                [self drawNumSymbolAtGridsquareX:h squareY:g number:8];
                break;
            default:
                break;
            }
        }
    }
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

- (void)drawSquareSymbolAtGridsquareX:(int)x squareY:(int)y
{
    float x1, y1, x2, y2;
    NSBezierPath *path;

    x1 = GRID_SQUARE_TO_OFFSET_X(x);
    y1 = GRID_SQUARE_TO_OFFSET_Y(y);
    x2 = x1 + SQUARE_SYMBOL_SIZE_X;
    y2 = y1 + SQUARE_SYMBOL_SIZE_Y;

    path = [NSBezierPath bezierPath];
    [path moveToPoint:NSMakePoint(x1, y1)];
    [path lineToPoint:NSMakePoint(x2, y1)];
    [path lineToPoint:NSMakePoint(x2, y2)];
    [path lineToPoint:NSMakePoint(x1, y2)];
    [[NSColor whiteColor] set];
    [path fill];
}

- (void)drawNumSymbolAtGridsquareX:(int)x squareY:(int)y number:(int)n
{
    float x1, y1;
    char num[2];
    NSString *numstr;
    NSDictionary *textAttributes;
    NSAttributedString *numAttribStr;

    x1 = GRID_SQUARE_TO_OFFSET_X(x);
    y1 = GRID_SQUARE_TO_OFFSET_Y(y);

    num[0] = n + '0';
    num[1] = 0;
    numstr = [[NSString alloc] initWithUTF8String:num];
    textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                       [NSFont fontWithName:@"Helvetica" size:28],
                         NSFontAttributeName, [NSColor whiteColor], 
                           NSForegroundColorAttributeName, nil];
    numAttribStr = [[NSAttributedString alloc] initWithString:numstr
                     attributes:textAttributes];
    [numAttribStr drawAtPoint:NSMakePoint(x1 + 5, y1 - 5)];               
}

- (void)drawXSymbolAtGridsquareX:(int)x squareY:(int)y
{
    float x1, y1, x2, y2;
    NSBezierPath *path;

    x1 = GRID_SQUARE_TO_OFFSET_X(x);
    y1 = GRID_SQUARE_TO_OFFSET_Y(y);
    x2 = x1 + SQUARE_SYMBOL_SIZE_X;
    y2 = y1 + SQUARE_SYMBOL_SIZE_Y;

    path = [NSBezierPath bezierPath];
    [path moveToPoint:NSMakePoint(x1, y1)];
    [path lineToPoint:NSMakePoint(x2, y2)];
    path.lineWidth = 4.0;
    [[NSColor whiteColor] set];
    [path stroke];
    path = [NSBezierPath bezierPath];
    [path moveToPoint:NSMakePoint(x1, y2)];
    [path lineToPoint:NSMakePoint(x2, y1)];
    path.lineWidth = 4.0;
    [[NSColor whiteColor] set];
    [path stroke];
}

- (void)drawFlagSymbolAtGridsquareX:(int)x squareY:(int)y
{
    float x1, y1, x2, y2;
    NSBezierPath *path;

    x1 = GRID_SQUARE_TO_OFFSET_X(x);
    y1 = GRID_SQUARE_TO_OFFSET_Y(y);
    x2 = x1 + SQUARE_SYMBOL_SIZE_X;
    y2 = y1 + SQUARE_SYMBOL_SIZE_Y;

    [self drawSquareSymbolAtGridsquareX:x squareY:y];

    path = [NSBezierPath bezierPath];
    [path moveToPoint:NSMakePoint(x1 + 7, y1 + 3)];
    [path lineToPoint:NSMakePoint(x1 + 7, y2 - 3)];
    path.lineWidth = 3.0;
    [[NSColor redColor] set];
    [path stroke];

    path = [NSBezierPath bezierPath];
    [path moveToPoint:NSMakePoint(x1 + 7, y2 - 3)];
    [path lineToPoint:NSMakePoint(x1 + 20, y2 - 8)];
    [path lineToPoint:NSMakePoint(x1 + 7, y2 - 16)];
    [[NSColor redColor] set];
    [path fill];
}

- (void)mouseUp:(NSEvent*)event
{
    float aoiStartX, aoiEndX, aoiStartY, aoiEndY;    
    NSPoint mousePoint;

    aoiStartX = GRID_OFFSET_X;
    aoiEndX = aoiStartX + (NUM_GRID_SQUARES_X * GRID_SQUARE_SIZE_X);
    aoiStartY = GRID_OFFSET_Y;
    aoiEndY = aoiStartY + (NUM_GRID_SQUARES_Y * GRID_SQUARE_SIZE_Y);

    mousePoint = [event locationInWindow];

    /* Toggle square value if the mouse click was inside the respective 
       grid square. */
    if (mousePoint.x > aoiStartX && mousePoint.x < aoiEndX
                       && mousePoint.y > aoiStartY && mousePoint.y < aoiEndY) {
        int x = (int)(mousePoint.x - GRID_OFFSET_X) / GRID_SQUARE_SIZE_X;
        int y = (int)(mousePoint.y - GRID_OFFSET_Y) / GRID_SQUARE_SIZE_Y;

        squares[x][y]++;
        if (squares[x][y] > GRID_SYMBOL_LAST)
            squares[x][y] = GRID_SYMBOL_FIRST;

        [self setNeedsDisplay:YES];
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
