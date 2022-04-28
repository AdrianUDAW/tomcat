

//function seleccio(selecid) {
//	
//	document.querySelector("option[class='"+selecid+"']").setAttribute("hidden","hidden");
//	
//	console.log(document.getElementById("select2").getElementsByClassName(selecid));
//
//}





function reseteja() {
	
	for(var i = 1; i<7;i++) {
		
		$('option[class=' + i + ']').removeAttr("disabled");
		
//		document.getElementById(i).removeAttribute("hidden");
		
	}
	
	//document.getElementsByTagName("option").removeAttr("hidden");
	
}






/*
window.onload = function() {}

function preventDupes( select, index ) {
    var options = select.options,
        len = options.length;
    while( len-- ) {
        options[ len ].disabled = false;
    }
    select.options[ index ].disabled = true;
    if( index === select.selectedIndex ) {
        alert('Ja has seleccionat l\'item"' + select.options[index].text + '".\n\nSi us plau indiqueu-ne altre.');
        this.selectedIndex = 0;
    }
}

var select1 = select = document.getElementById( 'select1' );
var select2 = select = document.getElementById( 'select2' );

select1.onchange = function() {
    preventDupes.call(this, select2, this.selectedIndex );
};

select2.onchange = function() {
    preventDupes.call(this, select1, this.selectedIndex );
};
*/

