CC = clang
PROG = Minesweeper
LDFLAGS = -framework Cocoa

OBJDIR = objs
OBJECTS = $(addprefix $(OBJDIR)/, minesweeperMain.o MinesweeperAppDelegate.o \
                                   MinesweeperView.o minesweeperGame.o)

$(PROG): $(OBJECTS)
	$(CC) $(LDFLAGS) -o $(PROG) $(OBJECTS)

$(OBJDIR)/minesweeperMain.o: MinesweeperAppDelegate.h
$(OBJDIR)/MinesweeperAppDelegate.o: MinesweeperAppDelegate.h \
                                    MinesweeperView.h coordinates.h
$(OBJDIR)/MinesweeperView.o: MinesweeperView.h coordinates.h minesweeperGame.h
$(OBJDIR)/minesweeperGame.o: minesweeperGame.h

$(OBJDIR)/%.o: %.m
	$(CC) -o $@ -c $<

$(OBJDIR)/%.o: %.c
	$(CC) -o $@ -c $<

$(OBJECTS): | $(OBJDIR)

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -fr $(PROG) $(OBJDIR)
