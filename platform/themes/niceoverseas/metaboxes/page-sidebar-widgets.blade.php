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
        onclick="addWidget()">
    + Add Widget
</button>


<script>
let sidebarWidgets = {!! $widgets ?: '[]' !!};

function renderWidgets() {

    const wrapper = document.getElementById('sidebar-widget-wrapper');
    wrapper.innerHTML = '';

    sidebarWidgets.forEach((widget, index) => {

        const type = widget.type ?? '';
        const settings = widget.settings ?? {};

        wrapper.innerHTML += `
            <div class="border p-3 mb-3">

                <div class="d-flex gap-2 mb-2">
                    <select class="form-control" onchange="updateWidgetType(${index}, this.value)">
                        <option value="">Select Widget</option>
                        <option value="service-categories" ${type === 'service-categories' ? 'selected' : ''}>
                            Service Categories
                        </option>
                        <option value="sidebar-cta" ${type === 'sidebar-cta' ? 'selected' : ''}>
                            Sidebar CTA
                        </option>
                    </select>

                    <button type="button btn-sm"
                            class="btn btn-danger btn-sm"
                            onclick="removeWidget(${index})">
                        <i class ="fa fa-times"></i>
                    </button>
                </div>

                ${renderWidgetSettings(index, type, settings)}

            </div>
        `;
    });

    updateHiddenInput();
}

function renderWidgetSettings(index, type, settings) {

    if (type === 'service-categories') {
        return `
            <input type="text"
                   class="form-control mb-2"
                   placeholder="Widget Title"
                   value="${settings.title ?? ''}"
                   onchange="updateSetting(${index}, 'title', this.value)">

            <button type="button"
                    class="btn btn-sm btn-secondary mb-2"
                    onclick="addServiceItem(${index})">
                + Add Menu Item
            </button>

            ${renderServiceItems(index, settings.items ?? [])}
        `;
    }

    if (type === 'sidebar-cta') {
        return `
            <input type="text"
                   class="form-control mb-2"
                   placeholder="Title"
                   value="${settings.title ?? ''}"
                   onchange="updateSetting(${index}, 'title', this.value)">

            <input type="text"
                   class="form-control"
                   placeholder="Phone"
                   value="${settings.phone ?? ''}"
                   onchange="updateSetting(${index}, 'phone', this.value)">
        `;
    }

    return '';
}

function renderServiceItems(widgetIndex, items) {

    let html = '';

    items.forEach((item, itemIndex) => {

        html += `
            <div class="border p-2 mb-2">

                <select class="form-control mb-2"
                        onchange="updateServiceItemType(${widgetIndex}, ${itemIndex}, this.value)">
                    <option value="">Select Type</option>
                    <option value="page" ${item.type === 'page' ? 'selected' : ''}>Page</option>
                    <option value="post" ${item.type === 'post' ? 'selected' : ''}>Post</option>
                    <option value="category" ${item.type === 'category' ? 'selected' : ''}>Post Category</option>
                    <option value="latest_from_category" ${item.type === 'latest_from_category' ? 'selected' : ''}>Latest Posts from Category</option>
                    <option value="custom" ${item.type === 'custom' ? 'selected' : ''}>Custom Link</option>
                </select>

                ${renderServiceItemFields(widgetIndex, itemIndex, item)}

                <button type="button"
                        class="btn btn-danger btn-sm mt-2"
                        onclick="removeServiceItem(${widgetIndex}, ${itemIndex})">
                    Remove
                </button>
            </div>
        `;
    });

    return html;
}

function renderServiceItemFields(widgetIndex, itemIndex, item) {

    if (item.type === 'custom') {
        return `
            <input type="text"
                   class="form-control mb-2"
                   placeholder="Label"
                   value="${item.label ?? ''}"
                   onchange="updateServiceItem(${widgetIndex}, ${itemIndex}, 'label', this.value)">

            <input type="text"
                   class="form-control"
                   placeholder="URL"
                   value="${item.url ?? ''}"
                   onchange="updateServiceItem(${widgetIndex}, ${itemIndex}, 'url', this.value)">
        `;
    }

    if (item.type === 'latest_from_category') {
        return `
            <input type="number"
                   class="form-control"
                   placeholder="Limit"
                   value="${item.limit ?? 5}"
                   onchange="updateServiceItem(${widgetIndex}, ${itemIndex}, 'limit', this.value)">
        `;
    }

    return `
        <input type="number"
               class="form-control"
               placeholder="Enter ID"
               value="${item.id ?? ''}"
               onchange="updateServiceItem(${widgetIndex}, ${itemIndex}, 'id', this.value)">
    `;
}

function addWidget() {
    sidebarWidgets.push({ type: '', settings: {} });
    renderWidgets();
}

function updateWidgetType(index, value) {
    sidebarWidgets[index].type = value;
    sidebarWidgets[index].settings = {};
    renderWidgets();
}

function updateSetting(index, key, value) {
    sidebarWidgets[index].settings[key] = value;
    updateHiddenInput();
}

function removeWidget(index) {
    sidebarWidgets.splice(index, 1);
    renderWidgets();
}

function addServiceItem(widgetIndex) {
    if (!sidebarWidgets[widgetIndex].settings.items) {
        sidebarWidgets[widgetIndex].settings.items = [];
    }
    sidebarWidgets[widgetIndex].settings.items.push({ type: '' });
    renderWidgets();
}

function updateServiceItemType(widgetIndex, itemIndex, value) {
    sidebarWidgets[widgetIndex].settings.items[itemIndex].type = value;
    renderWidgets();
}

function updateServiceItem(widgetIndex, itemIndex, key, value) {
    sidebarWidgets[widgetIndex].settings.items[itemIndex][key] = value;
    updateHiddenInput();
}

function removeServiceItem(widgetIndex, itemIndex) {
    sidebarWidgets[widgetIndex].settings.items.splice(itemIndex, 1);
    renderWidgets();
}

function updateHiddenInput() {
    document.getElementById('page_sidebar_widgets_json').value =
        JSON.stringify(sidebarWidgets);
}

renderWidgets();

</script>
