{extends file="parent:frontend/checkout/items/product.tpl"}
{block name='frontend_checkout_cart_item_details_sku'}
<!--	<p class="content--sku content">
		{s name="CartItemInfoId"}{/s} {$sBasketItem.ordernumber}
	</p>
//-->
	{$smarty.block.parent}
{/block}
{block name='frontend_checkout_cart_item_delivery_informations'}
{* Product SHORTDESCRIPTION *}
	<p class="main-article-short-description">
		{$sBasketItem.additional_details.description|strip_tags}
	</p>
{/block}
