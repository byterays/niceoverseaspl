@php
    $items = [];
    $listItems = [];

    foreach ($attributes as $key => $value) {

        if (str_starts_with($key, 'item_title_')) {
            $index = str_replace('item_title_', '', $key);

            $items[$index]['title'] = $value;
            $items[$index]['icon'] =
                $attributes['item_icon_' . $index] ?? '';
            $items[$index]['description'] =
                $attributes['item_description_' . $index] ?? '';
        }

        if (str_starts_with($key, 'list_item_')) {
            $listItems[] = $value;
        }
    }

    ksort($items);
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

<h4>Bullet List</h4>

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
    <label>Right Image</label>
    {!! Form::mediaImage('image', $attributes['image'] ?? null) !!}
</div>

<div class="form-group">
    <label>Video URL</label>
    <input type="text"
           name="video_url"
           class="form-control"
           value="{{ $attributes['video_url'] ?? '' }}">
</div>

<hr>

<h4>Bottom Items</h4>

<div id="items-wrapper">
    @foreach($items as $index => $item)
        <div class="item-box border p-3 mb-3">
            {!! Form::mediaImage("item_icon_$index", $item['icon']) !!}
            <input type="text"
                   name="item_title_{{ $index }}"
                   class="form-control mt-2"
                   value="{{ $item['title'] }}"
                   placeholder="Item title">
            <textarea name="item_description_{{ $index }}"
                      class="form-control mt-2"
                      rows="2"
                      placeholder="Item description">{{ $item['description'] }}</textarea>

            <button type="button"
                    class="btn btn-danger btn-sm mt-2 remove-item">
                Remove
            </button>
        </div>
    @endforeach
</div>

<button type="button"
        class="btn btn-primary btn-sm"
        id="add-item">
    Add Bottom Item
</button>

<script>
(function () {

    function initShortcode() {

        let listIndex = $('#list-wrapper .list-item').length;
        let itemIndex = $('#items-wrapper .item-box').length;

        // Add Bullet List
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

        // Remove List
        $(document).off('click', '.remove-list')
            .on('click', '.remove-list', function () {
                $(this).closest('.list-item').remove();
            });

        // Add Bottom Item
        $(document).off('click', '#add-item')
            .on('click', '#add-item', function () {

                let index = itemIndex++;

                let mediaHtml = `{!! Form::mediaImage('item_icon___INDEX__', null) !!}`
                    .replace(/___INDEX__/g, index);

                let html = `
                    <div class="item-box border p-3 mb-3">
                        ${mediaHtml}
                        <input type="text"
                               name="item_title_${index}"
                               class="form-control mt-2"
                               placeholder="Item title">
                        <textarea name="item_description_${index}"
                                  class="form-control mt-2"
                                  rows="2"
                                  placeholder="Item description"></textarea>
                        <button type="button"
                                class="btn btn-danger btn-sm mt-2 remove-item">
                            Remove
                        </button>
                    </div>
                `;

                $('#items-wrapper').append(html);

                if (typeof Botble !== 'undefined') {
                    Botble.initMediaIntegrate();
                }
            });

        // Remove Item
        $(document).off('click', '.remove-item')
            .on('click', '.remove-item', function () {
                $(this).closest('.item-box').remove();
            });
    }

    $(document).on('shortcodeLoaded', initShortcode);
    initShortcode();

})();
</script>
