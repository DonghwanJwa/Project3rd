/**
 *  inquire.jsp inquire.css
 */

function selectchange(obj) {

    f = document.forms.select_list;

    if(obj == 1) {
    
        f.listsub.style.display = "";
        

    } else {

        f.listsub.style.display = "none";
        
     }
}