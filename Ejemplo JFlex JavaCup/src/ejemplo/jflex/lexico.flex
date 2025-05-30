/****************************************************************************
 * En esta sección se puede incluir todo código que se copiará textualmente
 * al comienzo del archivo JAVA que contendrá la definición de la clase del 
 * analizador léxico.
 ****************************************************************************/

/* Ejemplo:


*/
package ejemplo.jflex;
import java.util.ArrayList;
import java_cup.runtime.*;
import java_cup.sym;

/****************************************************************************
 * Las siguientes directivas afectan el comportamiento del analizador léxico:
 *
 *  - %class Nombre --> Nombre de la clase generada.
 *
 *  - %type Nombre  --> Nombre de la clase usada para representar token.
 *                      Será el tipo de los objetos retornados por yylex().
 *  - %line         --> El analizador sabrá el número de línea que se está
 *                      analizando. Puede consultarse con this.yyline
 *  - %column       --> El analizador sabrá el número de columna que se está
 *                      analizando. Puede consultarse con this.yycolumn
 *  - %char         --> El analizador sabrá el número de caracter que se está
 *                      analizando. Puede consultarse con this.yychar
 *
 * Existen otras directivas adicionales descriptas en la documentación.
 ****************************************************************************/ 
%%

%public
%class MiLexico
%cup
%line
%column


%{
    /*************************************************************************
    * En esta sección se puede incluir código que se copiará textualmente
    * como parte de la definición de la clase del analizador léxico.
    * Típicamente serán variables de instancia o nuevos métodos de la clase.
    *************************************************************************/
    
    public ArrayList<MiToken> tablaDeSimbolos = new ArrayList<>();
 
    private MiToken token(String nombre) {
        return new MiToken(nombre, this.yyline, this.yycolumn);
    }

    private MiToken token(String nombre, Object valor) {
        return new MiToken(nombre, this.yyline, this.yycolumn, valor);
    }
%}

LineTerminator =    \r|\n|\r\n

WhiteSpace     =    {LineTerminator} | [ \t\f]

num_sin_ceros =     [1-9]

digito =            [0-9]

dec_entero =        0 |{num_sin_ceros}{digito}*

id =                ([:letter:]|_)\w* 


%%
   
<YYINITIAL> {

    "+"                 { return token("MAS", yytext()); }
    "-"                 { return token("MENOS", yytext()); }
    "/"                 { return token("DIV", yytext()); }
    "*"                 { return token("MULT", yytext()); }
    "("                 { return token("PAR_ABRE", yytext()); }  
    ")"                 { return token("PAR_CIERRA", yytext()); }        
    {id}                { return token("IDENTIFICADOR", yytext()); }
    {WhiteSpace}        { /* Ignora los espacios en blanco */ }
    {dec_entero}        { return token("ENTERO", yytext()); }
   
}

[^]                     { throw new Error("Caracter no permitido: <" + yytext() + ">"); }
