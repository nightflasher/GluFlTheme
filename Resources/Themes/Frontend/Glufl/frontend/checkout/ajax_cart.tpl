{extends file="parent:frontend/checkout/ajax_cart.tpl"}

{block name='frontend_checkout_ajax_cart_prices_container'}
	{$smarty.block.parent}
	{if $sBasket.content}
		<div class="prices--container">
                {block name='frontend_checkout_ajax_cart_weight_info'}
		 	<p>
				{block name='frontend_checkout_ajax_cart_total_versand'}
		   			<span class="small--information">
			                        {s name="ConfirmWeightTotal" namespace="frontend/checkout/cart_footer"}{/s}
                   			</span>
				{/block}

				{block name='frontend_checkout_ajax_cart_field_labels_total_weight'}
					<span class="small--prices">
						{($sDispatch.weight*1.25)|string_format:"%.3f"|replace:'.':','} kg
					</span>
                		{/block}
			</p>
		    {/block}
		</div>
	{/if}
{/block}
