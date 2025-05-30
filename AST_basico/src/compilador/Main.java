package compilador;

import compilador.ast.Impresion;
import compilador.lexico.Lexico;
import compilador.sintactico.Sintactico;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;

public class Main {

    public static void main(String[] args) throws Exception {
        final FileReader entrada = new FileReader("./entrada.txt");
        final Lexico lexico = new Lexico(entrada);
        final Sintactico sintactico= new Sintactico(lexico);
        final Impresion impresion = (Impresion) sintactico.parse().value;
     
        try {
            PrintWriter grafico = new PrintWriter(new FileWriter("arbol.dot"));
            grafico.println(impresion.graficar());
            grafico.close();
            String cmdDot = "dot -Tpng arbol.dot -o arbol.png";
            Runtime.getRuntime().exec(cmdDot);

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
