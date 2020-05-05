<?php
namespace GluFlTheme;

use Shopware\Components\Plugin;

class GluFlTheme extends Plugin
{
    /**
     * @return string
     */
    public function getVersion()
    {
        return '1.7.1';
    }

    /**
     * @return array
     */
    public function getInfo()
    {
        return array(
            'version' => $this->getVersion(),
            'label' => $this->getLabel(),
            'link' => 'http://www.glaeserundflaschen.de',
            'description' => 'Dies ist ein angepasstes Template bzw Theme für Gläser und Flaschen GmbH',
            'author' => 'KMATTERN'
        );
    }

    /**
     * @return string
     */
    public function getLabel()
    {
        return 'GluFlTheme';
    }
}
?>