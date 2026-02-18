<?php

namespace Theme\Niceoverseas\Widgets;

use Botble\Widget\AbstractWidget;
use Botble\Base\Forms\FormAbstract;
use Theme;

class SidebarCtaWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'id' => 'sidebar-cta',
            'name' => 'Sidebar CTA',
            'description' => 'Sidebar CTA widget',
        ]);
    }

    public function settingForm(): FormAbstract|string|null
    {
        return $this->formBuilder->createByArray([
            'heading' => [
                'type' => 'text',
                'label' => 'Heading',
            ],
            'phone' => [
                'type' => 'text',
                'label' => 'Phone',
            ],
            'logo' => [
                'type' => 'mediaImage',
                'label' => 'Logo Image',
            ],
            'phone_icon' => [
                'type' => 'mediaImage',
                'label' => 'Phone Icon',
            ],
            'animation_delay' => [
                'type' => 'text',
                'label' => 'Animation Delay',
                'default_value' => '0.25s',
            ],
        ]);
    }

    public function run()
    {
        return view(
            Theme::getThemeNamespace() . '::partials.widgets.sidebar-cta',
            ['settings' => $this->getConfig()]
        );
    }
}