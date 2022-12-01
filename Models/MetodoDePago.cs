namespace TP8_Levin.Models;
public class MetodoDePago
{
    private int _idMetodoDePago;
    private string _metodo;

    public int IdMetodoDePago
    {
        get{return _idMetodoDePago;}
        set{_idMetodoDePago = value;}
    }

    public string Metodo
    {
        get{return _metodo;}
        set{_metodo = value;}
    }


}
