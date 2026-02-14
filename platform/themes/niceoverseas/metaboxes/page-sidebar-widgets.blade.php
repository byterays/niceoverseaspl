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
            <div class="sidebar-widget-item mb-2 d-flex gap-2">

                <select onchange="updateWidget(${index}, this.value)" class="form-control">
                    <option value="">Select Widget</option>
                    <option value="service_categories" ${widget === 'service_categories' ? 'selected' : ''}>Service Categories</option>
                    <option value="sidebar_cta" ${widget === 'sidebar_cta' ? 'selected' : ''}>Sidebar CTA</option>
                </select>

                <button type="button"
                        class="btn btn-danger btn-sm"
                        onclick="removeWidget(${index})">
                    ✕
                </button>

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
    document.getElementById('page_sidebar_widgets_json').value = JSON.stringify(sidebarWidgets);
}

function removeWidget(index) {
    sidebarWidgets.splice(index, 1);
    renderWidgets();
}

renderWidgets();

</script>
