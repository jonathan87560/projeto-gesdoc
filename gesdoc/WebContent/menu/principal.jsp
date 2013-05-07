<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gesdoc</title>
<script language="JavaScript1.3" src="javascript/euDock.2.0.js"></script>
<script language="JavaScript1.3" src="javascript/euDock.Image.js"></script>
</head>
<body>
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
</body>
</html>