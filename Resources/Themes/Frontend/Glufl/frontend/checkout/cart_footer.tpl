{extends file="parent:frontend/checkout/cart_footer.tpl"}
{block name='frontend_checkout_cart_footer_field_labels_taxes_entry'}
	{*debug*}
	{$smarty.block.parent}
{*/block*}
{* Warenkorb-Gewicht START *}
{*block name='frontend_checkout_shipping_cart_weight'*}

{if !$sDispatches}
	<script>
	function zw() {
		var zahlartenwechsel = window.open('../account/payment','Zahlartwechsel','width=600, height=400'); 
		var timer = setInterval(function() { 
			if(zahlartenwechsel.closed) {
        			clearInterval(timer);
        			location.reload();
    			}
		}, 500);
	}
	</script>
	<div class="alert is--error is--rounded">
		<div class="alert--icon">
			<i class="icon--element icon--cross"></i>
		</div>
		<div class="alert--content">
			<p>
			<strong>Kein Versand m&ouml;glich !</strong><br/>
			Maximales Versandgewicht (80 kg) f&uuml;r Nachnahme &uuml;berschritten!
			</p>
			{if $sUserLoggedIn}
			<a href="#" onClick="zw()" title="Bevorzugte Zahlart &auml;ndern" style="text-decoration: underline; color: rgb(102, 102, 102);"> 
			<span class="frontend_checkout_actions shopware_studio_snippet">Zahlart wechseln</span>
			</a>
			{/if}
		</div>
	</div>

{else}	
	<li class="list--entry block-group entry--shipping">
	<div class="entry--label block">
		{s name="columns/product/Detail_weight" namespace="backend/article_list/main"}{/s}
	</div>
	<div class="entry--value block is--no--star">
		{($sDispatch.weight*1.25)|string_format:"%.3f"|replace:'.':','} kg
	</div>
	</li>
{/if}
{/block}
{* Warenkorb-Gewicht ENDE *}
