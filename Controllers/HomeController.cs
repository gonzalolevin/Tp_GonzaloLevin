using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP8_Levin.Models;

namespace TP8_Levin.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        ViewBag.ObtenerEnvase = BD.ObtenerEnvase();
        return View ("Index");
    }

     public IActionResult Fin()
    {
        return View ("Fin");
    }

    public IActionResult Privacy()
    {
        return View();
    }

      public IActionResult Volver ()
      {
        return View ("Index");
      }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }


    public IActionResult ObtenerGustos (int IdEnvase)
    {
        ViewBag.ObtenerGustos = BD.ObtenerGustos();
        ViewBag.ObtenerEnvase = BD.ObtenerEnvase();
        ViewBag.ObtenerEnvaseid = BD.ObtenerEnvase(IdEnvase);

        if (IdEnvase == 1)
        {
            ViewBag.CantGustos = 4;
        }
        else if (IdEnvase == 2 || IdEnvase == 3)
        {
            ViewBag.CantGustos = 3;
        }
        else
        {
            ViewBag.CantGustos = 2;
        }
        return View ("Gustos");
    }


    public IActionResult ObtenerMetodoDePago(int Clave, List<int> Gustos)
    {
        //guardo todo como si hubiese pagado, pero en vez de metodod e apgo efectivo, pongo NO_PAGO y me quedo con el id de lo q acabo de guardar
        //paso ese id a la vista para luego mandarlo como clave y actualizarlo
        List<Gustos> gus = new List<Gustos>();
        foreach (int IdGustos in Gustos)
        {
            gus.Add(BD.ObtenerGustos(IdGustos));
        }
        ViewBag.ListaGustos = gus;
        ViewBag.ObtenerMetodoDePago = BD.ObtenerMetodoDePago();
        ViewBag.ObtenerEnvaseId = BD.ObtenerEnvase(Clave);
        return View ("MetodoDePago");
    }

    public IActionResult GuardarPedido (List<int> Gustos, int MetodoDePago, int Envase)
    {
    
       BD.GuardarPedido(Gustos,  MetodoDePago, Envase);

       return View ("Fin");
    }


    
    


}
