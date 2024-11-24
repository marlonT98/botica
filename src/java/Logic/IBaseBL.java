package Logic;

import java.util.List;

public interface IBaseBL<T> {

    List<T> listar();

    boolean eliminar(String id);

    T bucarPorId(int id);

    boolean insertar(T cliente);

    boolean actualizar(T cliente);

}
