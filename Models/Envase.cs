namespace TP8_Levin.Models;

public class Envase
{
  private int _idEnvase;
  private string _nombre;
  private string _foto;
  private int _precio;

  public int IdEnvase
  {
    get{return _idEnvase;}
    set{_idEnvase = value;}
  }
  public string Nombre
  {
    get{return _nombre;}
    set{_nombre = value;}
  }
  public string Foto
  {
    get{return _foto;}
    set{_foto = value;}
  }

  public int Precio
  {
    get{return _precio;}
    set{_precio = value;}
  }


}