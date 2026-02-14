@php
    $widgets = old(
        'page_sidebar_widgets_json',
        json_encode($widgets ?? [])
    );
@endphp

<input type="hidden"
       name="page_sidebar_widgets_json"
       id="page_sidebar_widgets_json"
       value='{{ $widgets }}'>

<div id="sidebar-widget-wrapper"></div>

<button type="button"
        class="btn btn-sm btn-primary mt-2"
        onclick="addSidebarWidget()">
    + Add Widget
</button>

<script>

let sidebarWidgets = {!! $widgets ?: '[]' !!};

function renderWidgets() {
    const wrapper = document.getElementById('sidebar-widget-wrapper');
    wrapper.innerHTML = '';

    sidebarWidgets.forEach((widget, index) => {
        wrapper.innerHTML += `
            <div class="mb-2">
                <select onchange="updateWidget(${index}, this.value)" class="form-control">
                    <option value="">Select Widget</option>
                    <option value="service-categories" ${widget === 'service-categories' ? 'selected' : ''}>Service Categories</option>
                    <option value="sidebar-cta" ${widget === 'sidebar-cta' ? 'selected' : ''}>Sidebar CTA</option>
                </select>
            </div>
        `;
    });

    document.getElementById('page_sidebar_widgets_json').value = JSON.stringify(sidebarWidgets);
}

function addSidebarWidget() {
    sidebarWidgets.push('');
    renderWidgets();
}

function updateWidget(index, value) {
    sidebarWidgets[index] = value;
    renderWidgets();
}

renderWidgets();

</script>
