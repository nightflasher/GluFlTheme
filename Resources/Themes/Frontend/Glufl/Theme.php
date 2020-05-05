<?php

namespace Shopware\Themes\Glufl;

use Shopware\Components\Form as Form;

class Theme extends \Shopware\Components\Theme
{
    protected $extend = 'Responsive';

    protected $name = <<<'SHOPWARE_EOD'
Glaeser_und_Flaschen
SHOPWARE_EOD;

    protected $description = <<<'SHOPWARE_EOD'
Umfangreich angepasster Shop
SHOPWARE_EOD;

    protected $author = <<<'SHOPWARE_EOD'
KMATTERN
SHOPWARE_EOD;

    protected $license = <<<'SHOPWARE_EOD'
2020
SHOPWARE_EOD;

    public function createConfig(Form\Container\TabContainer $container)
    {
    }
}
