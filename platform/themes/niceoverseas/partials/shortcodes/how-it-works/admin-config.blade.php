@php
    $steps = [];

    foreach ($attributes as $key => $value) {

        if (str_starts_with($key, 'process_title_')) {
            $index = str_replace('process_title_', '', $key);

            $steps[$index]['title'] = $value;
            $steps[$index]['description'] =
                $attributes['process_description_' . $index] ?? '';
            $steps[$index]['image'] =
                $attributes['process_image_' . $index] ?? '';
        }
    }

    ksort($steps);
@endphp

<div class="form-group">
    <label>Small Title</label>
    <input type="text"
           name="small_title"
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

<div class="form-group">
    <label>Button Text</label>
    <input type="text"
           name="button_text"
           class="form-control"
           value="{{ $attributes['button_text'] ?? '' }}">
</div>

<div class="form-group">
    <label>Button URL</label>
    <input type="text"
           name="button_url"
           class="form-control"
           value="{{ $attributes['button_url'] ?? '' }}">
</div>

<hr>

<h4>Process Steps</h4>

<div id="process-wrapper">
    @foreach($steps as $index => $step)
        <div class="process-item border p-3 mb-3">

            <input type="text"
                   name="process_title_{{ $index }}"
                   class="form-control"
                   value="{{ $step['title'] }}"
                   placeholder="Step Title">

            <textarea name="process_description_{{ $index }}"
                      class="form-control mt-2"
                      rows="2"
                      placeholder="Step Description">{{ $step['description'] }}</textarea>

            <div class="mt-2">
                {!! Form::mediaImage("process_image_$index", $step['image']) !!}
            </div>

            <button type="button"
                    class="btn btn-danger btn-sm mt-2 remove-process">
                Remove
            </button>
        </div>
    @endforeach
</div>

<button type="button"
        class="btn btn-primary btn-sm"
        id="add-process">
    Add Step
</button>

<script>
(function () {

    function initShortcode() {

        let processIndex = $('#process-wrapper .process-item').length;

        $(document).off('click', '#add-process')
            .on('click', '#add-process', function () {

                let index = processIndex++;

                let mediaHtml = `{!! Form::mediaImage('process_image___INDEX__', null) !!}`
                    .replace(/___INDEX__/g, index);

                let html = `
                    <div class="process-item border p-3 mb-3">
                        <input type="text"
                               name="process_title_${index}"
                               class="form-control"
                               placeholder="Step Title">

                        <textarea name="process_description_${index}"
                                  class="form-control mt-2"
                                  rows="2"
                                  placeholder="Step Description"></textarea>

                        <div class="mt-2">
                            ${mediaHtml}
                        </div>

                        <button type="button"
                                class="btn btn-danger btn-sm mt-2 remove-process">
                            Remove
                        </button>
                    </div>
                `;

                $('#process-wrapper').append(html);

                if (typeof Botble !== 'undefined') {
                    Botble.initMediaIntegrate();
                }
            });

        $(document).off('click', '.remove-process')
            .on('click', '.remove-process', function () {
                $(this).closest('.process-item').remove();
            });
    }

    $(document).on('shortcodeLoaded', initShortcode);
    initShortcode();

})();
</script>
