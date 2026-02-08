{{-- Small Heading --}}
<div class="form-group mb-3">
    <label>{{ __('Small Heading') }}</label>
    {!! Form::text('small_title', Arr::get($attributes, 'small_title', 'service'), [
        'class' => 'form-control'
    ]) !!}
</div>

{{-- Main Heading --}}
<div class="form-group mb-3">
    <label>{{ __('Main Heading (HTML allowed)') }}</label>
    {!! Form::textarea('heading', Arr::get($attributes, 'heading', 'Strategic HR solutions for <span>lasting success</span>'), [
        'class' => 'form-control',
        'rows' => 3
    ]) !!}
</div>

{{-- View All Button --}}
<div class="form-group mb-3">
    <label>{{ __('View All Button Text') }}</label>
    {!! Form::text('button_text', Arr::get($attributes, 'button_text', 'view all services'), [
        'class' => 'form-control'
    ]) !!}
</div>

<div class="form-group mb-4">
    <label>{{ __('View All Button URL') }}</label>
    {!! Form::text('button_url', Arr::get($attributes, 'button_url', '/services'), [
        'class' => 'form-control'
    ]) !!}
</div>

<hr>

{{-- SERVICES --}}
<h5 class="mb-3">{{ __('Services (Max 4)') }}</h5>

<div class="form-group mb-4">
    {!! Shortcode::fields()->tabs(
        [
            'icon' => [
                'type'  => 'image',
                'title' => __('Service Icon'),
            ],
            'title' => [
                'type'  => 'text',
                'title' => __('Service Title'),
            ],
            'description' => [
                'type'  => 'textarea',
                'title' => __('Short Description'),
            ],
            'link' => [
                'type'  => 'text',
                'title' => __('Read More Link'),
            ],
        ],
        $attributes,
        4,          // max
        'services',
        4
    ) !!}
</div>

<hr>

{{-- Footer Text --}}
<div class="form-group mb-3">
    <label>{{ __('Footer Highlight Text') }}</label>
    {!! Form::text('footer_highlight', Arr::get($attributes, 'footer_highlight', 'free'), [
        'class' => 'form-control'
    ]) !!}
</div>

<div class="form-group mb-3">
    <label>{{ __('Footer Text') }}</label>
    {!! Form::text('footer_text', Arr::get($attributes, 'footer_text', "Let's build success together"), [
        'class' => 'form-control'
    ]) !!}
</div>

<div class="form-group mb-3">
    <label>{{ __('Footer Link URL') }}</label>
    {!! Form::text('footer_link', Arr::get($attributes, 'footer_link', '/contact'), [
        'class' => 'form-control'
    ]) !!}
</div>
