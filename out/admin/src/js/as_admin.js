var asdesktopwindow = '<div id="window_title" class="abs window"><div class="abs window_inner"><div class="window_top"><span class="float_left"><img src="assets/images/icons/icon_16_computer.png" />title</span><span class="float_right"><a href="#" class="window_min"></a><a href="#" class="window_resize"></a><a href="#icon_dock_title" class="window_close"></a></span></div><div class="abs window_content"></div><span class="abs ui-resizable-handle ui-resizable-se"></span></div>';
var asbotombardock = '<li id="icon_dock_title"><a href="#window_title"><img src="assets/images/icons/icon_22_computer.png" />title</a></li>';


$(document).ready(function() {

   // Main Menu Click
    $('.openwindow').click(function() {
        var myfncclass = $(this).attr("target");
        var myfasid = $(this).attr("asid");

        if ($('#window_'+myfncclass).length == 0) {
            var newwindow = asdesktopwindow.replace(/title/ig,myfncclass)
            var newbottom = asbotombardock.replace(/title/ig,myfncclass)
            $('#desktop').append(newwindow);
            $('#bar_bottom').append(newbottom);
            $('#window_'+myfncclass+' .window_content').load('index.php?cl='+myfncclass+'$force_admin_sid='+myfasid);
            $('#window_'+myfncclass).show();
            $('#icon_dock_'+myfncclass).show();
        } else {
            $('#window_'+myfncclass).show();
            $('#icon_dock_'+myfncclass).show();
        }
    });

    //Close Window

});

/*
 <div id="window_computer" class="abs window">
     <div class="abs window_inner">
        <div class="window_top">
            <span class="float_left">
                <img src="assets/images/icons/icon_16_computer.png" />
                Computer
            </span>
            <span class="float_right">
                <a href="#" class="window_min"></a>
                <a href="#" class="window_resize"></a>
                <a href="#icon_dock_computer" class="window_close"></a>
            </span>
        </div>
        <div class="abs window_content">
            <div class="window_aside">

            </div>

            <div class="window_main">

            </div>
        </div>
         <div class="abs window_bottom">
            Build: TK421
         </div>
     </div>
    <span class="abs ui-resizable-handle ui-resizable-se"></span>
 </div>
 */

/*
 <li id="icon_dock_computer">
 <a href="#window_computer">
 <img src="assets/images/icons/icon_22_computer.png" />
 Computer
 </a>
 </li>
 */