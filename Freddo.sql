USE [master]
GO
/****** Object:  Database [Freddo]    Script Date: 1/12/2022 15:38:32 ******/
CREATE DATABASE [Freddo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Freddo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Freddo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Freddo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Freddo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Freddo] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Freddo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Freddo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Freddo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Freddo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Freddo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Freddo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Freddo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Freddo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Freddo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Freddo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Freddo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Freddo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Freddo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Freddo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Freddo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Freddo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Freddo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Freddo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Freddo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Freddo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Freddo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Freddo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Freddo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Freddo] SET RECOVERY FULL 
GO
ALTER DATABASE [Freddo] SET  MULTI_USER 
GO
ALTER DATABASE [Freddo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Freddo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Freddo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Freddo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Freddo] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Freddo', N'ON'
GO
ALTER DATABASE [Freddo] SET QUERY_STORE = OFF
GO
USE [Freddo]
GO
/****** Object:  User [alumno]    Script Date: 1/12/2022 15:38:32 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Envase]    Script Date: 1/12/2022 15:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Envase](
	[IdEnvase] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](500) NOT NULL,
	[Precio] [int] NOT NULL,
 CONSTRAINT [PK_Envase] PRIMARY KEY CLUSTERED 
(
	[IdEnvase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gustos]    Script Date: 1/12/2022 15:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gustos](
	[IdGustos] [int] IDENTITY(1,1) NOT NULL,
	[Foto] [varchar](500) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Gustos] PRIMARY KEY CLUSTERED 
(
	[IdGustos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GustosPedidos]    Script Date: 1/12/2022 15:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GustosPedidos](
	[IdPedidos] [int] NOT NULL,
	[IdGustos] [int] NOT NULL,
	[IdGustosPedidos] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_GustosPedidos_1] PRIMARY KEY CLUSTERED 
(
	[IdGustosPedidos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetodoDePago]    Script Date: 1/12/2022 15:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodoDePago](
	[IdMetodoDePago] [int] IDENTITY(1,1) NOT NULL,
	[Metodo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MetodeDePago] PRIMARY KEY CLUSTERED 
(
	[IdMetodoDePago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 1/12/2022 15:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[IdPedidos] [int] IDENTITY(1,1) NOT NULL,
	[IdEnvase] [int] NOT NULL,
	[IdMetodoDePago] [int] NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[IdPedidos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Envase] ON 

INSERT [dbo].[Envase] ([IdEnvase], [Nombre], [Foto], [Precio]) VALUES (1, N'Kilo', N'https://http2.mlstatic.com/D_NQ_NP_799947-MLA50013914408_052022-V.jpg', 1700)
INSERT [dbo].[Envase] ([IdEnvase], [Nombre], [Foto], [Precio]) VALUES (2, N'Medio', N'https://www.polinorte.com/wp-content/uploads/2020/08/POTE-2.jpeg', 1000)
INSERT [dbo].[Envase] ([IdEnvase], [Nombre], [Foto], [Precio]) VALUES (3, N'Cuarto', N'https://cdn.shopify.com/s/files/1/0120/0809/5840/products/Termico-Helado-3.jpg?v=1646765363', 700)
INSERT [dbo].[Envase] ([IdEnvase], [Nombre], [Foto], [Precio]) VALUES (4, N'Cucurucho', N'https://media.istockphoto.com/photos/empty-ice-cream-cone-isolated-on-white-background-picture-id888444806?k=20&m=888444806&s=170667a&w=0&h=6YO3r0VebalcevWcOvGZISNozlewfGJvR4vX1733roo=', 600)
INSERT [dbo].[Envase] ([IdEnvase], [Nombre], [Foto], [Precio]) VALUES (5, N'Vaso chico', N'https://http2.mlstatic.com/D_NQ_NP_648314-MLA51988499474_102022-V.jpg', 450)
INSERT [dbo].[Envase] ([IdEnvase], [Nombre], [Foto], [Precio]) VALUES (6, N'Vaso grande', N'https://http2.mlstatic.com/D_NQ_NP_610183-MLA49023605260_022022-O.webp', 500)
INSERT [dbo].[Envase] ([IdEnvase], [Nombre], [Foto], [Precio]) VALUES (7, N'Milkshake', N'https://http2.mlstatic.com/D_NQ_NP_796853-MLA31580614474_072019-O.webp', 600)
INSERT [dbo].[Envase] ([IdEnvase], [Nombre], [Foto], [Precio]) VALUES (8, N'Cucurucho con dos bochas', N'https://http2.mlstatic.com/D_NQ_NP_870960-MLA47588535887_092021-O.webp', 400)
SET IDENTITY_INSERT [dbo].[Envase] OFF
GO
SET IDENTITY_INSERT [dbo].[Gustos] ON 

INSERT [dbo].[Gustos] ([IdGustos], [Foto], [Nombre]) VALUES (1, N'https://todoinfantil.com/img/recetas/Helado%20de%20frutillas.jpg', N'Frutilla al agua')
INSERT [dbo].[Gustos] ([IdGustos], [Foto], [Nombre]) VALUES (2, N'https://images.hola.com/imagenes/cocina/recetas/20200212160473/helado-chocolate-facil/0-782-495/helado-chocolate-m.jpg', N'Chocolate')
INSERT [dbo].[Gustos] ([IdGustos], [Foto], [Nombre]) VALUES (4, N'https://cdn2.cocinadelirante.com/sites/default/files/styles/gallerie/public/images/2020/03/helado-saludable-de-pay-de-limon.jpg', N'Limon')
INSERT [dbo].[Gustos] ([IdGustos], [Foto], [Nombre]) VALUES (5, N'https://media.sanjuan8.com/p/0ac346515caf8920864c67b39b9a1adf/adjuntos/303/imagenes/008/946/0008946899/1200x675/smart/helado-crema-americanajpg.jpg', N'Crema Americana')
INSERT [dbo].[Gustos] ([IdGustos], [Foto], [Nombre]) VALUES (6, N'https://placeralplato.com/files/2015/08/helado-de-dulce-de-leche-640x480.jpg?width=1200&enable=upscale', N'Dulce de leche')
INSERT [dbo].[Gustos] ([IdGustos], [Foto], [Nombre]) VALUES (7, N'https://cdn.bioguia.com/embed/b402df0c395f279360d4b3c049fa4a9df845021524318971/Helado_de_maracuya_casero', N'Maracuya')
INSERT [dbo].[Gustos] ([IdGustos], [Foto], [Nombre]) VALUES (11, N'https://www.pequerecetas.com/wp-content/uploads/2016/08/helado-de-oreo-receta.jpg', N'Crema oreo')
INSERT [dbo].[Gustos] ([IdGustos], [Foto], [Nombre]) VALUES (13, N'https://4.bp.blogspot.com/-tCx9s--cPhE/Wx_QT8tnUWI/AAAAAAABOxs/QVcfdrzpdhYw_0tZwZJp8GLM8TmkNmlKACLcBGAs/w680/IMG_7158%2B%2528Copiar%2529.JPG', N'Kinder')
INSERT [dbo].[Gustos] ([IdGustos], [Foto], [Nombre]) VALUES (14, N'https://t1.rg.ltmcdn.com/es/posts/2/4/4/helado_de_melon_23442_600_square.jpg', N'Melon')
INSERT [dbo].[Gustos] ([IdGustos], [Foto], [Nombre]) VALUES (15, N'https://estaticos-cdn.prensaiberica.es/clip/8e6e45c5-d3cc-423c-9442-5c3a74048892_16-9-aspect-ratio_default_0.jpg', N'Pistacho')
INSERT [dbo].[Gustos] ([IdGustos], [Foto], [Nombre]) VALUES (19, N'https://recetinas.com/wp-content/uploads/2018/08/helado-de-vainilla.jpg', N'Vainilla')
INSERT [dbo].[Gustos] ([IdGustos], [Foto], [Nombre]) VALUES (20, N'https://es.cravingsjournal.com/wp-content/uploads/2021/02/helado-de-banana-split-9.jpg', N'Banana split')
SET IDENTITY_INSERT [dbo].[Gustos] OFF
GO
SET IDENTITY_INSERT [dbo].[GustosPedidos] ON 

INSERT [dbo].[GustosPedidos] ([IdPedidos], [IdGustos], [IdGustosPedidos]) VALUES (2, 2, 11)
INSERT [dbo].[GustosPedidos] ([IdPedidos], [IdGustos], [IdGustosPedidos]) VALUES (2, 1, 13)
INSERT [dbo].[GustosPedidos] ([IdPedidos], [IdGustos], [IdGustosPedidos]) VALUES (2, 2, 14)
INSERT [dbo].[GustosPedidos] ([IdPedidos], [IdGustos], [IdGustosPedidos]) VALUES (20, 1, 15)
INSERT [dbo].[GustosPedidos] ([IdPedidos], [IdGustos], [IdGustosPedidos]) VALUES (20, 2, 16)
SET IDENTITY_INSERT [dbo].[GustosPedidos] OFF
GO
SET IDENTITY_INSERT [dbo].[MetodoDePago] ON 

INSERT [dbo].[MetodoDePago] ([IdMetodoDePago], [Metodo]) VALUES (1, N'Efectivo')
INSERT [dbo].[MetodoDePago] ([IdMetodoDePago], [Metodo]) VALUES (2, N'Transfernecia')
INSERT [dbo].[MetodoDePago] ([IdMetodoDePago], [Metodo]) VALUES (3, N'Tarjeta de credito')
INSERT [dbo].[MetodoDePago] ([IdMetodoDePago], [Metodo]) VALUES (4, N'Tarjera de debito')
INSERT [dbo].[MetodoDePago] ([IdMetodoDePago], [Metodo]) VALUES (5, N'Mercado Pago')
SET IDENTITY_INSERT [dbo].[MetodoDePago] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedidos] ON 

INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (2, 6, 3)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (3, 6, 3)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (4, 3, 1)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (5, 8, 3)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (6, 3, 2)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (7, 1, 3)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (8, 1, 3)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (9, 1, 3)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (10, 1, 3)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (11, 1, 3)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (12, 1, 3)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (13, 1, 3)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (14, 1, 3)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (15, 7, 3)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (16, 6, 2)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (17, 6, 2)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (18, 1, 1)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (19, 1, 1)
INSERT [dbo].[Pedidos] ([IdPedidos], [IdEnvase], [IdMetodoDePago]) VALUES (20, 2, 2)
SET IDENTITY_INSERT [dbo].[Pedidos] OFF
GO
ALTER TABLE [dbo].[GustosPedidos]  WITH CHECK ADD  CONSTRAINT [FK_GustosPedidos_Gustos1] FOREIGN KEY([IdGustos])
REFERENCES [dbo].[Gustos] ([IdGustos])
GO
ALTER TABLE [dbo].[GustosPedidos] CHECK CONSTRAINT [FK_GustosPedidos_Gustos1]
GO
ALTER TABLE [dbo].[GustosPedidos]  WITH CHECK ADD  CONSTRAINT [FK_GustosPedidos_Pedidos] FOREIGN KEY([IdPedidos])
REFERENCES [dbo].[Pedidos] ([IdPedidos])
GO
ALTER TABLE [dbo].[GustosPedidos] CHECK CONSTRAINT [FK_GustosPedidos_Pedidos]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Envase] FOREIGN KEY([IdEnvase])
REFERENCES [dbo].[Envase] ([IdEnvase])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Envase]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_MetodoDePago1] FOREIGN KEY([IdMetodoDePago])
REFERENCES [dbo].[MetodoDePago] ([IdMetodoDePago])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_MetodoDePago1]
GO
USE [master]
GO
ALTER DATABASE [Freddo] SET  READ_WRITE 
GO
