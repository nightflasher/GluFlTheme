{extends file="parent:frontend/detail/data.tpl"}
{block name='frontend_detail_data_tax'}
{$smarty.block.parent}

{* Versandgewicht auf artikelseite start *}
	{if $sArticle.weight}
		{se name="DetailDataWeight"}{/se}
	       {* <br/><dfn title="inkl. Verpackung">Versandgewicht: {($sArticle.weight*1.25)|string_format:"%.3f"|replace:".":","} {se name="DetailDataGram"}{/se}kg</dfn> *}
	        <br/><abbr title="inkl. Verpackung">Versandgewicht</abbr>: {($sArticle.weight*1.25)|string_format:"%.3f"|replace:".":","} {se name="DetailDataGram"}{/se}kg
	{/if}
{* Versandgewicht auf artikelseite ende *}

{/block}
