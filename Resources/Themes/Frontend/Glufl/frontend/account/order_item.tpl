{extends file="parent:frontend/account/order_item.tpl"}
    
       {* Dispatch type *}
        {block name="frontend_account_order_item_dispatch"}
            <div class="order--dispatch panel--td column--dispatch">

                {block name="frontend_account_order_item_dispatch_label"}
                    <div class="column--label">
                        {s name="OrderColumnDispatch" namespace="frontend/account/orders"}{/s}:
                    </div>
                {/block}

                {block name="frontend_account_order_item_payment_label"}
                    <div class="column--label">
                        {s name="OrderColumnPayment" namespace="frontend/account/orders"}{/s}:
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
                    </div> 

                    <div class="column--value">
                        <span class="payment--status-icon status--{$offerPosition.cleared}">&nbsp;</span>
                        {if $offerPosition.cleared==9}
                        	{s name="partially_invoiced" namespace="backend/static/payment_status"}{/s}
                        {elseif $offerPosition.cleared==10}
                        	{s name="completely_invoiced" namespace="backend/static/payment_status"}{/s}
                        {elseif $offerPosition.cleared==11}
                        	{s name="partially_paid" namespace="backend/static/payment_status"}{/s}
                        {elseif $offerPosition.cleared==12}
                        	{s name="completely_paid" namespace="backend/static/payment_status"}{/s}
                        {elseif $offerPosition.cleared==13}
                        	{s name="1st_reminder" namespace="backend/static/payment_status"}{/s}
                        {elseif $offerPosition.cleared==14}
                        	{s name="2nd_reminder" namespace="backend/static/payment_status"}{/s}
                        {elseif $offerPosition.cleared==15}
                        	{s name="3rd_reminder" namespace="backend/static/payment_status"}{/s}
                        {elseif $offerPosition.cleared==16}
                        	{s name="encashment" namespace="backend/static/payment_status"}{/s}
                        {elseif $offerPosition.cleared==17}
                        	{s name="open" namespace="backend/static/payment_status"}{/s}
                        {elseif $offerPosition.cleared==18}
                        	{s name="reserved" namespace="backend/static/payment_status"}{/s}
                        {elseif $offerPosition.cleared==21}
                        	{s name="review_necessary" namespace="backend/static/payment_status"}{/s}
                        {/if}	
                    </div>
                 {/block}
            </div>
        {/block}
