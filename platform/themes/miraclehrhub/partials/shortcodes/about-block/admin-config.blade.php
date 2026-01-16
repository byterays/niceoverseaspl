<div class="mb-3">
    <label class="form-label">{{ __('Title') }}</label>
    <input name="title" value="{{ Arr::get($attributes, 'title') }}" class="form-control" />
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Subtitle') }}</label>
    <input name="subtitle" value="{{ Arr::get($attributes, 'subtitle') }}" class="form-control" />
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Descripton') }}</label>
    <textarea name="description" class="form-control">{{ Arr::get($attributes, 'description') }}</textarea>
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Image') }}</label>
    {!! Form::mediaImage('display_image', Arr::get($attributes, 'display_image')) !!}
</div>



<div class="mb-3">
    <label class="form-label">{{ __('CTA Text') }}</label>
    <input name="cta_text" value="{{ Arr::get($attributes, 'cta_text') }}" class="form-control" />
</div>

<div class="mb-3">
    <label class="form-label">{{ __('CTA Phone') }}</label>
    <input name="cta_phone" value="{{ Arr::get($attributes, 'cta_phone') }}" class="form-control" />
</div>

<div class="mb-3">
    <label class="form-label">{{ __('CTA Button Text') }}</label>
    <input name="cta_link_text" value="{{ Arr::get($attributes, 'cta_link_text') }}" class="form-control" />
</div>

<div class="mb-3">
    <label class="form-label">{{ __('CTA Link Url') }}</label>
    <input name="cta_link_url" value="{{ Arr::get($attributes, 'cta_link_url') }}" class="form-control" />
</div>

<div class="mb-3">
    {!! Shortcode::fields()->tabs([
    'list-items' => [
    'item' => __('Title')
    ],
    ], $attributes) !!}
</div>