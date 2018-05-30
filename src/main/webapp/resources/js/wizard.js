/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function wizard(id){
    switch(id){
        case 'b1':{
             change("s2", "a2", "a1");
                break;
        }
        case 'b2' :{
                if(verifier("tab_2")){
                    change("s3", "a3", "a2");
                }
               break; 
        }
        case 'b3' :{
                if(verifier("tab_3")){
                   change("s4", "a4", "a3");
                }
               break; 
        }
        case 'b4' :{
                if(verifier("tab_4")){
                   change("s5", "a5", "a4");
                }
               break; 
        } 
        case 'b5' :{
               if(verifier("tab_5")){
                   setValue();
                   change("s6", "a6", "a5");
                   
                }
               break; 
        } 
        default :{
              alert("default");
              break;
        }  
    }           
}

function precedent(id){
    switch(id){
        case 'ba2':{
             change("s1", "a1", "a2");
             break;
        }
        case 'ba3' :{
                change("s2", "a2", "a3");
                break; 
        }
        case 'ba4' :{
              change("s3", "a3", "a4");
              break; 
        }
        case 'ba5' :{
               change("s4", "a4", "a5");
               break; 
        } 
        case 'ba6' :{
             change("s5", "a5", "a6");
             break; 
        } 
        default :{
              alert("default");
              break;
        }  
    }
}

function change(btn, nv, ancien){
    document.getElementById(ancien).parentNode.className="";
    document.getElementById(nv).parentNode.className="active";
    document.getElementById(btn).click();
}

function verifier(root){
    
    var elControls = document.getElementById(root).getElementsByClassName("wcontrol");
    var t = elControls.length;
    var emailRegex;
    var check = true;
    //return true;
    //alert(elControls[1].value.trim());
    for(var i=0; i < t; i++){
        
        if(!(elControls[i].style.display==="none")){
        
        if(elControls[i].value==""){
            elControls[i].style.borderColor="red";
            check=false;
        }else{
            elControls[i].style.borderColor="";
        }
    if(elControls[i].className.indexOf("mail") != -1){
            if(!checkMail(elControls[i].value)){
                elControls[i].style.borderColor="red";
            check=false;
            }
        }
        
        
        }else{
             elControls[i].style.borderColor="";
        }
    }
    return check;
}

function setDisable(cl, value){
     var el = document.getElementsByClassName(cl);
     var t = el.length;
     
     //if(value.tagName.toLowerCase()== "")
        // alert(value.tagName);
         
         if(value.tagName == "INPUT"){
             if(value.value==="oui"){
                for (var i=0; i < t; i++){
                    el[i].style.display="";
                }
             }else{
                for (var i=0; i < t; i++){
                    el[i].value="";
                    el[i].style.display="none";
         
                }
             }
         }else if(value.tagName == "SELECT"){
             if(value.value==="CMR"){
                 for (var i=0; i < t; i++){
                    el[i].style.display="";
                }
             }else{
                 for (var i=0; i < t; i++){
                    el[i].value="";
                    el[i].style.display="none";
         
                }
             }
         }
     
     
}

function setValue(){
    var recapValues = document.getElementsByClassName("recap");
    var wValues = document.getElementsByClassName("wcontrol");
    var tr = recapValues.length;
    var t = wValues.length;
    for(var i=0, j=0; i<tr && j<t; i++, j++){
        
        if(wValues[j].tagName.toLowerCase()==="table"){
            
            var el= wValues[j].getElementsByTagName("input");
            for(var k = 0; k<el.length; k++){
                
                if(el[k].checked){
                    recapValues[i].innerHTML = el[k].value;
                } 
            }
        }else if(wValues[j].tagName.toLowerCase() === "select"){
            var s= wValues[j];
            if(s.selectedIndex != -1){
                recapValues[i].innerHTML = s[s.selectedIndex].innerHTML;
            }
            
        }else{
            recapValues[i].innerHTML =wValues[j].value;
        }
        
    }
}


(function (){
    
    var nat = document.getElementById("todoForm:nationalite");
    var taf = document.getElementById("todoForm:taf:1");
    var spCom = document.getElementById("todoForm:sportCom:1");
    var handic = document.getElementById("todoForm:handicap:1");
    setDisable("paysD", nat);
    if(taf.checked){
        setDisable("travailD", taf);
    }
    
    if(spCom.checked){
        setDisable("sportD", spCom);
    }
    
    if(handic.checked){
        setDisable("handicapD", handic);
    }
    if(document.getElementById("todoForm:terminer") == null){
        document.getElementById("todoForm:l7").style.display="";
        setValue();
        change("s6", "a6", "a1");
    }
    
    var inputs = document.getElementsByTagName("input");
    var t = inputs.length;
    for(var i=0; i<t; i++){
        if(inputs[i].type=="text" || inputs[i].type=="password" || inputs[i].type=="email"){
            inputs[i].onkeydown= function(e){
                if(e.keyCode==13){
                   // alert("Soumission du formulaire blocker by Darkst !!!")
                    return false;
                }
            }
        }
    }
    
    
    
    
})();

function trait(data) {
    var status = data.status; // Can be "begin", "complete" or "success".
    var source = data.source; // The parent HTML DOM element.

    switch (status) {
        case "begin": // Before the ajax request is sent.
            showImage();
            break;

        case "complete": // After the ajax response is arrived.
            hideImage();
            break;

        case "success": // After update of HTML DOM based on ajax response.
            // ...
            break;
    }

}

function showImage(){
    document.getElementById("todoForm:loader").style.display="";
}

function hideImage(){
    document.getElementById("todoForm:loader").style.display="none";
    document.getElementById("todoForm:terminer").style.display="none";
    document.getElementById("todoForm:l7").style.display="";
}

function checked(){
    var ch =  document.getElementById("confirmation").checked;
    if(!ch){
        alert("Veuiller confirmer vos informations avant de soumettre");
        return false;
    }
}


function checkMail(mail){
    var emailRegex = /^([a-z0-9A-Z._-]+)@([a-z0-9._-]+)\.([a-z]{2,6})$/;
    return emailRegex.test(mail);
}