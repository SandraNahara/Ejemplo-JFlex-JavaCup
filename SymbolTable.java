import java.util.HashMap;

public class SymbolTable {
    private HashMap<String, String> table;

    public SymbolTable() {
        table = new HashMap<>();
    }

    public void add(String id, String type) {
        table.put(id, type);
    }

    public boolean exists(String id) {
        return table.containsKey(id);
    }

    public void print() {
        for (String id : table.keySet()) {
            System.out.println(id + " : " + table.get(id));
        }
    }
}
