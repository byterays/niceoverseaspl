<?php

namespace Theme\Miraclehrhub\Http\Controllers;

use Botble\Theme\Http\Controllers\PublicController;

class MiraclehrhubController extends PublicController
{
    public function getIndex()
    {
        return parent::getIndex();
    }

    public function getView(string|null $key = null, string $prefix = '')
    {
        return parent::getView($key);
    }

    public function getSiteMapIndex(string $key = null, string $extension = 'xml')
    {
        return parent::getSiteMapIndex();
    }
}
