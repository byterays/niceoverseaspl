<div class="mb-3">
    <label class="form-label">{{ __('Name') }}</label>
    <input name="name" value="{{ Arr::get($attributes, 'name') }}" class="form-control" />
</div>
<div class="mb-3">
    <label class="form-label">{{ __('Position') }}</label>
    <input name="position" value="{{ Arr::get($attributes, 'position') }}" class="form-control" />
</div>
<div class="mb-3">
    <label class="form-label">{{ __('Photo') }}</label>
    {!! Form::mediaImage('photo', Arr::get($attributes, 'photo')) !!}
</div>
<div class="mb-3">
    <label class="form-label">{{ __('Profiles List') }}</label>
    <textarea name="profile_list" class="form-control">{{ Arr::get($attributes, 'profile_list') }}</textarea>
</div>
<div class="mb-3">
    <label class="form-label">{{ __('Message') }}</label>
    <textarea name="message" class="form-control">{{ Arr::get($attributes, 'message') }}</textarea>
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Style') }}</label>
    {!! Form::customSelect('style', [
        'style-1' => __('Style :number', ['number' => 1]),          
    ], Arr::get($attributes, 'style')) !!}
</div>
<div class="mb-3">
    <label class="form-label">{{ __('Profiles') }}</label>
    {!! Shortcode::fields()->tabs([
        'company_logo' => [
            'title' => __('Company Logo'),
            'type' => 'image',
        ],
        'profile_thumb' => [
            'title' => __('Prole Thumb'),
            'type' => 'image',
        ],
        'website_text' => [
            'title' => __('Website Button Text'),
            'type' => 'website Text',
        ],
        'website_link' => [
            'title' => __('Website Button Url'),
            'type' => 'text',
        ],     
        'profile_text' => [
            'title' => __('Profile Button Text'),
            'type' => 'text',
        ],
        'profile_link' => [
            'title' => __('Profile Butotn Url'),
            'type' => 'text',
        ],   
    ], $attributes) !!}
</div>





