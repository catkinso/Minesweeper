#include <stdlib.h>
#include <stdio.h>

#include "minesweeperGame.h"

int get2DArray(int x, int y, int ***i);
int free2DArray(int ***i);

int startGame(int xSize, int ySize, MinesweeperGame *msgm)
{
    if (xSize != msgm->gridSizeX || ySize != msgm->gridSizeY) {
        free2DArray(&(msgm->gridSeen));            
        free2DArray(&(msgm->gridUnseen));            
    }

    if (msgm->gridSeen == NULL) {
        msgm->gridSizeX = xSize;
        msgm->gridSizeY = ySize;
        get2DArray(msgm->gridSizeX, msgm->gridSizeY, &(msgm->gridSeen));
        get2DArray(msgm->gridSizeX, msgm->gridSizeY, &(msgm->gridUnseen));
    }

    int i, j;
    for (i = 0; i < msgm->gridSizeX; i++) {
        for (j = 0; j < msgm->gridSizeY; j++) {
            msgm->gridSeen[i][j] = GRID_SQUARE_UNCOVERED;
            msgm->gridUnseen[i][j] = GRID_SQUARE_BLANK;
        }
    }

    msgm->gridUnseen[1][1] = GRID_SQUARE_BOMB;
    msgm->gridUnseen[3][3] = GRID_SQUARE_BOMB;
 
    msgm->gridUnseen[0][0] = GRID_SQUARE_ONE;
    msgm->gridUnseen[1][0] = GRID_SQUARE_ONE;
    msgm->gridUnseen[2][0] = GRID_SQUARE_ONE;

    msgm->gridUnseen[0][1] = GRID_SQUARE_ONE;
    msgm->gridUnseen[2][1] = GRID_SQUARE_ONE;

    msgm->gridUnseen[0][2] = GRID_SQUARE_ONE;
    msgm->gridUnseen[1][2] = GRID_SQUARE_ONE;
    msgm->gridUnseen[2][2] = GRID_SQUARE_TWO;
    msgm->gridUnseen[3][2] = GRID_SQUARE_ONE;
    msgm->gridUnseen[4][2] = GRID_SQUARE_ONE;

    msgm->gridUnseen[2][3] = GRID_SQUARE_ONE;
    msgm->gridUnseen[4][3] = GRID_SQUARE_ONE;

    msgm->gridUnseen[2][4] = GRID_SQUARE_ONE;
    msgm->gridUnseen[3][4] = GRID_SQUARE_ONE;
    msgm->gridUnseen[4][4] = GRID_SQUARE_ONE;
       
    return 0;
}


int setGridSquareFlag(int xPos, int yPos, MinesweeperGame *msgm)
{
    if (msgm->gridSeen[xPos][yPos] == GRID_SQUARE_UNCOVERED)
        msgm->gridSeen[xPos][yPos] = GRID_SQUARE_FLAG;
        
    return 0;
}


int setGridSquareClear(int xPos, int yPos, MinesweeperGame *msgm)
{
    if (msgm->gridUnseen[xPos][yPos] == GRID_SQUARE_BOMB) {
        int i, j;

        for (i = 0; i < msgm->gridSizeX; i++)
            for (j = 0; j < msgm->gridSizeY; j++)
                msgm->gridSeen[i][j] = msgm->gridUnseen[i][j];
    }
    else if (msgm->gridUnseen[xPos][yPos] >= GRID_SQUARE_ONE
                && msgm->gridUnseen[xPos][yPos] <= GRID_SQUARE_EIGHT) {
        msgm->gridSeen[xPos][yPos] = msgm->gridUnseen[xPos][yPos];
    }
    else {
        msgm->gridSeen[xPos][yPos] = GRID_SQUARE_BLANK;
    }
    
    return 0;
}


int getGameState(GameState *gState, MinesweeperGame *msgm)
{
    return 0;
}


int getGridSquareState(int xPos, int yPos, GridSquareState *gsState, 
                          MinesweeperGame *msgm)
{
    *gsState = msgm->gridSeen[xPos][yPos];

    return 0;
}


int getNumBombs(int *numBombs, MinesweeperGame *msgm)
{
    return 0;
}


int getNumFlags(int *numFlags, MinesweeperGame *msgm)
{
    return 0;
}


int get2DArray(int x, int y, int ***i)
{
    int **xPtrPtr;
    int *yPtr;
    int g;

    *i = (int **)malloc((x * sizeof (int *))
                              + (x * y * sizeof (int)));

    xPtrPtr = (int **)*i;
    yPtr = (int *)(xPtrPtr + x);

    for (g = 0; g < x; g++) {
        *(xPtrPtr + g) = yPtr;
        yPtr += y;
    }
    
    return 0;
}

int free2DArray(int ***i)
{
    if (*i == NULL)
        return 0;

    free(*i);
    *i = NULL;

    return 0;
}

