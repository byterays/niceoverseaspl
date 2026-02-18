@php
    $bodyItems = [];
    $listItems = [];

    foreach ($attributes as $key => $value) {

        if (str_starts_with($key, 'body_title_')) {
            $index = str_replace('body_title_', '', $key);

            $bodyItems[$index]['title'] = $value;
            $bodyItems[$index]['description'] =
                $attributes['body_description_' . $index] ?? '';
        }

        if (str_starts_with($key, 'list_item_')) {
            $listItems[] = $value;
        }
    }

    ksort($bodyItems);
@endphp

<div class="form-group">
    <label>Small Title</label>
    <input type="text" name="small_title"
           class="form-control"
           value="{{ $attributes['small_title'] ?? '' }}">
</div>

<div class="form-group">
    <label>Main Title (HTML allowed)</label>
    <textarea name="main_title"
              class="form-control"
              rows="3">{{ $attributes['main_title'] ?? '' }}</textarea>
</div>

<div class="form-group">
    <label>Description</label>
    <textarea name="description"
              class="form-control"
              rows="3">{{ $attributes['description'] ?? '' }}</textarea>
</div>

<hr>

<h4>Body Items</h4>

<div id="body-wrapper">
    @foreach($bodyItems as $index => $item)
        <div class="body-item border p-3 mb-3">
            <input type="text"
                   name="body_title_{{ $index }}"
                   class="form-control"
                   value="{{ $item['title'] }}"
                   placeholder="Title">

            <textarea name="body_description_{{ $index }}"
                      class="form-control mt-2"
                      rows="2"
                      placeholder="Description">{{ $item['description'] }}</textarea>

            <button type="button"
                    class="btn btn-danger btn-sm mt-2 remove-body">
                Remove
            </button>
        </div>
    @endforeach
</div>

<button type="button"
        class="btn btn-primary btn-sm"
        id="add-body">
    Add Body Item
</button>

<hr>

<h4>Footer List</h4>

<div id="list-wrapper">
    @foreach($listItems as $index => $item)
        <div class="list-item mb-2">
            <input type="text"
                   name="list_item_{{ $index }}"
                   class="form-control"
                   value="{{ $item }}">
            <button type="button"
                    class="btn btn-danger btn-sm remove-list">
                Remove
            </button>
        </div>
    @endforeach
</div>

<button type="button"
        class="btn btn-primary btn-sm mt-2"
        id="add-list">
    Add List Item
</button>

<hr>

<div class="form-group">
    <label>Image 1</label>
    {!! Form::mediaImage('image_1', $attributes['image_1'] ?? null) !!}
</div>

<div class="form-group">
    <label>Circle Image</label>
    {!! Form::mediaImage('circle_image', $attributes['circle_image'] ?? null) !!}
</div>

<div class="form-group">
    <label>Circle URL</label>
    <input type="text"
           name="circle_url"
           class="form-control"
           value="{{ $attributes['circle_url'] ?? '' }}">
</div>

<div class="form-group">
    <label>Image 2</label>
    {!! Form::mediaImage('image_2', $attributes['image_2'] ?? null) !!}
</div>

<div class="form-group">
    <label>Counter Icon</label>
    {!! Form::mediaImage('counter_icon', $attributes['counter_icon'] ?? null) !!}
</div>

<div class="form-group">
    <label>Counter Number</label>
    <input type="text"
           name="counter_number"
           class="form-control"
           value="{{ $attributes['counter_number'] ?? '' }}">
</div>

<div class="form-group">
    <label>Counter Text</label>
    <input type="text"
           name="counter_text"
           class="form-control"
           value="{{ $attributes['counter_text'] ?? '' }}">
</div>

<script>
(function () {

    function initShortcode() {

        let bodyIndex = $('#body-wrapper .body-item').length;
        let listIndex = $('#list-wrapper .list-item').length;

        $(document).off('click', '#add-body')
            .on('click', '#add-body', function () {

                $('#body-wrapper').append(`
                    <div class="body-item border p-3 mb-3">
                        <input type="text"
                               name="body_title_${bodyIndex}"
                               class="form-control"
                               placeholder="Title">
                        <textarea name="body_description_${bodyIndex++}"
                                  class="form-control mt-2"
                                  rows="2"
                                  placeholder="Description"></textarea>
                        <button type="button"
                                class="btn btn-danger btn-sm mt-2 remove-body">
                            Remove
                        </button>
                    </div>
                `);
            });

        $(document).off('click', '.remove-body')
            .on('click', '.remove-body', function () {
                $(this).closest('.body-item').remove();
            });

        $(document).off('click', '#add-list')
            .on('click', '#add-list', function () {

                $('#list-wrapper').append(`
                    <div class="list-item mb-2">
                        <input type="text"
                               name="list_item_${listIndex++}"
                               class="form-control"
                               placeholder="List item">
                        <button type="button"
                                class="btn btn-danger btn-sm remove-list">
                            Remove
                        </button>
                    </div>
                `);
            });

        $(document).off('click', '.remove-list')
            .on('click', '.remove-list', function () {
                $(this).closest('.list-item').remove();
            });
    }

    $(document).on('shortcodeLoaded', initShortcode);
    initShortcode();

})();
</script>
