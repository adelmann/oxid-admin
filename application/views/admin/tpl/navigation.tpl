[{assign var='mh' value=0 }]
[{foreach from=$menustructure item=menuholder }]
    [{if $menuholder->nodeType == XML_ELEMENT_NODE && $menuholder->childNodes->length }]
    [{assign var='mh' value=$mh+1 }]
    [{assign var='mn' value=0 }]
    <li>|</li>

        [{strip}]
        [{foreach from=$menuholder->childNodes item=menuitem name=menuloop }]
        [{assign var='actClass' value=$menuitem->childNodes->length }]
        [{if $menuitem->nodeType == XML_ELEMENT_NODE}]
        [{assign var='mn' value=$mn+1 }]
        [{assign var='sm' value=0 }]
        <li>
            [{if $menuitem->getAttribute('url')}]
            <a href="[{$menuitem->getAttribute('url')}]" onclick="_navAct(this);" class="rc" target="[{if $menuitem->getAttribute('target')}][{$menuitem->getAttribute('target')}][{else}]basefrm[{/if}]"><b>[{ oxmultilang ident=$menuitem->getAttribute('name')|default:$menuitem->getAttribute('id') noerror=true }]</b></a>
            [{elseif $menuitem->getAttribute('expand') == 'none'}]
            <a href="[{$menuitem->getAttribute('link')}]" onclick="_navAct(this);" target="basefrm" class="rc"><b>[{ oxmultilang ident=$menuitem->getAttribute('name')|default:$menuitem->getAttribute('id') noerror=true }]</b></a>
            [{else}]
            <a class="menu_trigger" href="#" href="#" onclick="_navExp(this);return false;" class="rc"><b>[{ oxmultilang ident=$menuitem->getAttribute('name')|default:$menuitem->getAttribute('id') noerror=true }]</b></a>
            [{/if}]

            [{if $menuitem->childNodes->length }]
            <ul class="menu">
                [{foreach from=$menuitem->childNodes item=submenuitem }]
                [{if $submenuitem->nodeType == XML_ELEMENT_NODE}]
                [{assign var='sm' value=$sm+1 }]
                [{if $submenuitem->getAttribute('linkicon')}] [{assign var='linkicon' value=$submenuitem->getAttribute('linkicon') }][{/if}]
                <li class="[{if $submenuitem->getAttribute('active')}]act[{assign var='sNavActId' value="nav-`$mh`-`$mn`-`$sm`" }][{/if}]" id="nav-[{$mh}]-[{$mn}]-[{$sm}]">
                    <a href="#" target="basefrm" link="[{if $submenuitem->getAttribute('url')}][{$submenuitem->getAttribute('url')}][{else}][{ $submenuitem->getAttribute('link') }][{/if}]">[{if $linkicon}]<span class="[{$linkicon}]">[{/if}][{ oxmultilang ident=$submenuitem->getAttribute('name')|default:$submenuitem->getAttribute('id') noerror=true }][{if $linkicon}]</span>[{/if}]</a>
                </li>
                [{assign var='linkicon' value='' }]
                [{/if}]
                [{/foreach}]
            </ul>
            [{/if}]
        </li>

        [{/if}]
        [{/foreach}]
        [{/strip}]

    [{/if}]
    [{/foreach}]

    [{strip}]
        [{assign var='mh' value=$mh+1 }]
        [{assign var='mn' value=1 }]
        [{assign var='sm' value=0 }]
        <li>
            <a class="menu_trigger" href="#">[{ oxmultilang ident=NAVIGATION_HISTORY noerror=true }]</a>
            <ul class="menu">
                <li><a href="[{ $oViewConf->getSelfLink() }]&cl=navigation&item=navigation.tpl&openHistory=1&[{$smarty.now}]#_hist"><b>[{ oxmultilang ident=NAVIGATION_HISTORY noerror=true }]</b></a></li>
                [{foreach from=$menuhistory item=submenuitem }]
                    [{if $submenuitem->nodeType == XML_ELEMENT_NODE}]
                        [{assign var='sm' value=$sm+1 }]
                        <li>
                            <a href="[{ $submenuitem->getAttribute('link') }]" onclick="_navAct(this);" target="basefrm" class="rc"><b>[{ oxmultilang ident=$submenuitem->getAttribute('name')|default:$submenuitem->getAttribute('id') noerror=true }]</b></a>
                        </li>
                    [{/if}]
                [{/foreach}]
            </ul>
        </li>
    [{/strip}]

    [{strip}]
        [{assign var='mh' value=$mh+1 }]
        [{assign var='mn' value=1 }]
        [{assign var='sm' value=0 }]
        <li>
            <a class="menu_trigger" href="#">[{ oxmultilang ident=NAVIGATION_FAVORITES noerror=true }]</a>
            <ul class="menu">
                <li><a class="ed" href="[{$oViewConf->getSelfLink()}]&cl=navigation&amp;item=favorites.tpl" target="basefrm" >[{ oxmultilang ident=NAVIGATION_FAVORITES_EDIT noerror=true }]</a></li>
                [{foreach from=$menufavorites item=submenuitem }]
                    [{if $submenuitem->nodeType == XML_ELEMENT_NODE}]
                        [{assign var='sm' value=$sm+1 }]
                        <li id="nav-[{$mh}]-[{$mn}]-[{$sm}]" class="">
                            <a href="[{ $submenuitem->getAttribute('link') }]" onclick="_navAct(this);" target="basefrm" class="rc"><b>[{ oxmultilang ident=$submenuitem->getAttribute('name')|default:$submenuitem->getAttribute('id') noerror=true }]</b></a>
                        </li>
                    [{/if}]
                [{/foreach}]
            </ul>

        </li>
    [{/strip}]