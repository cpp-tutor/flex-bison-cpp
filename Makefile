# GNU Makefile for cpp-tutor/flex-bison-cpp
# note: can run 'make calc1' or 'make calc2'

FLEX = flex
BISON = bison
CPP = g++
CPPFLAGS =
CALC1 = calc1
CALC2 = calc2

AUTOGEN1 = Parser1.hpp Parser1.cpp Scanner1.hpp Scanner1.cpp
AUTOGEN2 = Parser2.hpp Parser2.cpp Scanner2.cpp

all: $(CALC1) $(CALC2)

$(AUTOGEN1): lexer1.l grammar1.y
	$(FLEX) lexer1.l
	$(BISON) grammar1.y

$(AUTOGEN2): lexer2.l grammar2.y
	$(FLEX) lexer2.l
	$(BISON) grammar2.y

$(CALC1): $(AUTOGEN1)
	$(CPP) $(CPPFLAGS) -o $(CALC1) Parser1.cpp Scanner1.cpp

$(CALC2): $(AUTOGEN2) Scanner2.hpp
	$(CPP) $(CPPFLAGS) -o $(CALC2) Parser2.cpp Scanner2.cpp

clean:
	rm -f $(CALC1) $(AUTOGEN1) $(CALC2) $(AUTOGEN2)
