<div class="form-group mb-3">
    <label class="control-label">{{ __('Subtitle') }}</label>
    <input type="text"
           name="subtitle"
           value="{{ Arr::get($attributes, 'subtitle') }}"
           class="form-control">
</div>

<div class="form-group mb-3">
    <label class="control-label">{{ __('Title') }}</label>
    <input type="text"
           name="title"
           value="{{ Arr::get($attributes, 'title') }}"
           class="form-control">
</div>

<div class="form-group mb-3">
    <label class="control-label">{{ __('Highlight Text') }}</label>
    <input type="text"
           name="highlight_text"
           value="{{ Arr::get($attributes, 'highlight_text') }}"
           class="form-control">
</div>

<div class="form-group mb-3">
    <label class="control-label">{{ __('Description') }}</label>
    <textarea name="description"
              rows="3"
              class="form-control">{{ Arr::get($attributes, 'description') }}</textarea>
</div>

<div class="form-group mb-3">
    <label class="control-label">{{ __('Main Image') }}</label>
    {!! Form::mediaImage('image', Arr::get($attributes, 'image')) !!}
</div>

<div class="form-group mb-3">
    <label class="control-label">{{ __('Video URL') }}</label>
    <input type="text"
           name="video_url"
           value="{{ Arr::get($attributes, 'video_url') }}"
           class="form-control">
</div>

<hr>

<h5 class="mb-3">{{ __('Feature List') }}</h5>

<div class="repeater-wrapper"
     data-bb-toggle="shortcode-repeater"
     data-name="features"
     data-value='@json(json_decode(Arr::get($attributes, "features", "[]"), true))'>

    <div class="repeater-template">
        <div class="form-group mb-3">
            <label>{{ __('Feature Text') }}</label>
            <input type="text" data-name="text" class="form-control">
        </div>
    </div>
</div>

<hr>

<h5 class="mb-3">{{ __('Bottom Items') }}</h5>

<div class="repeater-wrapper"
     data-bb-toggle="shortcode-repeater"
     data-name="items"
     data-value='@json(json_decode(Arr::get($attributes, "items", "[]"), true))'>

    <div class="repeater-template">

        <div class="form-group mb-3">
            <label>{{ __('Icon') }}</label>
            {!! Form::mediaImage('icon', null, ['data-name' => 'icon']) !!}
        </div>

        <div class="form-group mb-3">
            <label>{{ __('Title') }}</label>
            <input type="text" data-name="title" class="form-control">
        </div>

        <div class="form-group mb-3">
            <label>{{ __('Description') }}</label>
            <textarea data-name="description" rows="2" class="form-control"></textarea>
        </div>

    </div>
</div>
