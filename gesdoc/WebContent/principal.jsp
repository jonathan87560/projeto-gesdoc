<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gesdoc - Gestão Documental</title>
<link rel="stylesheet" href="style.css" type="text/css" media="screen, projection" />
<!--[if lte IE 6]><link rel="stylesheet" href="style_ie.css" type="text/css" media="screen, projection" /><![endif]-->
<script language="JavaScript1.3" src="javascript/euDock.2.0.js"></script>
<script language="JavaScript1.3" src="javascript/euDock.Image.js"></script>
</head>
<body>
<div id="wrapper">
 <header id="header">
 <script>
   euEnv.imageBasePath="javascript/";

   var dock = new euDock();
   
   dock.setBar({
        left      :{euImage:{image:"imagens/dockBg-l.png"}},
        horizontal:{euImage:{image:"imagens/dockBg-c-o.gif"}},
        right     :{euImage:{image:"imagens/dockBg-r.png"}}
   	});
   
   dock.setIconsOffset(2);
   dock.setScreenAlign(euUP,0);
   dock.addIcon(new Array({euImage:{image:"imagens/2143_128x128.png"}}),
		        {link:"http://eudock.jules.it"});
   dock.addIcon(new Array({euImage:{image:"imagens/2526_128x128.png"}}));
   dock.addIcon(new Array({euImage:{image:"imagens/6965_128x128.png"}}));
   dock.addIcon(new Array({euImage:{image:"imagens/cube.png"}}));
   dock.addIcon(new Array({euImage:{image:"imagens/cube.png"}}));
   dock.addIcon(new Array({euImage:{image:"imagens/cube.png"}}));
   dock.addIcon(new Array({euImage:{image:"imagens/cube.png"}}));
   dock.addIcon(new Array({euImage:{image:"imagens/cube.png"}}));
   dock.addIcon(new Array({euImage:{image:"imagens/cube.png"}}));
   dock.addIcon(new Array({euImage:{image:"imagens/cube.png"}}));
 </script>
 </header><!-- #header-->

	<section id="middle">

		<div id="container">
			<div id="content">
				<strong>Content:</strong> Sed placerat accumsan ligula. Aliquam felis magna, congue quis, tempus eu, aliquam vitae, ante. Cras neque justo, ultrices at, rhoncus a, facilisis eget, nisl. Quisque vitae pede. Nam et augue. Sed a elit. Ut vel massa. Suspendisse nibh pede, ultrices vitae, ultrices nec, mollis non, nibh. In sit amet pede quis leo vulputate hendrerit. Cras laoreet leo et justo auctor condimentum. Integer id enim. Suspendisse egestas, dui ac egestas mollis, libero orci hendrerit lacus, et malesuada lorem neque ac libero. Morbi tempor pulvinar pede. Donec vel elit.
			</div><!-- #content-->
		</div><!-- #container-->

		<aside id="sideLeft">
		 <center>SubMenu</center>
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