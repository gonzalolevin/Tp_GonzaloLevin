namespace TP8_Levin.Models;
public class Pedidos
{
private int _idPedidos;
private int _idMetodoDePago;
private int _idEnvase;


public int IdPedidos
{
    get{return _idPedidos;}
    set{_idPedidos = value;}
}

public int IdEnvase
{
    get{return _idEnvase;}
    set{_idEnvase = value;}
}
public int IdMetodoDePago
{
    get{return _idMetodoDePago;}
    set{_idMetodoDePago = value;}
}


}
