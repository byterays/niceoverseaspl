<div class="mb-3">
    <label class="form-label">{{ __('Title') }}</label>
    <input name="title" value="{{ Arr::get($attributes, 'title') }}" class="form-control" />
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Subtitle') }}</label>
    <input name="subtitle" value="{{ Arr::get($attributes, 'subtitle') }}" class="form-control" />
</div>


<div class="mb-3">
    <label class="form-label">{{ __('Gallery') }}</label>
    {!! Form::select('gallery_id', $galleries,  Arr::get($attributes, 'gallery_id'), ['class' => 'form-control']) !!}
</div>


<div class="mb-3">
    <label class="form-label">{{ __('Style') }}</label>
    {!! Form::customSelect('style', [
        'style-1' => __('Style :number', ['number' => 1]),    
                 
    ], Arr::get($attributes, 'style')) !!}
</div>