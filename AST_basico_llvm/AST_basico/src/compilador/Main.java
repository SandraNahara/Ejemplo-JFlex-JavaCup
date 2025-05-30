package compilador;

import compilador.ast.Impresion;
import compilador.lexico.Lexico;
import compilador.sintactico.Sintactico;
import java.io.BufferedReader;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.PrintWriter;

public class Main {

    public static void main(String[] args) throws Exception {
        final FileReader entrada = new FileReader("./entrada.txt");
        final Lexico lexico = new Lexico(entrada);
        final Sintactico sintactico= new Sintactico(lexico);
        final Impresion impresion = (Impresion) sintactico.parse().value;
     
        try {
            PrintWriter pw = new PrintWriter(new FileWriter("arbol.dot"));
            pw.println(impresion.graficar());
            pw.close();
            String cmdDot = "dot -Tpng arbol.dot -o arbol.png";
            Runtime.getRuntime().exec(cmdDot);
            System.out.println("Gráfico AST generado");

            
            //generar codigo IR para el LLVM
            pw = new PrintWriter(new FileWriter("programa.ll"));
            pw.println(impresion.generarCodigo());
            pw.close();
            System.out.println("Código generado");

            
            Process process = Runtime.getRuntime().exec("clang -c -o programa.o programa.ll");
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
            System.out.println("Archivo objeto generado");

            Process process2 = Runtime.getRuntime().exec("clang -o programa.exe programa.o");
            BufferedReader reader2 = new BufferedReader(new InputStreamReader(process2.getInputStream()));
            String line2;
            while ((line2 = reader2.readLine()) != null) {
                System.out.println(line2);
            }
            System.out.println("Ejecutable generado");

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
