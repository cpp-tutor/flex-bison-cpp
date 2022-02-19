@ECHO OFF

@ECHO Generating: Scanner1.hpp Scanner1.cpp
win_flex --wincompat lexer1.l
@ECHO Generating: Parser1.hpp Parser1.cpp
win_bison grammar1.y
cl /EHsc /FeCalc1.exe Parser1.cpp Scanner1.cpp

@ECHO Generating: Scanner2.cpp
win_flex --wincompat lexer2.l
@ECHO Generating: Parser2.hpp Parser2.cpp
win_bison grammar2.y
cl /EHsc /FeCalc2.exe /I. Parser2.cpp Scanner2.cpp
