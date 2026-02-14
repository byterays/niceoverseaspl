<div id="sidebar-widget-wrapper">

    @if (!empty($widgets))
        @foreach ($widgets as $index => $widget)
            <div class="sidebar-widget-item mb-2">
                <select name="page_sidebar_widgets[]" class="form-control">
                    <option value="">Select Widget</option>
                    <option value="service_categories"
                        {{ $widget == 'service_categories' ? 'selected' : '' }}>
                        Service Categories
                    </option>
                    <option value="sidebar_cta"
                        {{ $widget == 'sidebar_cta' ? 'selected' : '' }}>
                        Sidebar CTA
                    </option>
                </select>
            </div>
        @endforeach
    @endif

</div>

<button type="button" class="btn btn-sm btn-primary mt-2" onclick="addSidebarWidget()">
    + Add Widget
</button>

<script>
function addSidebarWidget() {
    const wrapper = document.getElementById('sidebar-widget-wrapper');
    const div = document.createElement('div');
    div.classList.add('sidebar-widget-item', 'mb-2');
    div.innerHTML = `
        <select name="page_sidebar_widgets[]" class="form-control">
            <option value="">Select Widget</option>
            <option value="service_categories">Service Categories</option>
            <option value="sidebar_cta">Sidebar CTA</option>
        </select>
    `;
    wrapper.appendChild(div);
}
</script>
