package compilador.ast;

public class Suma extends OperacionBinaria {

    public Suma(Expresion izquierda, Expresion derecha) {
        super(izquierda, derecha);
    }

    @Override
    protected String getNombreOperacion() {
        return "+";
    }
    
    @Override
    public String get_llvm_op_code() {
        return "add";
    }
}