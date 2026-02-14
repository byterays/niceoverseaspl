<?php

namespace Themes\NiceOverseas\Widgets;

use Botble\Widget\AbstractWidget;
use Botble\Page\Models\Page;

class GlobalWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'Global Widget',
            'description' => 'Display content on all or selected pages',
            'content' => '',
            'apply_to' => 'all',
            'pages' => [],
        ]);
    }

    public function form($form)
    {
        $pages = Page::pluck('name', 'id')->toArray();

        return $form
            ->add('content', 'editor', [
                'label' => 'Content',
            ])
            ->add('apply_to', 'select', [
                'label' => 'Apply To',
                'choices' => [
                    'all' => 'All Pages',
                    'specific' => 'Specific Pages',
                ],
            ])
            ->add('pages', 'select', [
                'label' => 'Select Pages',
                'choices' => $pages,
                'attr' => ['multiple' => true],
            ]);
    }

    public function run()
    {
        return view('widgets.global-widget', $this->config);
    }
}
