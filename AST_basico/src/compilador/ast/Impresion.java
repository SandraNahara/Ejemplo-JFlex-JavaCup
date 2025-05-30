/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador.ast;

/**
 *
 * @author ITT
 */
public class Impresion extends Nodo{
    
    private final Expresion expresion;
    
    public Impresion(Expresion expresion){
        this.expresion = expresion;
    }
    
    public String graficar() {
        // Acá se dispara la invocación a los métodos graficar() de los nodos.
        // Como la Impresion no tiene padre, se inicia pasando null.  
        StringBuilder resultado = new StringBuilder();
        resultado.append("graph G {");
        resultado.append(this.graficar(null));
        resultado.append(this.expresion.graficar(this.getId()));
        resultado.append("}");
        return resultado.toString();
    }
    
}
