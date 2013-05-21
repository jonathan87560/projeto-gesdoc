<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gesdoc - Gestão Documental</title>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen, projection" />
 <!--[if lte IE 6]><link rel="stylesheet" href="style_ie.css" type="text/css" media="screen, projection" /><![endif]-->
    <link href="windows8/Style/Interacao.css" rel="stylesheet" type="text/css" />
    <link href="windows8/Style/jq-metro.css" rel="stylesheet" type="text/css" />
    <script src="windows8/Style/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="windows8/Script/jquery.metro-btn.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#metrobuttons").AddMetroSimpleButton('bt1', 'metro-vermelho', 'windows8/Style/Imagem/carta.png', 'Centro de Custo', '#');
            $("#metrobuttons").AddMetroSimpleButton('bt2', 'metro-verde', 'windows8/Style/Imagem/carta.png', 'Departamento', '#');
            $("#metrobuttons").AddMetroDoubleButton('bt3', 'metro-azul', 'windows8/Style/Imagem/admin.png', 'Empresa Coligada', '#');

            $("#metrobuttons2").AddMetroSimpleButton('bt4', 'metro-azul', 'windows8/Style/Imagem/carta.png', 'Departamento Coligado', '#');
            $("#metrobuttons2").AddMetroSimpleButton('bt5', 'metro-laranja', 'windows8/Style/Imagem/carta.png', 'Documento', '#');
        });
    </script>
</head>
<body>
<div id="wrapper">
 <header id="header">
 </header><!-- #header-->

	<section id="middle">

		<div id="container">
			<div id="content">
				<strong>Content:</strong> Sed placerat accumsan ligula. Aliquam felis magna, congue quis, tempus eu, aliquam vitae, ante. 
				Cras neque justo, ultrices at, rhoncus a, facilisis eget, nisl. Quisque vitae pede. Nam et augue. Sed a elit. 
				Ut vel massa. Suspendisse nibh pede, ultrices vitae, ultrices nec, mollis non, nibh. In sit amet pede quis leo 
				vulputate hendrerit. Cras laoreet leo et justo auctor condimentum. Integer id enim. Suspendisse egestas,
				dui ac egestas mollis, libero orci hendrerit lacus, et malesuada lorem neque ac libero. Morbi tempor pulvinar pede. 
				Donec vel elit.
			</div><!-- #content-->
		</div><!-- #container-->

		<aside id="sideLeft">
		    <div id="metrobuttons" class="metro-panel"></div>
    		<div id="metrobuttons2" class="metro-panel"></div>
    	 </br>	
		</aside><!-- #sideLeft -->

		<aside id="sideRight">
			<center>Funções</center>
		</aside><!-- #sideRight -->

	</section><!-- #middle-->


 <footer id="footer">
 </footer><!-- #footer -->
  
</div><!-- #wrapper -->
</body>
</html>