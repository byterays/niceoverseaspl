@php
    $featureTitles = (array) ($attributes['feature_title'] ?? []);
    $featureIcons  = (array) ($attributes['feature_icon'] ?? []);
    $listItems     = (array) ($attributes['list_item'] ?? []);
    $featureIndex = count($featureTitles);
@endphp

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

<h4>Features</h4>

<div id="features-wrapper">
    @foreach($featureTitles as $index => $title)
        <div class="feature-item border p-3 mb-3">
            <div class="feature-icon-wrapper">
                {!! Form::mediaImage("feature_icon[{$index}]", $featureIcons[$index] ?? null) !!}
            </div>
            <input type="text"
                   name="feature_title[]"
                   class="form-control mt-2"
                   placeholder="Feature title"
                   value="{{ $title }}">
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
    @foreach($listItems as $item)
        <div class="list-item mb-2">
            <input type="text"
                   name="list_item[]"
                   class="form-control d-inline-block w-75"
                   placeholder="List item"
                   value="{{ $item }}">
            <button type="button" class="btn btn-danger btn-sm remove-list">
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

    function initWhatWeDoShortcode() {

        let featureIndex = document.querySelectorAll('#features-wrapper .feature-item').length;

        // ADD FEATURE
        $(document).off('click', '#add-feature').on('click', '#add-feature', function (e) {
            e.preventDefault();

            const index = featureIndex++;
            const mediaHtml = `{!! Form::mediaImage('feature_icon[__INDEX__]', null) !!}`
                .replace(/__INDEX__/g, index);

            const html = `
                <div class="feature-item border p-3 mb-3">
                    <div class="feature-icon-wrapper">
                        ${mediaHtml}
                    </div>

                    <input type="text"
                           name="feature_title[]"
                           class="form-control mt-2"
                           placeholder="Feature title">

                    <button type="button"
                            class="btn btn-danger btn-sm mt-2 remove-feature">
                        Remove
                    </button>
                </div>
            `;

            $('#features-wrapper').append(html);

            // re-init media
            if (typeof Botble !== 'undefined' && Botble.initMediaIntegrate) {
                Botble.initMediaIntegrate();
            }
        });


        // ADD LIST
        $(document).off('click', '#add-list').on('click', '#add-list', function (e) {
            e.preventDefault();

            const html = `
                <div class="list-item mb-2">
                    <input type="text"
                           name="list_item[]"
                           class="form-control d-inline-block w-75"
                           placeholder="List item">

                    <button type="button"
                            class="btn btn-danger btn-sm remove-list">
                        Remove
                    </button>
                </div>
            `;

            $('#lists-wrapper').append(html);
        });


        // REMOVE FEATURE
        $(document).off('click', '.remove-feature').on('click', '.remove-feature', function () {
            $(this).closest('.feature-item').remove();
        });

        // REMOVE LIST
        $(document).off('click', '.remove-list').on('click', '.remove-list', function () {
            $(this).closest('.list-item').remove();
        });

    }

    // IMPORTANT:
    // Botble fires this when shortcode modal loads
    $(document).on('shortcodeLoaded', function () {
        initWhatWeDoShortcode();
    });

    // Also run once (fallback)
    initWhatWeDoShortcode();

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