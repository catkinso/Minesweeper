Minesweeper: minesweeperMain.o MinesweeperAppDelegate.o MinesweeperView.o
	clang -framework Cocoa -o Minesweeper minesweeperMain.o \
                                     MinesweeperAppDelegate.o MinesweeperView.o

minesweeperMain.o: minesweeperMain.m MinesweeperAppDelegate.h
	clang -c minesweeperMain.m

MinesweeperAppDelegate.o: MinesweeperAppDelegate.m MinesweeperAppDelegate.h \
                                                MinesweeperView.h coordinates.h
	clang -c MinesweeperAppDelegate.m

MinesweeperView.o: MinesweeperView.m MinesweeperView.h coordinates.h
	clang -c MinesweeperView.m
