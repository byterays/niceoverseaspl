<?php

use Botble\Widget\AbstractWidget;
use Illuminate\Support\Collection;

class SidebarCtaWidgetWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name'        => __('SidebarCtaWidget'),
            'description' => __('Widget description'),
        ]);
    }

    protected function data(): array|Collection
    {
        return [];
    }
}
