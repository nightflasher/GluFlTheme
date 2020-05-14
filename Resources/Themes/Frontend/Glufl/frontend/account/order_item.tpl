{extends file="parent:frontend/account/order_item.tpl"}
{block name="frontend_account_order_item_overview_row"}
    <div class="order--item panel--tr">

        {* Order date *}
        {block name="frontend_account_order_item_date"}
            <div class="order--date panel--td column--date">

                {block name="frontend_account_order_item_date_label"}
                    <div class="column--label">
                        {s name="OrderColumnDate" namespace="frontend/account/orders"}{/s}:
                    </div>
                {/block}

                {block name="frontend_account_order_item_date_value"}
                    <div class="column--value">
                        {$offerPosition.datum|date}
                    </div>
                {/block}
            </div>
        {/block}

        {* Order id *}
        {block name="frontend_account_order_item_number"}
            <div class="order--number panel--td column--id is--bold">

                {block name="frontend_account_order_item_number_label"}
                    <div class="column--label">
                        {s name="OrderColumnId" namespace="frontend/account/orders"}{/s}:
                    </div>
                {/block}

                {block name="frontend_account_order_item_number_value"}
                    <div class="column--value">
                        {$offerPosition.ordernumber}
                    </div>
                {/block}
            </div>
        {/block}

        {* Dispatch type *}
        {block name="frontend_account_order_item_dispatch"}
            <div class="order--dispatch panel--td column--dispatch">

                {block name="frontend_account_order_item_dispatch_label"}
                    <div class="column--label">
                        {s name="OrderColumnDispatch" namespace="frontend/account/orders"}{/s}:
                    </div>
                {/block}

                {block name="frontend_account_order_item_dispatch_value"}
                    <div class="column--value">
                        {if $offerPosition.dispatch.name}
                            {$offerPosition.dispatch.name}
                        {else}
                            {s name="OrderInfoNoDispatch"}{/s}
                        {/if}
                    </div>
                {/block}
            {*</div>*}
        {*/block*}

        {* Payment type *}
        {*block name="frontend_account_order_item_payment"*}
        {*    <div class="order--payment panel--td column--payment">*}
                {block name="frontend_account_order_item_payment_label"}
                    <div class="column--label">
                        {s name="OrderColumnPayment" namespace="frontend/account/orders"}{/s}:
                    </div>
                {/block}

                {block name="frontend_account_order_item_payment_value"}
                    <div class="column--value">
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
                    </div>
                {/block}
		</div>
        {/block}

        {* Order status *}
        {block name="frontend_account_order_item_status"}
            <div class="order--status panel--td column--status">

                {block name="frontend_account_order_item_status_label"}
                    <div class="column--label">
                        {s name="OrderColumnStatus" namespace="frontend/account/orders"}{/s}:
                    </div>
                {/block}

                {block name="frontend_account_order_item_status_value"}
                    <div class="column--value">
                        <span class="order--status-icon status--{$offerPosition.status}">&nbsp;</span>
                        {if $offerPosition.status==0}
                            {s name="OrderItemInfoNotProcessed"}{/s}
                        {elseif $offerPosition.status==1}
                            {s name="OrderItemInfoInProgress"}{/s}
                        {elseif $offerPosition.status==2}
                            {s name="OrderItemInfoCompleted"}{/s}
                        {elseif $offerPosition.status==3}
                            {s name="OrderItemInfoPartiallyCompleted"}{/s}
                        {elseif $offerPosition.status==4}
                            {s name="OrderItemInfoCanceled"}{/s}
                        {elseif $offerPosition.status==5}
                            {s name="OrderItemInfoReadyForShipping"}{/s}
                        {elseif $offerPosition.status==6}
                            {s name="OrderItemInfoPartiallyShipped"}{/s}
                        {elseif $offerPosition.status==7}
                            {s name="OrderItemInfoShipped"}{/s}
                        {elseif $offerPosition.status==8}
                            {s name="OrderItemInfoClarificationNeeded"}{/s}
                        {else}
                            {block name="frontend_account_order_item_status_value_custom"}
                                {$snippetName = {"OrderItemInfo"|cat:$offerPosition.stateName}}
                                {$offerPosition.stateName|snippet:$snippetName:'frontend/account/order_item'}
                            {/block}
                        {/if}
			<br/>

			<div class="column--value"> </div>
                        <span class="payment--status-icon status--{$offerPosition.cleared}">&nbsp;</span>

		{if $offerPosition.cleared==9}
			{se name="partially_invoiced" namespace="backend/static/payment_status"}{/se}
		{elseif $offerPosition.cleared==10}
			{se name="completely_invoiced" namespace="backend/static/payment_status"}{/se}
		{elseif $offerPosition.cleared==11}
			{se name="partially_paid" namespace="backend/static/payment_status"}{/se}
		{elseif $offerPosition.cleared==12}
			{se name="completely_paid" namespace="backend/static/payment_status"}{/se}
		{elseif $offerPosition.cleared==13}
			{se name="1st_reminder" namespace="backend/static/payment_status"}{/se}
		{elseif $offerPosition.cleared==14}
			{se name="2nd_reminder" namespace="backend/static/payment_status"}{/se}
		{elseif $offerPosition.cleared==15}
			{se name="3rd_reminder" namespace="backend/static/payment_status"}{/se}
		{elseif $offerPosition.cleared==16}
			{se name="encashment" namespace="backend/static/payment_status"}{/se}
		{elseif $offerPosition.cleared==17}
			{se name="open" namespace="backend/static/payment_status"}{/se}
		{elseif $offerPosition.cleared==18}
			{se name="reserved" namespace="backend/static/payment_status"}{/se}
		{elseif $offerPosition.cleared==21}
			{se name="review_necessary" namespace="backend/static/payment_status"}{/se}
		{/if}	

                    </div>
                {/block}
            </div>
        {/block}

        {* Order actions *}
        {block name="frontend_account_order_item_actions"}
            <div class="order--actions panel--td column--actions">
                {s name="OrderActionSlide" assign="snippetOrderActionSlide"}{/s}
                <a href="#order{$offerPosition.ordernumber}"
                   title="{$snippetOrderActionSlide|escape} {$offerPosition.ordernumber}"
                   class="btn is--small"
                   data-collapse-panel="true"
                   data-collapseTarget="#order{$offerPosition.ordernumber}">
                    {s name="OrderActionSlide"}{/s}
                </a>
            </div>
        {/block}
    </div>
{/block}

{* Order details *}
{block name="frontend_account_order_item_detail"}
    {include file="frontend/account/order_item_details.tpl"}
{/block}
