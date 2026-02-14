<?php
use Botble\Base\Facades\MetaBox;
use Botble\Page\Models\Page;


add_action(BASE_ACTION_META_BOXES, function () {

    MetaBox::addMetaBox(
        'page_sidebar_widgets',
        __('Page Sidebar Widgets'),
        function ($object) {

            $widgets = get_meta_data($object, 'page_sidebar_widgets', true);

            if (!is_array($widgets)) {
                $widgets = [];
            }

            return view(Theme::getThemeNamespace() . '::metaboxes.page-sidebar-widgets', compact('widgets'));


        },
        \Botble\Page\Models\Page::class,
        'side',
        'default'
    );

}, 24);


add_action(BASE_ACTION_AFTER_UPDATE_CONTENT, function ($type, $request, $object) {

    if (!($object instanceof Page)) {
        return;
    }

    $widgets = json_decode(
        $request->input('page_sidebar_widgets_json', '[]'),
        true
    );

    if (!is_array($widgets)) {
        $widgets = [];
    }

    $widgets = array_values(array_filter($widgets));

    MetaBox::saveMetaBoxData($object, 'page_sidebar_widgets', $widgets);

}, 999, 3);


add_action(BASE_ACTION_AFTER_CREATE_CONTENT, function ($type, $request, $object) {

    if (!($object instanceof Page)) {
        return;
    }

    $widgets = json_decode(
        $request->input('page_sidebar_widgets_json', '[]'),
        true
    );

    if (!is_array($widgets)) {
        $widgets = [];
    }

    $widgets = array_values(array_filter($widgets));

    MetaBox::saveMetaBoxData($object, 'page_sidebar_widgets', $widgets);

}, 999, 3);

