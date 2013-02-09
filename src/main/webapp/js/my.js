
$().ready(function() {
    $(this).toggleClass('ui-state-hover');
    // accounts table 
    $("#accounts th").each(function() {
        $(this).addClass("ui-state-default");
    });
    $("#accounts td").each(function() {
        $(this).addClass("ui-widget-content");
    });
    $("#accounts tr").hover(function() {
        $(this).children("td").addClass("ui-state-hover");
    }, function() {
        $(this).children("td").removeClass("ui-state-hover");
    });
   /* $("#accounts tr").click(function() {

        $(this).children("td").toggleClass("ui-state-highlight");
    });*/
    // payments table style
    $("#payments th").each(function() {
        $(this).addClass("ui-state-default");
    });
    $("#payments td").each(function() {
        $(this).addClass("ui-widget-content");
    });
    $("#payments tr").hover(function() {
        $(this).children("td").addClass("ui-state-hover");
    }, function() {
        $(this).children("td").removeClass("ui-state-hover");
    });
    
    $( "#header" ).toggleClass("ui-state-highlight");
    $( "#content" ).addClass("ui-widget-content");
    $( "#content" ).css("height", "100%");
	$( "#menu" ).menu();
	
	$( "#tabs" ).tabs();
	

});