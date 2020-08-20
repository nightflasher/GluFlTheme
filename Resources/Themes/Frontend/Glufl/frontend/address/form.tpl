{extends file="parent:frontend/address/form.tpl"}
{namespace name="frontend/address/index"}
{* debug *}

{* Country state *}
{block name='frontend_address_form_input_country_states'}
    {$smarty.block.parent}
{/block}

{block name='frontend_address_form_input_set_default_shipping'}
    {if !$formData.id || $sUserData.additional.user.default_shipping_address_id != $formData.id}
        <div class="address--packstation-shipping">
	        <input type="checkbox" id="packstation" name="packstation" value="1"/>
            <label for="packstation">Packstation als Empf&auml;nger</label>
            <input type="button" onClick="window.open('https://www.dhl.de/de/privatkunden/dhl-standorte-finden.html','DHL Postfinder','toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,height=400,width=600'); return false;"  title="Packstation finden" style="display:none; border:solid 3px #efca31; border-radius:6px;" value="Packstation finden" id="packstation_finder">    
        </div>
        <div class="address--default-shipping">
            <input type="checkbox"
                   id="set_default_shipping"
                   name="{$inputPrefix}[additional][setDefaultShippingAddress]"
                   value="1" />
            <label for="set_default_shipping">{s name="AddressesSetAsDefaultShippingAction"}{/s}</label>
        </div>
    {/if}
 <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
        $(document).ready(function() {
            $('#packstation').click(function() {
                $('#packstation_finder').toggle();
            });
        });
 </script>
{/block}
