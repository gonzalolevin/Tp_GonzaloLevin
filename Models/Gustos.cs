namespace TP8_Levin.Models;

public class Gustos
{
    private int _idGustos;
    private string _foto;
    private string _nombre;
    private int _cantidadMax;

    public int IdGustos
    {
        get{return _idGustos;}
        set{_idGustos = value;}
    }
    public string Foto
    {
        get{return _foto;}
        set{_foto = value;}
    }
     public string Nombre
    {
        get{return _nombre;}
        set{_nombre = value;}
    }
    public int CantidadMAx
    {
        get{return _cantidadMax;}
        set{_cantidadMax = value;}
    }

    

}