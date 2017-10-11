<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<?php
include ("bd.php");
hola papu
$caso=0;
if ($_POST['codigomineduc']!=""){
    $caso = 1; // el usuario ingreso grado y mineduc
  }
	else{ // el usuario no ingreso ningun campo
	  $caso = 2;
  }
  
 
  
echo '
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <title>IEBCE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" href="menu.css" rel="stylesheet" />
    <script type="text/javascript" src="jquery.js"></script>
	<script src="jquery3.js"></script>
	<script>
         $(document).ready(function() {
        $("#idBoton").click(function(){
       $(this).hide(); 
    }); });   </script>
  <link rel="shortcut icon" href="favicon.png">
</head>
<body class="blurBg-true" style="background-color:#555">

     <style type="text/css">
 body{color:#bbb;text-indent:10px;padding:10px 0 0 0; }
     #estilo{ margin:40px auto;width:80%;font:14px "Comic Sans MS",cursive;color:#bbb;text-indent:0px;
     padding:90px 0 0 0;}
	 #menu {top: 0%;margin: 0% 20% ;} 
	 #estilo a { color:#bbb; }
	 #estilo a:hover { color:#fff; }  
	 #copyright {width:80%;margin:10px auto;font:12px "Comic Sans MS",cursive;color:#bbb;text-indent:20px;
     padding:40px 0 0 0;}
  </style>


     
		  <div id="estilo" align="center">
  <link rel="stylesheet" href="formoid-biz-red.css" type="text/css" />
<script type="text/javascript" src="jquery.min.js"></script>';
 switch ($caso){
case 1: $where="codigomineduc LIKE '%$_POST[codigomineduc]%'"; break;  
 case 2: $where = "DEBE INGRESAR UN CRITERIO DE BUSQUEDA"; break;
  default: echo 'HAY UN ERROR...'; break;
}
if ($caso>0 and $caso<=1){
  $sql = "SELECT * FROM CONSULTA_NOTAS WHERE codigomineduc='" . $_POST['codigomineduc'] . "'";
  $link = Conectarse();
  $Res = mysqli_query($link, $sql);
 $v_num_filas = mysqli_num_rows($Res); //la funcion mysqli_num_rows devuelve el numero de filas devueltas por la consulta
  if ($v_num_filas == 1) { // un registro cumple con el criterio
    $row = mysqli_fetch_array ($Res); ?>
    <script language="JavaScript">
      window.open('ficha.php?codigomineduc=<?php echo $row['codigomineduc'];?> ','principal','');
    </script>
	<?php
    mysqli_close($link);
  }
   else{
    if ($v_num_filas > 1){
echo'
<html>
  <head></head>
  <body > 
 <form>
  <table border=1 align="center"  width= 600 >
  <tbody>      
	  <tr>
        <th scope="col"><span style="color:#000000"> Curso  </th>
        <th scope="col"><span style="color:#000000"> I Bimestre </th>
        <th scope="col"><span style="color:#000000"> II Bimestre</th>
        <th scope="col"><span style="color:#000000"> III Bimestre </th>
        <th scope="col"><span style="color:#000000"> IV Bimestre </th>
      </tr>';

while($row = mysqli_fetch_array ($Res)) {
echo '<tr align="center"><th scope="col"><span style="color:#000000">'.$row['NOMBRECURSO'].'</th>';
	if($row['1BIMESTRE']<60) {
		echo' <td align="center" ><span style="color:#FF0000">'.$row['1BIMESTRE'].'</td>';}
		else{ echo' <td align="center" ><span style="color:#000000"> '.$row['1BIMESTRE'].'</td>';}

	if($row['2BIMESTRE']<60){
		echo' <td align="center" ><span style="color:#FF0000">'.$row['2BIMESTRE'].'</td>';}
		else{ echo' <td align="center" ><span style="color:#000000"> '.$row['2BIMESTRE'].'</td>';}
		
	if($row['3BIMESTRES']<60){
		echo' <td align="center" ><span style="color:#FF0000">'.$row['3BIMESTRES'].'</td>';}
		else{ echo' <td align="center" ><span style="color:#000000"> '.$row['3BIMESTRES'].'</td>';}
		
	if($row['4BIMESTRE']<60){
		echo' <td align="center" ><span style="color:#FF0000">'.$row['4BIMESTRE'].'</td>';}
		else{ echo' <td align="center" ><span style="color:#000000"> '.$row['4BIMESTRE'].'</td>';}
	echo' </tr>';
}


  echo '
</tbody> 
    </table></div>
	
	<type="button" onclick="window.print();" value="Imprimir"  id="idBoton" />
	
	
	<a href="javascript:window.print(); void 0;">Imprimir</a>
	    </body>
      </html>';
 }
    else{ // ningun registro cumple con el criterio
      echo '<html>
              <head></head>
              <body>
			  <link rel="stylesheet" href="formoid-biz-red.css" type="text/css" />
				<script type="text/javascript" src="jquery.min.js"></script>
                <h2>La consulta no devolvi&oacute; ninguna coincidencia.</h2>
        <div id="copyright">Copyright &copy; 2015 Kendra Dayana Espina Miranda</div>
      
			  </body>
            </html>';
    }
  }
}
else{ // el usuario no ingreso un criterio de busqueda
echo '
<html>
  <head></head>
  <body>
    <h2>' . $where . '</h2>
	<div id="copyright">Copyright &copy; 2015 Kendra Dayana Espina Miranda</div>

  </body>
</html>';
}

?>