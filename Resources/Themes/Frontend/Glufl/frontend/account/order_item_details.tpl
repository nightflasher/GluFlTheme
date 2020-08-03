{extends file="parent:frontend/account/order_item_details.tpl"}

{namespace name="frontend/account/order_item"}

{* Name *}
    {block name="frontend_account_order_item_name"}
        {if $article.article.articleID != ''}
        <a class="order--name is--strong"  href="{url controller=detail sArticle=$article.article.articleID}" title="{$article.name|strip_tags|escape}"
            {if {config name=detailmodal} && {controllerAction|lower} === 'confirm'}
                data-modalbox="true"
                data-content="{url controller="detail" action="productQuickView" ordernumber="{$article.articleID}" fullPath}"
                data-mode="ajax"
                data-width="750"
                data-sizing="content"
                data-title="{$article.name|strip_tags|escape}"
                data-updateImages="true"
            {/if}>{$article.name|strip_tags|truncate:60}</a>
       {else}
            <strong><i>{$article.name|strip_tags|escape}</i></strong>
       {/if}
    {/block}

    {block name="frontend_account_order_item_currentprice_label"}
            <span>
                {$article.article.description|strip_tags|truncate:60}
            </span>
    {/block}

    {block name="frontend_account_order_item_currentprice_value"}
            <span class="order_item_id">
                <p>{s name="DetailDataId" namespace="frontend/detail/data"}{/s}{$article.articleordernumber}</p>
            </span>
    {/block}

{**************************************************************************************************************************}

    {block name="frontend_account_order_item_detail_info_wrapper"}
        <div class="column--info-wrapper">
	    {block name="frontend_account_order_item_detail_info_labels"}
		<div class="panel--td column--info-labels">
		{* Order date label *}
		{block name="frontend_account_order_item_label_date"}
		    <p class="is--strong">{s name="OrderItemColumnDate"}{/s}</p>
		{/block}
		{* Order number label *}
		{block name="frontend_account_order_item_label_ordernumber"}
		    <p class="is--strong">{s name="OrderItemColumnId"}{/s}</p>
		{/block}
		{* Package tracking code label *}
		{block name="frontend_account_order_item_label_trackingcode"}
		    {if $offerPosition.trackingcode}
		        <p class="is--strong">{s name="OrderItemColumnTracking"}{/s}</p>
		    {/if}
		{/block}
                </div>
	    {/block}

	    {block name="frontend_account_order_item_detail_info_data"}
		<div class="panel--td column--info-data">
		{* Order date *}
		{block name='frontend_account_order_item_date'}
		    <p>{$offerPosition.datum|date}</p>
		{/block}
		{* Order number *}
		{block name='frontend_account_order_item_ordernumber'}
		    <p>{$offerPosition.ordernumber}</p>
		{/block}
		{* Package tracking code *}
		{block name="frontend_account_order_item_trackingcode"}
                    {if $offerPosition.trackingcode}
                        <p>
                        {if $offerPosition.dispatch.status_link}
			    <a href="{$offerPosition.dispatch.status_link}" title="{$offerPosition.dispatch.name}" onclick="return !window.open(this.href, 'popup', 'width=500,height=600,left=20,top=20');" target="_blank">
				{$offerPosition.trackingcode}
			    </a>
                        {else}
				{$offerPosition.trackingcode}
                        {/if}
                        </p>
                    {/if}
                {/block}
		</div>
	    {/block}
        </div>
    {/block}

{**************************************************************************************************************************}

{* Shop comment - RECHNUNG.PDF *}
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


{* Repeat order - NOT*}
    {block name="frontend_account_order_item_repeat_order"}
    {/block}
