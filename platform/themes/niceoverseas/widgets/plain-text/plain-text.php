<?php

use Botble\Widget\AbstractWidget;
use Illuminate\Support\Collection;

class PlainTextWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name'        => __('PlainText'),
            'description' => __('Widget description'),
        ]);
    }

    protected function data(): array|Collection
    {
        return [];
    }
}
