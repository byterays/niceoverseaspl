<div class="mb-3">
    <label class="form-label">{{ __('Style') }}</label>
    {!! Form::customSelect('style', [
        'style-1' => __('Style :number', ['number' => 1]),     
        'style-2' => __('Style :number', ['number' => 2]),           
    ], Arr::get($attributes, 'style')) !!}
</div>
<div class="mb-3">
    <label class="form-label">{{ __('Block Content') }}</label>
    {!! Shortcode::fields()->tabs([
        'icon' => [
            'title' => __('Icon'),
            'type' => 'text',
        ],
        'image' => [
            'title' => __('Image'),
            'type' => 'image',
        ],
        'title' => [
            'title' => __('Title'),
            'type' => 'text',
        ],
        'description' => [
            'title' => __('Description'),
            'type' => 'text',
        ],     
        'link_text' => [
            'title' => __('Link Text'),
            'type' => 'text',
        ],
        'link_url' => [
            'title' => __('Link Url'),
            'type' => 'text',
        ],   
    ], $attributes) !!}
</div>

