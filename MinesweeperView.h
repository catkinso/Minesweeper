#import <Cocoa/Cocoa.h>

#import "coordinates.h"

typedef NS_ENUM(NSUInteger, GridSymbolType) {
    GRID_SYMBOL_FIRST = 1,
    GRID_SYMBOL_BLANK = GRID_SYMBOL_FIRST,
    GRID_SYMBOL_SOLID,
    GRID_SYMBOL_SOLID_FLAG,
    GRID_SYMBOL_X,
    GRID_SYMBOL_ONE,
    GRID_SYMBOL_TWO,
    GRID_SYMBOL_THREE,
    GRID_SYMBOL_FOUR,
    GRID_SYMBOL_FIVE,
    GRID_SYMBOL_SIX,
    GRID_SYMBOL_SEVEN,
    GRID_SYMBOL_EIGHT,
    GRID_SYMBOL_LAST = GRID_SYMBOL_EIGHT
};

@interface MinesweeperView : NSView
{
    GridSymbolType squares[NUM_GRID_SQUARES_X][NUM_GRID_SQUARES_Y];
}

- (void)drawRect:(NSRect)rect;

@end
