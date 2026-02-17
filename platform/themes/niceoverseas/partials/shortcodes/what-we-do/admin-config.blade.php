<div class="form-group">
    <label>Small Title</label>
    <input type="text" name="small_title" class="form-control"
           value="{{ $attributes['small_title'] ?? '' }}">
</div>

<div class="form-group">
    <label>Main Title (HTML allowed)</label>
    <textarea name="main_title" class="form-control"
              rows="3">{{ $attributes['main_title'] ?? '' }}</textarea>
</div>

<div class="form-group">
    <label>Description</label>
    <textarea name="description" class="form-control"
              rows="3">{{ $attributes['description'] ?? '' }}</textarea>
</div>

<hr>

<div class="form-group">
    <label>Left Image</label>
    {!! Form::mediaImage('image', $attributes['image'] ?? null) !!}
</div>

<hr>

<h5>Feature 1</h5>

<div class="form-group">
    <label>Icon 1</label>
    {!! Form::mediaImage('icon1', $attributes['icon1'] ?? null) !!}
</div>

<div class="form-group">
    <label>Feature Title 1</label>
    <input type="text" name="feature_title1" class="form-control"
           value="{{ $attributes['feature_title1'] ?? '' }}">
</div>

<hr>

<h5>Feature 2</h5>

<div class="form-group">
    <label>Icon 2</label>
    {!! Form::mediaImage('icon2', $attributes['icon2'] ?? null) !!}
</div>

<div class="form-group">
    <label>Feature Title 2</label>
    <input type="text" name="feature_title2" class="form-control"
           value="{{ $attributes['feature_title2'] ?? '' }}">
</div>

<hr>

<h5>Footer List</h5>

<div class="form-group">
    <label>List Item 1</label>
    <input type="text" name="list_item1" class="form-control"
           value="{{ $attributes['list_item1'] ?? '' }}">
</div>

<div class="form-group">
    <label>List Item 2</label>
    <input type="text" name="list_item2" class="form-control"
           value="{{ $attributes['list_item2'] ?? '' }}">
</div>

<div class="form-group">
    <label>List Item 3</label>
    <input type="text" name="list_item3" class="form-control"
           value="{{ $attributes['list_item3'] ?? '' }}">
</div>

<hr>

<div class="form-group">
    <label>Contact URL</label>
    <input type="text" name="contact_url" class="form-control"
           value="{{ $attributes['contact_url'] ?? '' }}">
</div>

<div class="form-group">
    <label>Circle Image</label>
    {!! Form::mediaImage('circle_image', $attributes['circle_image'] ?? null) !!}
</div>
