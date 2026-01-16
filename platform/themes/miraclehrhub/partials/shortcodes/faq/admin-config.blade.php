<div class="mb-3">
    <label class="form-label">{{ __('Title') }}</label>
    <input name="title" value="{{ Arr::get($attributes, 'title') }}" class="form-control" />
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Subtitle') }}</label>
    <input name="subtitle" value="{{ Arr::get($attributes, 'subtitle') }}" class="form-control" />
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Years of Service') }}</label>
    <input name="years" value="{{ Arr::get($attributes, 'years') }}" class="form-control" />
    <input name="tag_line" value="{{ Arr::get($attributes, 'tag_line') }}" class="form-control" />
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Hero Title') }}</label>
    <input name="hero_title" value="{{ Arr::get($attributes, 'hero_title') }}" class="form-control" />
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Hero Content') }}</label>
    <textarea name="hero_content"  class="form-control">{{ Arr::get($attributes, 'hero_content') }}</textarea>
</div>


<div class="mb-3">
    <label class="form-label">{{ __('Categories') }}</label>
    {!! Shortcode::fields()->ids('category_ids', $attributes, $categories) !!}
</div>


<div class="mb-3">
    <label class="form-label">{{ __('Style') }}</label>
    {!! Form::customSelect('style', [
        'style-1' => __('Style :number', ['number' => 1]),    
                 
    ], Arr::get($attributes, 'style')) !!}
</div>