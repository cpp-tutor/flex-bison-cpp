namespace calc { // note: depends upon FlexLexer.h and Parser2.hpp

class Scanner : public yyFlexLexer {
public:
    Scanner(std::istream& arg_yyin, std::ostream& arg_yyout)
        : yyFlexLexer(arg_yyin, arg_yyout) {}
    Scanner(std::istream* arg_yyin = nullptr, std::ostream* arg_yyout = nullptr)
        : yyFlexLexer(arg_yyin, arg_yyout) {}
    int lex(Parser::semantic_type *yylval); // note: this is the prototype we need
};

} // namespace calc