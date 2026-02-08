<div class="form-group">
    <label>{{ __('Hero Style') }}</label>
    {!! Form::select('style', [
        'style-1' => 'Default',
        'style-2' => 'Image',
        'style-3' => 'Video',
        'style-4' => 'Slider',
    ], Arr::get($attributes, 'style'), ['class' => 'form-control hero-style-select']) !!}
</div>

{{-- STYLE 1 --}}
<div class="hero-style-field" data-style="style-1">

    <div class="form-group mb-3">
        <label>{{ __('Small Heading') }}</label>
        {!! Form::text('small_heading', Arr::get($attributes, 'small_heading'), [
            'class' => 'form-control',
            'placeholder' => 'Welcome to Nice Overseas'
        ]) !!}
    </div>

    <div class="form-group mb-3">
        <label>{{ __('Main Heading') }}</label>
        {!! Form::textarea('main_heading', Arr::get($attributes, 'main_heading'), [
            'class' => 'form-control',
            'rows' => 2,
            'placeholder' => 'Empowering businesses with strategic <span>HR solutions</span>'
        ]) !!}
        <small class="text-muted">HTML allowed (for &lt;span&gt;)</small>
    </div>

    <div class="form-group mb-3">
        <label>{{ __('Bullet Points') }}</label>
        {!! Form::textarea('features', Arr::get($attributes, 'features'), [
            'class' => 'form-control',
            'rows' => 4,
            'placeholder' => "Smart HR Solutions\nTalent Meets Opportunity\nStrategic Hiring Solutions"
        ]) !!}
        <small class="text-muted">One item per line</small>
    </div>

    <div class="form-group mb-3">
        <label>{{ __('Button Label') }}</label>
        {!! Form::text('button_label', Arr::get($attributes, 'button_label'), [
            'class' => 'form-control',
            'placeholder' => 'Get Started Today'
        ]) !!}
    </div>

    <div class="form-group mb-3">
        <label>{{ __('Button Link') }}</label>
        {!! Form::text('button_link', Arr::get($attributes, 'button_link'), [
            'class' => 'form-control',
            'placeholder' => '/contact'
        ]) !!}
    </div>

    <div class="form-group mb-3">
        <label>{{ __('Hero Image') }}</label>
        {!! Form::mediaImage('hero_image', Arr::get($attributes, 'hero_image')) !!}
    </div>
</div>


{{-- STYLE 2 --}}
{{-- ================= STYLE 2 ================= --}}
<div class="hero-style-field" data-style="style-2">

    <div class="form-group mb-3">
        <label>{{ __('Small Heading') }}</label>
        {!! Form::text('small_heading', Arr::get($attributes, 'small_heading'), [
            'class' => 'form-control',
            'placeholder' => 'welcome to Niceoverseas'
        ]) !!}
    </div>

    <div class="form-group mb-3">
        <label>{{ __('Main Heading') }}</label>
        {!! Form::textarea('main_heading', Arr::get($attributes, 'main_heading'), [
            'class' => 'form-control',
            'rows' => 2,
            'placeholder' => 'Empowering businesses with strategic <span>HR solutions</span>'
        ]) !!}
        <small class="text-muted">HTML allowed</small>
    </div>

    <div class="form-group mb-3">
        <label>{{ __('Bullet Points') }}</label>
        {!! Form::textarea('features', Arr::get($attributes, 'features'), [
            'class' => 'form-control',
            'rows' => 4,
            'placeholder' => "Smart HR Solutions\nTalent Meets Opportunity\nStrategic Hiring Solutions"
        ]) !!}
    </div>

    <div class="form-group mb-3">
        <label>{{ __('Button Label') }}</label>
        {!! Form::text('button_label', Arr::get($attributes, 'button_label'), [
            'class' => 'form-control',
        ]) !!}
    </div>

    <div class="form-group mb-3">
        <label>{{ __('Button Link') }}</label>
        {!! Form::text('button_link', Arr::get($attributes, 'button_link'), [
            'class' => 'form-control',
        ]) !!}
    </div>

    <div class="form-group mb-3">
        <label>{{ __('Background Image') }}</label>
        {!! Form::mediaImage('background_image', Arr::get($attributes, 'background_image')) !!}
        <small class="text-muted">Used as hero background</small>
    </div>

</div>


{{-- STYLE 3 --}}
<div class="hero-style-field" data-style="style-3">

    <div class="form-group mb-3">
        <label>{{ __('Small Heading') }}</label>
        {!! Form::text('small_heading', Arr::get($attributes, 'small_heading'), [
            'class' => 'form-control',
        ]) !!}
    </div>

    <div class="form-group mb-3">
        <label>{{ __('Main Heading') }}</label>
        {!! Form::textarea('main_heading', Arr::get($attributes, 'main_heading'), [
            'class' => 'form-control',
            'rows' => 2,
        ]) !!}
        <small class="text-muted">HTML allowed</small>
    </div>

    <div class="form-group mb-3">
        <label>{{ __('Bullet Points') }}</label>
        {!! Form::textarea('features', Arr::get($attributes, 'features'), [
            'class' => 'form-control',
            'rows' => 4,
            'placeholder'=>"Smart HR Solutions\nTalent Meets Opportunity\nStrategic Hiring Solutions"
        ]) !!}
    </div>

    <div class="form-group mb-3">
        <label>{{ __('Button Label') }}</label>
        {!! Form::text('button_label', Arr::get($attributes, 'button_label'), [
            'class' => 'form-control',
        ]) !!}
    </div>

    <div class="form-group mb-3">
        <label>{{ __('Button Link') }}</label>
        {!! Form::text('button_link', Arr::get($attributes, 'button_link'), [
            'class' => 'form-control',
        ]) !!}
    </div>

    {{-- Video Source --}}
    <div class="form-group mb-3">
        <label>{{ __('Background Video URL (MP4)') }}</label>
        {!! Form::text('video_url', Arr::get($attributes, 'video_url'), [
            'class' => 'form-control',
            'placeholder' => 'https://example.com/video.mp4'
        ]) !!}
        <small class="text-muted">Self-hosted MP4 recommended</small>
    </div>

</div>


{{-- STYLE 4 --}}

<div class="hero-style-field" data-style="style-4">

    {!! Shortcode::fields()->tabs([
        'slide_image' => [
            'type'  => 'image',
            'title' => __('Slide Background Image'),
        ],
        'small_heading' => [
            'type'  => 'text',
            'title' => __('Small Heading'),
        ],
        'main_heading' => [
            'type'  => 'textarea',
            'title' => __('Main Heading (HTML allowed)'),
        ],
        'features' => [
            'type'  => 'textarea',
            'title' => __('Bullet Points (one per line)'),
        ],
        'button_label' => [
            'type'  => 'text',
            'title' => __('Button Label'),
        ],
        'button_link' => [
            'type'  => 'text',
            'title' => __('Button Link'),
        ],
    ], $attributes) !!}
</div>



{{-- ================= JS (AJAX SAFE) ================= --}}
<script type="text/javascript">
(function ($) {

    function toggleHeroFields() {
        const style = $('.hero-style-select').val();

        $('.hero-style-field').each(function () {
            const $block = $(this);
            const isActive = $block.data('style') === style;

            // show / hide
            $block.toggle(isActive);

            // IMPORTANT:
            // enable/disable AFTER values are already there
            $block.find('input, textarea, select').each(function () {
                $(this).prop('disabled', !isActive);
            });
        });
    }

    // Wait for modal + values to be ready
    setTimeout(toggleHeroFields, 100);

    $(document).on('change', '.hero-style-select', toggleHeroFields);

})(jQuery);
</script>