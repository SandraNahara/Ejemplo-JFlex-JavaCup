package compilador.ast;

public class Resta extends OperacionBinaria {

    public Resta(Expresion izquierda, Expresion derecha) {
        super(izquierda, derecha);
    }

    @Override
    protected String getNombreOperacion() {
        return "-";
    }
}