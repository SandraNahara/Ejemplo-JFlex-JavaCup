package compilador.ast;

public class Constante extends Expresion {
    private final Object valor;

    public Constante(Object valor) {
        this.valor = valor;
    }

    public Object getValor() {
        return valor;
    }

    @Override
    protected String getEtiqueta() {
        return String.format(String.format("Const %s", getValor()));
    }
}
