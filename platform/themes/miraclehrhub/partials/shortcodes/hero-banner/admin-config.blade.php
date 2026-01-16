
<div class="mb-3">
    <label class="form-label">{{ __('Style') }}</label>
    {!! Form::customSelect('style', [
        'style-1' => __('Style :number', ['number' => 1]),
    ], Arr::get($attributes, 'style')) !!}
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Slider Images') }}</label>
    {!! Shortcode::fields()->tabs([
        'title' => [
            'title' => __('Title'),
            'type' => 'text',
        ],
        'subtitle' => [
            'title' => __('Sub Title'),
            'type' => 'text',
        ],
        'button_label' => [
            'title' => __('Button Label'),
            'type' => 'text',
        ],
        'button_link' => [
            'title' => __('Button Link'),
            'type' => 'text',
        ],        
        'image' => [
            'title' => __('Image'),
            'type' => 'image'
        ],
    ], $attributes) !!}
</div>
