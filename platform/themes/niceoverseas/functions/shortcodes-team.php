<?php

use Botble\Shortcode\Compilers\Shortcode as ShortcodeCompiler;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Team\Models\Team;
use Botble\Theme\Facades\Theme;

app()->booted(function () {
    if (!is_plugin_active('team')) {
        return;
    }
    if (is_plugin_active('team')) {
        Shortcode::register('team', __('Team'), __('Team'), function (ShortcodeCompiler $shortcode) {
            $team = Team::query()
                ->wherePublished()
                ->get();
            $style = in_array(
                $shortcode->style,
                [
                    'style-1',
                ]
            ) ? $shortcode->style : 'style-1';

            return Theme::partial("shortcodes.team.styles.$style", compact('shortcode', 'team'));
        });
        Shortcode::setAdminConfig('team', function (array $attributes) {
            return Theme::partial('shortcodes.team.admin-config', compact('attributes'));
        });
    }


});
