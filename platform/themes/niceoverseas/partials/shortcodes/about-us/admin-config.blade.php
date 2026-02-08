{{-- Small Title --}}
<div class="form-group mb-3">
    <label>{{ __('Small Title') }}</label>
    {!! Form::text('title', Arr::get($attributes, 'title', 'about us'), [
    'class' => 'form-control',
    'placeholder' => __('about us')
]) !!}
</div>

{{-- Main Heading --}}
<div class="form-group mb-3">
    <label>{{ __('Main Heading (HTML allowed)') }}</label>
    {!! Form::text('heading', Arr::get($attributes, 'heading', 'Empowering career enriching <span>lives together</span>'), [
    'class' => 'form-control',
    'placeholder' => __('Main heading')
]) !!}
</div>

{{-- Description --}}
<div class="form-group mb-3">
    <label>{{ __('Description') }}</label>
    {!! Form::textarea('description', Arr::get($attributes, 'description'), [
    'class' => 'form-control',
    'rows' => 4,
    'placeholder' => __('Short description')
]) !!}
</div>

{{-- Experience --}}
<div class="form-group mb-3">
    <label>{{ __('Years of Experience') }}</label>
    {!! Form::text('experience', Arr::get($attributes, 'experience', 25), [
    'class' => 'form-control',
    'placeholder' => __('25')
]) !!}
</div>

{{-- Button Text --}}
<div class="form-group mb-3">
    <label>{{ __('Button Text') }}</label>
    {!! Form::text('button_text', Arr::get($attributes, 'button_text', 'More about us'), [
    'class' => 'form-control'
]) !!}
</div>

{{-- Button URL --}}
<div class="form-group mb-4">
    <label>{{ __('Button URL') }}</label>
    {!! Form::text('button_url', Arr::get($attributes, 'button_url', '/about'), [
    'class' => 'form-control',
    'placeholder' => __('/about')
]) !!}
</div>

<hr>

<h5 class="mb-3">{{ __('Images') }}</h5>

{{-- Circle Image --}}
<div class="form-group mb-3">
    <label>{{ __('Circle Image') }}</label>
    {!! Form::mediaImage('circle_image', Arr::get($attributes, 'circle_image')) !!}
</div>

{{-- Image 1 --}}
<div class="form-group mb-3">
    <label>{{ __('Image 1') }}</label>
    {!! Form::mediaImage('image_1', Arr::get($attributes, 'image_1')) !!}
</div>

{{-- Image 2 --}}
<div class="form-group mb-3">
    <label>{{ __('Image 2') }}</label>
    {!! Form::mediaImage('image_2', Arr::get($attributes, 'image_2')) !!}
</div>

{{-- Image 3 --}}
<div class="form-group mb-4">
    <label>{{ __('Image 3') }}</label>
    {!! Form::mediaImage('image_3', Arr::get($attributes, 'image_3')) !!}
</div>

{{-- Features --}}
<div class="form-group mb-4">
    {!! Shortcode::fields()->tabs(
    [
        'icon' => [
            'type' => 'image',
            'title' => __('Feature Icon'),
        ],
        'title' => [
            'type' => 'text',
            'title' => __('Feature Title'),
        ],
        'description' => [
            'type' => 'textarea',
            'title' => __('Feature Description'),
        ],
    ],
    $attributes,    6,    'features',    2) !!}
</div>