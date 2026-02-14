@php
    use Botble\Base\Facades\MetaBox;

    $page = Theme::get('page');
    $widgets = MetaBox::getMetaData($page, 'page_sidebar_widgets', true);
    $has_widgets = !empty($widgets);
    $colClass = $has_widgets ? "col-lg-8" : "col-lg-12";

@endphp

{!! Theme::partial('header') !!}

<div class="page-service-single">
    <div class="container">
        <div class="row">

            @if ($has_widgets)
                <div class="col-lg-4">
                    <div class="page-single-sidebar">
                        @foreach ($widgets as $widget)

                            @php
                                $type = $widget['type'] ?? null;
                                $settings = $widget['settings'] ?? [];
                            @endphp

                            @if ($type)
                                {!! Theme::partial('widgets.' . $type, ['settings' => $settings]) !!}
                            @endif

                        @endforeach

                    </div>

                </div>
            @endif

            <div class="{{ $colClass }}">
                {!! Theme::content() !!}
            </div>

        </div>
    </div>
</div>


{!! Theme::partial('footer') !!}