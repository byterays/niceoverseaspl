@php
    use Botble\Widget\Models\Widget;

    $widgetTypes = theme_sidebar_widget_types();
    $globalWidgets = Widget::all();
@endphp

<div id="sidebar-widgets-wrapper">

    @foreach ($widgets as $widget)
        <div class="sidebar-widget-box mb-3 p-3 border">
            <div class="form-group">
                <label>{{ __('Widget Type') }}</label>
                <select name="sidebar_widgets[]" class="form-control">
                    <option value="">-- Select Global Widget --</option>
                    @foreach ($globalWidgets as $widgetItem)
                        <option value="{{ $widgetItem->id }}" @selected(($widget ?? null) == $widgetItem->id)>
                            {{ $widgetItem->name }}
                        </option>
                    @endforeach
                </select>
            </div>

            <div class="form-group">
                <label>{{ __('Content') }}</label>
                <textarea name="sidebar_widgets[][content]" class="form-control"
                    rows="4">{{ $widget['content'] ?? '' }}</textarea>
            </div>

            <button type="button" class="btn btn-danger btn-sm remove-widget">
                {{ __('Remove') }}
            </button>
        </div>
    @endforeach

</div>

<button type="button" class="btn btn-primary btn-sm" id="add-sidebar-widget">
    + {{ __('Add Widget') }}
</button>

<script>
    (function () {
        const wrapper = document.getElementById('sidebar-widgets-wrapper');
        const addBtn = document.getElementById('add-sidebar-widget');

        addBtn.addEventListener('click', function () {
            wrapper.insertAdjacentHTML('beforeend', `
            <div class="sidebar-widget-box mb-3 p-3 border">
                <div class="form-group">
                    <label>Widget Type</label>
                    <select name="sidebar_widgets[]" class="form-control">
                        <option value="">-- Select Global Widget --</option>
                        @foreach ($globalWidgets as $widgetItem)
                            <option value="{{ $widgetItem->id }}">
                                {{ $widgetItem->name }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <label>Content</label>
                    <textarea
                        name="sidebar_widgets[][content]"
                        class="form-control"
                        rows="4"
                    ></textarea>
                </div>

                <button type="button" class="btn btn-danger btn-sm remove-widget">
                    Remove
                </button>
            </div>
        `);
        });

        document.addEventListener('click', function (e) {
            if (e.target.classList.contains('remove-widget')) {
                e.target.closest('.sidebar-widget-box').remove();
            }
        });
    })();
</script>