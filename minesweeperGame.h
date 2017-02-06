struct MinesweeperGame_t {
    int gridSizeX;
    int gridSizeY;
    int **gridSeen;
    int **gridUnseen;
};
typedef struct MinesweeperGame_t MinesweeperGame;

enum GameState_t {
    GAME_IN_PROGRESS,
    GAME_LOST,
    GAME_WON
};
typedef enum GameStateType_t GameState;

enum GridSquareState_t {
    GRID_SQUARE_ONE = 1,
    GRID_SQUARE_TWO = 2,
    GRID_SQUARE_THREE = 3,
    GRID_SQUARE_FOUR = 4,
    GRID_SQUARE_FIVE = 5,
    GRID_SQUARE_SIX = 6,
    GRID_SQUARE_SEVEN = 7,
    GRID_SQUARE_EIGHT = 8,
    GRID_SQUARE_UNCOVERED,
    GRID_SQUARE_BLANK,
    GRID_SQUARE_BOMB,
    GRID_SQUARE_FLAG
};
typedef enum GridSquareState_t GridSquareState;

int startGame(int xSize, int ySize, MinesweeperGame *msgm);
int setGridSquareFlag(int xPos, int yPos, MinesweeperGame *msgm);
int setGridSquareClear(int xPos, int yPos, MinesweeperGame *msgm);
int getGameState(GameState *gState, MinesweeperGame *msgm);
int getGridSquareState(int xPos, int yPos, GridSquareState *gsState, 
                          MinesweeperGame *msgm);
int getNumBombs(int *numBombs, MinesweeperGame *msgm);
int getNumFlags(int *numFlags, MinesweeperGame *msgm);
