var script = document.createElement('script');
script.src = 'jquery-3.2.1.min.js';
document.getElementsByTagName('head')[0].appendChild(script); 



var num=6;  



$(document).ready(function(){
   $('#myModal').modal({backdrop: 'static', keyboard: false});
   setInterval(contador, 1000);
    function contador() {  
        num--;  
        if(num==0) location='index.jsp';  
        document.getElementById('seg').innerHTML=num;  
    }
    
    });

    
    
        
        