package compilador.lexico;

import compilador.sintactico.SintacticoSym;
import java_cup.runtime.Symbol;

%%

%public
%class Lexico
%cup
%char
%line
%column
%unicode

%eofval{
     return new Symbol(SintacticoSym.EOF);
%eofval}

FIN_DE_LINEA = \r | \n | \r\n

BLANCO       = {FIN_DE_LINEA} | [ \t\f]

IDENTIFICADOR = [_]* [\p{letter}] [\w]*

ENTERO = [\d]+

%%

<YYINITIAL> {

    "SHOW"           { return new Symbol(SintacticoSym.SHOW, yycolumn, yyline); }
    "+"              { return new Symbol(SintacticoSym.MAS, yycolumn, yyline); }
    "-"              { return new Symbol(SintacticoSym.MENOS, yycolumn, yyline); }
    "*"              { return new Symbol(SintacticoSym.ASTERISCO, yycolumn, yyline); }
    "/"              { return new Symbol(SintacticoSym.BARRA, yycolumn, yyline); }
    "("              { return new Symbol(SintacticoSym.PARENTESIS_ABRE, yycolumn, yyline); }
    ")"              { return new Symbol(SintacticoSym.PARENTESIS_CIERRA, yycolumn, yyline); }
    {ENTERO}         { return new Symbol(SintacticoSym.CONSTANTE_ENTERA, yycolumn, yyline, Integer.parseInt(yytext())); }

    {BLANCO}         {}
}

[^]                  { throw new Error(String.format("Carácter no permitido: <%s> en línea %d, columna %d.", yytext(), yyline, yycolumn)); }
