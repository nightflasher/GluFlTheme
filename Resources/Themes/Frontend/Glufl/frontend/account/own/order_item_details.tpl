{extends file="parent:frontend/account/order_item_details.tpl"}
{namespace name="frontend/account/order_item"}
{* Paying method *}
{block name='frontend_account_order_item_payment'}
	{if $einblenden}
		{if $offerPosition.paymentID == '2' OR $offerPosition.paymentID == '6'}
			{s name="payment_options_sepa_label" namespace="themes/views/backend/config"}{/s}
		{elseif $offerPosition.paymentID == '3'}
                	{s name="payment_options_cashondelivery_label" namespace="themes/views/backend/config"}{/s}
		{elseif $offerPosition.paymentID == '4'}
                	{s name="payment_options_bill_label" namespace="themes/views/backend/config"}{/s}	
		{elseif $offerPosition.paymentID == '5'}
			{s name="payment_options_prepayment_label" namespace="themes/views/backend/config"}{/s}
		{elseif $offerPosition.paymentID == '7'}
			{s name="payment_options_cash_label" namespace="themes/views/backend/config"}{/s}
		{elseif $offerPosition.paymentID == '16' OR $offerPosition.paymentID == '17'}
                	{s name="payment_options_paypal_label" namespace="themes/views/backend/config"}{/s}		
		{/if}
	{/if}
{/block}

{* Shipping method label  *}
{block name="frontend_account_order_item_label_dispatch"}
{if $einblenden}
       	{if $offerPosition.dispatch}
               	<p class="is--strong">{s name="OrderItemColumnDispatch"}{/s}</p>
        {/if}
{/if}
{/block}

{* Paying method label *}
{block name="frontend_account_order_item_label_payment"}
{if $einblenden}
	{if $offerPosition.paymentID}
        	<p class="is--strong">{s name="OrderItemColumnPayment"}{/s}</p>
        {/if}
{/if}
{/block}

{* Shipping method *}
{block name='frontend_account_order_item_dispatch'}
{if $einblenden}
       	{if $offerPosition.dispatch}
               	<p>{$offerPosition.dispatch.name}</p>
        {/if}
{/if}
{/block}
                        
{* Paying method *}
{block name='frontend_account_order_item_payment'}
{if $einblenden}
	{if $offerPosition.paymentID == '2' OR $offerPosition.paymentID == '6'}
        	{s name="payment_options_sepa_label" namespace="themes/views/backend/config"}{/s}
        {elseif $offerPosition.paymentID == '3'}
                {s name="payment_options_cashondelivery_label" namespace="themes/views/backend/config"}{/s}
        {elseif $offerPosition.paymentID == '4'}
                {s name="payment_options_bill_label" namespace="themes/views/backend/config"}{/s}
        {elseif $offerPosition.paymentID == '5'}
                {s name="payment_options_prepayment_label" namespace="themes/views/backend/config"}{/s}
        {elseif $offerPosition.paymentID == '7'}
                {s name="payment_options_cash_label" namespace="themes/views/backend/config"}{/s}
        {elseif $offerPosition.paymentID == '16' OR $offerPosition.paymentID == '17'}
                {s name="payment_options_paypal_label" namespace="themes/views/backend/config"}{/s}
        {/if}
{/if}
{/block}
 
{* Shop comment *}
{block name="frontend_account_order_item_shop_comment"}
{if $offerPosition.comment or $offerPosition.internalcomment}
        <div class="order--shop-comments panel">
               {block name="frontend_account_order_item_shop_comment_title"}
		<div class="panel--title">{s name="OrderItemComment"}{/s}</div>
               {/block}
 
               {block name="frontend_account_order_item_shop_comment_content"}
                <div class="panel--body is--wide">
                        {assign var=docs value=","|explode:$offerPosition.internalcomment}
                	<blockquote>
                		{s name="invoice" namespace="backend/static/doc_type"}{/s}: <a href="{$docs[1]|mediaurl}" target="_blank">{$docs[0]}</a>
                	</blockquote>
                	{if $offerPosition.comment}
                		<blockquote>{$offerPosition.comment}</blockquote>
                	{/if}
        	</div>
		{/block}
	</div>
{/if}
{/block}

{* Repeat order *}
{block name="frontend_account_order_item_repeat_order"}
{if $repeatorder}
    {if $offerPosition.activeBuyButton}
        <div class="order--repeat panel--tr">
            <form method="post" action="{url controller='checkout' action='add_accessories'}">
                {foreach $offerPosition.details as $article}{if $article.modus == 0}
                    <input name="sAddAccessories[]" type="hidden" value="{$article.articleordernumber|escape}" />
                    <input name="sAddAccessoriesQuantity[]" type="hidden" value="{$article.quantity|escape}" />
                {/if}{/foreach}
 
                {* Repeat order button *}
                {block name="frontend_account_order_item_repeat_button"}
                    <input type="submit" class="btn is--primary is--small" value="{s name='OrderLinkRepeat'}{/s}" />
                {/block}
            </form>
        </div>
    {/if}
{/if}
{/block}
