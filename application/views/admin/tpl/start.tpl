<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
    <head>
        <title>[{ oxmultilang ident="GENERAL_ADMIN_TITLE" }]</title>
        <link rel="shortcut icon" href="[{$oViewConf->getImageUrl()}]favicon.ico">

        <!--[if lt IE 7]>
        <script>
            window.top.location = 'http://desktop.sonspring.com/ie.html';
        </script>
        <![endif]-->
        <link rel="stylesheet" href="[{$oViewConf->getResourceUrl()}]css/reset.css" />
        <link rel="stylesheet" href="[{$oViewConf->getResourceUrl()}]css/desktop.css" />
        <!--[if lt IE 9]>
        <link rel="stylesheet" href="[{$oViewConf->getResourceUrl()}]css/ie.css" />
        <![endif]-->
        <script type="text/javascript" src="[{$oViewConf->getResourceUrl()}]oxid.js"></script>
    </head>
    <body>
        <div class="abs" id="wrapper">
            <div class="abs" id="desktop"></div>
            <div class="abs" id="bar_top">
                <span class="float_right">
                    [{if $oView->isMall() }]
                          <form name="search" id="search" action="[{ $oViewConf->getSelfLink() }]" method="post">
                              [{ $oViewConf->getHiddenSid() }]
                              <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                              <input type="hidden" name="item" value="navigation.tpl">
                              <input type="hidden" name="fnc" value="chshp">
                              <select id="selectshop" class="folderselect" onChange="selectShop( this.value );">
                                  [{foreach from=$shoplist item=oShop}]
                                  <option value="[{ $oShop->oxshops__oxid->value|default:$oViewConf->getActiveShopId() }]" [{ if $oViewConf->getActiveShopId() == $oShop->oxshops__oxid->value|default:$oViewConf->getActiveShopId() }]SELECTED[{/if}] >[{$oShop->oxshops__oxname->value|default:$actshop}]</option>
                                  [{/foreach}]
                              </select>
                          </form>
                    [{/if}]
                    [{$oView->getShopFullEdition()}] [{$oView->getShopVersion()}]
                </span>
                [{assign var="oConfig" value=$oViewConf->getConfig()}]
                <ul>
                    <li>
                        <a class="menu_trigger" href="#">[{ oxmultilang ident="NAVIGATION_HOME" }]</a>
                        <ul class="menu">
                            <li>
                                <a href="[{$oViewConf->getSelfLink()}]&cl=navigation&amp;item=home.tpl" >[{ oxmultilang ident="NAVIGATION_HOME" }]</a>
                            </li>
                            <li>
                                <a href="[{$oConfig->getShopURL()}]">[{ oxmultilang ident="NAVIGATION_SHOPFRONT" }]</a>
                            </li>
                            <li>
                                <a href="[{$oViewConf->getSelfLink()}]&cl=navigation&amp;fnc=logout">[{ oxmultilang ident="NAVIGATION_LOGOUT" }]</a>
                            </li>
                        </ul>
                    </li>

                    [{include file="navigation.tpl"}]


                </ul>

            </div>
            <div class="abs" id="bar_bottom">
                <a class="float_left" href="#" id="show_desktop" title="Show Desktop">
                    <img src="[{$oViewConf->getResourceUrl()}]img/icons/icon_22_desktop.png" />
                </a>

            </div>
        </div>

       <!--
        <frameset rows="54,*" border="0">
            <frame src="[{$oViewConf->getSelfLink()}]&cl=navigation&item=header.tpl" name="header" id="header" frameborder="0" scrolling="No" noresize marginwidth="0" marginheight="0">
            <frameset  cols="200,*" border="0">
                <frame src="[{$oViewConf->getSelfLink()}]&cl=navigation" name="navigation" id="navigation" frameborder="0" scrolling="Auto" noresize marginwidth="0" marginheight="0">
                <frame src="[{$oViewConf->getSelfLink()}]&cl=navigation&item=home.tpl" name="basefrm" id="basefrm" frameborder="0" scrolling="Auto" noresize marginwidth="0" marginheight="0">
            </frameset>
        </frameset>
        -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>
       [{*<script src="[{$oViewConf->getResourceUrl()}]js/jquery.js"></script>
       <script src="[{$oViewConf->getResourceUrl()}]js/jquery-ui.js"></script>*}]
       <script>
           !window.jQuery && document.write(unescape('%3Cscript src="assets/js/jquery.js"%3E%3C/script%3E'));
           !window.jQuery.ui && document.write(unescape('%3Cscript src="assets/js/jquery.ui.js"%3E%3C/script%3E'));
       </script>
       <script src="[{$oViewConf->getResourceUrl()}]js/jquery.desktop.js"></script>
       <script src="[{$oViewConf->getResourceUrl()}]js/as_admin.js"></script>

   </body>
</html>