package compilador.ast;

public class Division extends OperacionBinaria {

    public Division(Expresion izquierda, Expresion derecha) {
        super(izquierda, derecha);
    }

    @Override
    protected String getNombreOperacion() {
        return "/";
    }
}