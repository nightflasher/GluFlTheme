{extends file='parent:frontend/detail/content/buy_container.tpl'}
{block name='frontend_detail_data_ordernumber'}
{$smarty.block.parent}
{*debug*}
{* properties START *}
{if $sArticle.sProperties}
                    {foreach $sArticle.sProperties as $sProperty}
                        <li class="base-info--entry">
                            {* Property label *}
                            {block name='frontend_detail_description_properties_label'}
                            <strong class="entry--label">
                                {$sProperty.name|escape}:
                            </strong>
                            {/block}
 
                            {* Property content *}
                            {block name='frontend_detail_description_properties_content'}
                            <meta itemprop="{$sProperty.name}" content="{$sProperty.value}">
                            <span class="entry--content" itemprop="sku">
                                {if is_numeric($sProperty.value)}
                                        {if $sProperty.value > 1000}
                                                {($sProperty.value/1000)|escape|string_format:"%.2f"|replace:'.':','} m
                                        {elseif $sProperty.value > 100}
                                                {($sProperty.value/10)|escape|string_format:"%.2f"|replace:'.':','} cm
                                        {else}
                                                {$sProperty.value|escape|replace:'.':','} mm
                                        {/if}
                                {else}
                                        {$sProperty.value|escape}
                                {/if}
                            </span>
                            {/block}
                        </li>
                    {/foreach}
{* properties ENDE *}
{else}
{* WIDTH HEIGHT LENGTH START*}
        {if $sArticle.width}
                    <li class="base-info--entry entry--sku">
                        {* Product SKU - Label WIDTH *}
                        {block name='frontend_detail_data_width_label'}
                            <strong class="entry--label">
                                {s name="columns/product/Detail_width" namespace="backend/article_list/main"}{/s}
                            </strong>
                        {/block}
                        {* Product SKU - Content *}
                        {block name='frontend_detail_data_width_content'}
                            <meta itemprop="width" content="{$sArticle.width}"/>
                            <span class="entry--content" itemprop="sku">
                                {$sArticle.width|replace:'.':','} mm
                                {if $sArticle.width > 1000}
                                        {($sArticle.width/1000)|string_format:"%.2f"|replace:'.':','} m
                                {elseif $sArticle.width > 100}
                                        {($sArticle.width/10)|string_format:"%.2f"|replace:'.':','} cm
                                {else}
                                        {$sArticle.width|replace:'.':','} mm
                                {/if}
                    </li>
                            </span>
                        {/block}
        {/if}
        {if $sArticle.height}
                    <li class="base-info--entry entry--sku">
                        {* Product SKU - Label HEIGHT *}
                        {block name='frontend_detail_data_height_label'}
                            <strong class="entry--label">
                                {s name="columns/product/Detail_height" namespace="backend/article_list/main"}{/s}
                            </strong>
                        {/block}
                        {* Product SKU - Content *}
                        {block name='frontend_detail_data_height_content'}
                            <meta itemprop="height" content="{$sArticle.height}"/>
                            <span class="entry--content" itemprop="sku">
                                {$sArticle.height|replace:'.':','} mm
                                {if $sArticle.height > 1000}
                                        {($sArticle.height/1000)|string_format:"%.2f"|replace:'.':','} m
                                {elseif $sArticle.height > 100}
                                        {($sArticle.height/10)|string_format:"%.2f"|replace:'.':','} cm
                                {else}
                                        {$sArticle.height|replace:'.':','} mm
                                {/if}

                    </li>
                            </span>
                        {/block}
        {/if}
        {if $sArticle.length}
                    <li class="base-info--entry entry--sku">
                        {* Product SKU - Label LENGTH *}
                        {block name='frontend_detail_data_length_label'}
                            <strong class="entry--label">
                                {s name="columns/product/Detail_len" namespace="backend/article_list/main"}{/s}
                            </strong>
                        {/block}
                        {* Product SKU - Content *}
                        {block name='frontend_detail_data_length_content'}
                            <meta itemprop="lenght" content="{$sArticle.length}"/>
                            <span class="entry--content" itemprop="sku">
                                {if $sArticle.length > 1000}
                                        {($sArticle.length/1000)|string_format:"%.2f"|replace:'.':','} m
                                {elseif $sArticle.length > 100}
                                        {($sArticle.length/10)|string_format:"%.2f"|replace:'.':','} cm
                                {else}
                                        {$sArticle.length|replace:'.':','} mm
                                {/if}
 
                    </li>
                            </span>
                        {/block}
        {/if}
{* WIDTH HEIGHT LENGTH ENDE*}
{/if}

{* Artikelgewicht START *}
{if $sArticle.weight}
	<li class="base-info--entry entry--sku">
	{* Product SKU - Label WEIGHT *}
        {block name='frontend_detail_data_weight_label'}
		<strong class="entry--label">
                	{s name="columns/product/Detail_weight" namespace="backend/article_list/main"}{/s}
                </strong>
        {/block}
        {* Product SKU - Content *}
        {block name='frontend_detail_data_weight_content'}
        	<meta itemprop="weight" content="{$sArticle.weight}"/>
                <span class="entry--content" itemprop="sku">
			{$sArticle.weight|string_format:"%.3f"|replace:'.':','} kg
                </span>
        {/block}
	</li>
{/if}
{* Artikelgewicht ENDE *}

{* Artikel-Volumen experimentell START *}
{assign var=artikelname value=" "|explode:$sArticle.articleName}
{for $i = 0 to count($artikelname)}
	{if $i < count($artikelname) && ($artikelname[$i]|strstr:"ml") OR ($artikelname[$i]|strstr:"L") AND !($artikelname[$i]|strstr:"LED")}
		{if ($artikelname[$i-1]|strstr:"/")}
			{assign var=convert value="/"|explode:$artikelname[($i-1)]}
			{$v=($convert[0]/$convert[1])}
			{$hasVolume = TRUE}
		{elseif	is_numeric($artikelname[($i-1)]|replace:",":".") AND $artikelname[$i]|strstr:"L" OR $artikelname[$i]|strstr:"Liter"}
       	        	{$v=($artikelname[($i-1)]|replace:",":".")*1000}
			{$hasVolume = TRUE}
		{elseif is_numeric($artikelname[($i-1)]|replace:",":".") AND $artikelname[$i]|strstr:"ml"}
			{$v=$artikelname[($i-1)]}
			{$hasVolume = TRUE}
		{else}
			{$hasVolume = FALSE}
		{/if}
	{/if}
{/for}

{if !$v AND $hasVolume == TRUE}
	<li class="base-info--entry entry--sku">
        {block name='frontend_detail_data_weight_label'}
        	<strong class="entry--label">
                	Volumen:
               	</strong>
        {/block}
        {block name='frontend_detail_data_name_label'}
        	{if ($v > 999)}
                	{($v/1000)|replace:".":","} L
                {elseif ($v < 1)}
			{$v*1000} ml
		{else}
                        {$v} ml
                {/if}
        {/block}
 </li>
{/if}

{* Artikel-Volumen aus EEK experimentell ENDE *}
{if $sArticle.volumen}
	{$v=$sArticle.volumen}
	<li class="base-info--entry entry--sku">
        {block name='frontend_detail_data_weight_label'}
        	<strong class="entry--label">
                	Volumen (EEK):
               	</strong>
        {/block}
        {block name='frontend_detail_data_name_label'}
        	{if ($v > 999)}
                	{($v/1000)|replace:".":","} L
                {elseif ($v < 1)}
			{$v*1000} ml
		{else}
                        {$v} ml
                {/if}
        {/block}
 </li>
{/if}
{* Artikel-Volumen aus EEK experimentell ENDE *}

{* $sArticle.volumen *}
{* $sArticle.mentionconnect *}
{/block}


{block name='frontend_detail_data_attributes_attr1'}
{/block}

{block name='frontend_detail_data_attributes_attr2'}
{/block}

{block name='frontend_detail_data_attributes_attr3'}
{/block}

