/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//funcio permite que retorne solo numeros al textbox en cuestion
function validarNum(e){
	var key = window.Event ? e.which : e.keyCode
	return (key >= 48 && key <= 57) ||(key==8)
}

