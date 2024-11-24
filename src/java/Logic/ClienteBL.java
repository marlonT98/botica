package Logic;

import DataAccesObject.ClienteDAO;
import Entity.ClienteEntity;
import java.util.List;

public class ClienteBL implements IBaseBL<ClienteEntity> {

    ClienteDAO clienteDao = new ClienteDAO();

    @Override
    public List<ClienteEntity> listar() {

        return clienteDao.obtenerTodos();

    }

    @Override
    public boolean eliminar(String id) {

        return clienteDao.eliminar(id);
    }

    @Override
    public ClienteEntity bucarPorId(int id) {
        return clienteDao.readByCodigo(id);
    }

    @Override
    public boolean insertar(ClienteEntity cliente) {

        return clienteDao.insertar(cliente);
    }

    @Override
    public boolean actualizar(ClienteEntity cliente) {

        return clienteDao.actualizar(cliente);
    }

}
