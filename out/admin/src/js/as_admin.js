// TODO: FadeinLoader
// TODO: LISTITEM OPENS NEW WINDOW
//

var asdesktopwindow = '<div id="window_title" class="abs window"><div class="abs window_inner"><div class="window_top"><span class="float_left"><img src="assets/images/icons/icon_16_computer.png" />titletext</span><span class="float_right"><a href="#" class="window_min"></a><a href="#" class="window_resize"></a><a href="#icon_dock_title" class="window_close"></a></span></div><div class="abs window_content"></div></div><span class="abs ui-resizable-handle ui-resizable-se"></span></div>';
var asbotombardock = '<li id="icon_dock_title"><a href="#window_title"><img src="assets/images/icons/icon_22_computer.png" />titletext</a></li>';
var inwindowloader = '<div class="loader">load</div>';

var mastoken = $('#mystoken').attr('value');

// Load Div Elements in Window
function loadindiv(actid,target,link){
    $('#window_'+actid+ ' .window_content').append(inwindowloader);
    $('#window_'+actid+' .window_content .window_'+target).load('./index.php?cl='+link+'&stoken='+mastoken, function() {
        $('#window_'+actid+' .loader').remove();
    });
}

$(document).ready(function() {

   // Main Menu Click
    $('.openwindow').click(function() {
        var myfncclass = $(this).attr("target");
        var myfasid = $(this).attr("asid");
        var mytitle = $(this).attr("title");

        if ($('#window_'+myfncclass).length == 0) {
            var newwindow = asdesktopwindow.replace(/titletext/ig,mytitle);
            var newwindow = newwindow.replace(/title/ig,myfncclass);
            var newbottom = asbotombardock.replace(/titletext/ig,mytitle);
            var newbottom = newbottom.replace(/title/ig,myfncclass);
            $('#desktop').append(newwindow);
            $('#bar_bottom').append(newbottom);
            //$('#window_'+myfncclass+' .window_content .window_aside').load('./index.php?cl='+myfncclass+'_list&stoken='+myfasid);
            $('#window_'+myfncclass+' .window_content').load('./index.php?cl='+myfncclass+'&stoken='+mastoken);
            $('#window_'+myfncclass).show();
            $('#icon_dock_'+myfncclass).show();
        } else {
            $('#window_'+myfncclass).show();
            $('#icon_dock_'+myfncclass).show();
        }
    });

    //FORM Submit
    //TODO: Show Loader
    $('form').live('submit',function() {
        mywindow = $(this).closest('.window').attr('id');
        //alert('window:'+mywindow+' Data:'+$(this).serialize());
        $('#window_'+mywindow+ ' .window_content').append(inwindowloader);
        $.ajax({ 	// create an AJAX call...
            data: $(this).serialize(), // get the form data
            type: $(this).attr('method'), // GET or POST
            url: $(this).attr('action'), // the file to call
            success: function(response) { // on success..
                //alert($(this).attr('action'));
                //alert('test:');
                $('#window_'+mywindow+' .loader').remove();
                $('#'+mywindow+' .window_main').html(response); // update the DIV - should I use the DIV id?
            }
        });
        if (typeof listupdate != 'undefined') {
            if (listupdate == 1) {
                //alert('test');
                $('#window_'+listwinnameup+ ' .window_content').append(inwindowloader);
                $('#window_'+listwinnameup+' .window_main').load(myselfl+'cl='+listwinnameup, function(status) {
                    //alert(myselfl+'cl='+listwinnameup);
                    $('#window_'+listwinnameup+' .loader').remove();
                });
            }
        }
        return false;
    });

    // LIST ITEM OPENS NEW WINDOW
    $('.openinnewwin').live('click', function() {
        mywindow = $(this).closest('.window').attr('id');
        mytext = $('#'+mywindow+' .float_left').html();
        alert('asd'+mytext);
        mywindow = mywindow.replace('window_','');
        myrel = $(this).attr('rel');
        myrel = myrel.split(',');
        myid = myrel[0];
        myloadid = myrel[0];
        myid = myid.replace('.','');
        mytitle = myrel[1];
        myvalue = myrel[2];
        asdesktopwindow

        var newwindow = asdesktopwindow.replace(/titletext/ig,mytitle);
        var newwindow = newwindow.replace(/mywindow/ig,myid);
        var newbottom = asbotombardock.replace(/titletext/ig,mytitle);
        var newbottom = newbottom.replace(/mywindow/ig,myid);



      //  newwindow = '<div id="window_'+mywindow+'_list_'+myid+'" class="abs window ui-draggable ui-resizable" name="edit_'+mywindow+'_list_'+myid+'" style="display: block;"><div class="abs window_inner"><div class="window_top"><span class="float_left">'+mytext+' - '+mytitle+'</span><span class="float_right"><a class="window_min" href="#"></a><a class="window_resize" href="#"></a><a class="exit_window" href="#icon_dock_'+mywindow+'"></a></span></div><div class="abs window_content"><div class="window_aside"></div><div class="window_main"></div></div><div class="loaderinwindow"><div><p>LADEN...</p><img src="'+myressourcel+'images/gui/loader.gif" /></div></div><div class="abs window_bottom"></div></div><span class="abs ui-resizable-handle ui-resizable-se"></span></div></div>';
        newwintask = '<li id="icon_dock_'+mywindow+'_list_'+myid+'" style="display: list-item;"><a href="#window_'+mywindow+'_list_'+myid+'">'+mytitle+'</a></li>';
        $('#desktop').append(newwindow);
        $('#bar_bottom #dock').append(newwintask);
        curshopadmin = $('#window_'+mywindow+' #cadminshop').val();
        JQD.util.window_flat();
        $('#window_'+mywindow+'_list_'+myid).addClass('window_stack').show();
        $('#window_'+mywindow+'_list_'+myid+' .loaderinwindow').fadeIn('slow');
        if (myvalue != null) {
            //alert('1');
            var mysidemenu_listitem = $('#window_'+mywindow+' .list .editwinmenu').html();
            mycorrectwindowname = mywindow.replace('admin_','');
            $('#window_'+mywindow+'_list_'+myid+' .window_main').load(myselfl+'&cl='+mycorrectwindowname+'_main&oxid='+myloadid, function(status) {
                //alert('status'+status);
                $('#window_'+mywindow+'_list_'+myid+' .window_aside').html(mysidemenu_listitem+'<input type="hidden" name="window" value="window_'+mywindow+'_list_'+myid+'" />');

                $('#window_'+mywindow+'_list_'+myid+' .window_aside .window_menupart a').each(function (i) {
                    var myattr = $(this).attr('href');
                    $(this).attr('href', myattr+','+myloadid) ;
                });


                $('#window_'+mywindow+'_list_'+myid+' .loaderinwindow').fadeOut('slow');
            });
        }
        else {
            alert('2');
            $('#window_'+mywindow+'_list_'+myid+' .window_main').load(myselfl+'&cl='+mywindow+'_main&oxid='+myloadid, function(status) {
                $('#window_'+mywindow+'_list_'+myid+' .window_aside').append('<input type="hidden" name="window" value="window_'+mywindow+'_list_'+myid+'" />');
                $('#window_'+mywindow+'_list_'+myid+' .loaderinwindow').fadeOut('slow');
            });
        }
        //alert('myid:'+myid+' win:'+mywindow);
    });


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