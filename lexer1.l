%{
#include <cstdlib>
#include "Parser1.hpp"
using namespace calc;
%}

%option reentrant interactive noyywrap noyylineno nodefault outfile="Scanner1.cpp" header="Scanner1.hpp"

dseq            ([[:digit:]]+)
dseq_opt        ({dseq}?)
frac            (({dseq_opt}"."{dseq})|{dseq}".")
exp             ([eE][+-]?{dseq})
exp_opt         ({exp}?)
integer         ({dseq})
float           (({frac}{exp_opt})|({dseq}{exp}))
intvar          ([[:upper:]])
fltvar          ([[:lower:]])

%%

{integer}   yylval->emplace<long long>(strtoll(yytext, nullptr, 10)); return Parser::token::INT;
{float}     yylval->emplace<double>(strtod(yytext, nullptr)); return Parser::token::FLT;
{intvar}    yylval->emplace<char>(yytext[0]); return Parser::token::INTVAR;
{fltvar}    yylval->emplace<char>(yytext[0]); return Parser::token::FLTVAR;
"+"         return Parser::token::PLUS;
"-"         return Parser::token::MINUS;
"*"         return Parser::token::MULTIPLY;
"/"         return Parser::token::DIVIDE;
"%"         return Parser::token::MODULO;
"!"         return Parser::token::FACTORIAL;
"^"         return Parser::token::EXPONENT;
"("         return Parser::token::LPAREN;
")"         return Parser::token::RPAREN;
"="         return Parser::token::ASSIGN;
\n          return Parser::token::EOL;
<<EOF>>     return Parser::token::YYEOF;
.           /* no action on unmatched input */

%%

// main() can't go here due to bug in flex 2.6.4