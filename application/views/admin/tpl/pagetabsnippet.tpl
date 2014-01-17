
[{assign var="_cnt" value="0"}]
[{foreach from=$editnavi item=edit}]
  [{if $edit->getAttribute('active') }]
    [{assign var="_act" value=$edit->getAttribute('id')}]
    [{assign var="_state" value="active"}]
  [{elseif $oxid == "-1"}]
    [{assign var="_state" value="disabled"}]
  [{else}]
    [{assign var="_state" value="inactive"}]
  [{/if}]

  [{if $_cnt == 0}]
    [{assign var="_state" value=$_state|cat:" first"}]
  [{/if}]

  [{if $_cnt == $editnavi->length -1 }]
    [{assign var="_state" value=$_state|cat:" last"}]
  [{/if}]

  [{ if $edit->getAttribute('external') == 'true' }]
    [{assign var="_action" value="ChangeExternal"}]
    [{assign var="_param1" value=$edit->getAttribute('location')}]
  [{else}]
    [{assign var="_action" value=$sEditAction|default:"top.oxid.admin.changeEditBar"}]
    [{assign var="_param1" value=$edit->getAttribute('cl')}]
  [{/if}]
   [{assign var="xploded" value=$_param1|explode:"_" }]


    <div class="r1">
          [{ if $oxid != "-1" || $noOXIDCheck }]
            <a href="#" onclick="loadindiv('[{$xploded[0]}]','main','[{$_param1}]');return false;">[{ oxmultilang ident=$edit->getAttribute('id') noerror=true}]</a>
          [{else}]
            [{ oxmultilang ident=$edit->getAttribute('id') noerror=true}]
          [{/if}]
          [{* loadindiv('shop','aside','shop_list'); *}]
      </div>


  [{assign var="_cnt" value=$_cnt+1 }]
[{/foreach}]
