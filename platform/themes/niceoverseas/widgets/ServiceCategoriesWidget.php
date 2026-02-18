<?php


use Theme;
use Botble\Base\Forms\FormAbstract;
use Botble\Widget\AbstractWidget;

class ServiceCategoriesWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'id' => 'service-categories',
            'name' => 'Service Categories',
            'description' => 'Service navigation widget',
        ]);
    }

    public function settingForm(): FormAbstract|string|null
    {
        return $this->formBuilder->createByArray([
            'title' => [
                'type' => 'text',
                'label' => 'Widget Title',
            ],
        ]);
    }

    public function run()
    {
        return view(
            Theme::getThemeNamespace() . '::partials.widgets.service-categories',
            ['settings' => $this->getConfig()]
        );
    }
}
