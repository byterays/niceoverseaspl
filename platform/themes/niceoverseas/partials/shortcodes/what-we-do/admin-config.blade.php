@php
    $features = [];

    foreach ($attributes as $key => $value) {
        if (str_starts_with($key, 'feature_title_')) {
            $index = str_replace('feature_title_', '', $key);
            $features[$index]['title'] = $value;
            $features[$index]['icon'] = $attributes['feature_icon_' . $index] ?? '';
        }
    }

    ksort($features);

    $listItems = [];
    foreach ($attributes as $key => $value) {
        if (str_starts_with($key, 'list_item_')) {
            $listItems[] = $value;
        }
    }
@endphp

<div class="form-group">
    <label>Small Title</label>
    <input type="text" name="small_title" class="form-control"
           value="{{ $attributes['small_title'] ?? '' }}">
</div>

<div class="form-group">
    <label>Main Title</label>
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

<h4>Features</h4>

<div id="features-wrapper">
    @foreach($features as $index => $feature)
        <div class="feature-item border p-3 mb-3">
            {!! Form::mediaImage("feature_icon_$index", $feature['icon']) !!}
            <input type="text"
                   name="feature_title_{{ $index }}"
                   class="form-control mt-2"
                   value="{{ $feature['title'] }}"
                   placeholder="Feature title">
            <button type="button" class="btn btn-danger btn-sm mt-2 remove-feature">
                Remove
            </button>
        </div>
    @endforeach
</div>

<button type="button" class="btn btn-primary btn-sm mb-4" id="add-feature">
    Add Feature
</button>

<hr>

<h4>Footer List Items</h4>

<div id="lists-wrapper">
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

<button type="button" class="btn btn-primary btn-sm mt-2" id="add-list">
    Add List Item
</button>

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

<script>
(function () {

    function initShortcode() {

        let featureIndex = $('#features-wrapper .feature-item').length;
        let listIndex = $('#lists-wrapper .list-item').length;

        $(document).off('click', '#add-feature')
            .on('click', '#add-feature', function () {

                let index = featureIndex++;

                let mediaHtml = `{!! Form::mediaImage('feature_icon___INDEX__', null) !!}`
                    .replace(/___INDEX__/g, index);

                let html = `
                    <div class="feature-item border p-3 mb-3">
                        ${mediaHtml}
                        <input type="text"
                               name="feature_title_${index}"
                               class="form-control mt-2"
                               placeholder="Feature title">
                        <button type="button"
                                class="btn btn-danger btn-sm mt-2 remove-feature">
                            Remove
                        </button>
                    </div>
                `;

                $('#features-wrapper').append(html);

                if (typeof Botble !== 'undefined') {
                    Botble.initMediaIntegrate();
                }
            });

        $(document).off('click', '#add-list')
            .on('click', '#add-list', function () {

                let index = listIndex++;

                $('#lists-wrapper').append(`
                    <div class="list-item mb-2">
                        <input type="text"
                               name="list_item_${index}"
                               class="form-control"
                               placeholder="List item">
                        <button type="button"
                                class="btn btn-danger btn-sm remove-list">
                            Remove
                        </button>
                    </div>
                `);
            });

        $(document).off('click', '.remove-feature')
            .on('click', '.remove-feature', function () {
                $(this).closest('.feature-item').remove();
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



<style>
.feature-icon-wrapper {
    margin-bottom: 10px;
}
.feature-icon-wrapper .image-box {
    width: 100%;
}
.list-item .form-control {
    width: calc(100% - 90px) !important;
    display: inline-block !important;
    margin-right: 10px;
}
</style>