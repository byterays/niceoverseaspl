@php
    $widgets = old(
        'page_sidebar_widgets_json',
        json_encode($widgets ?? [])
    );

    use Botble\Page\Models\Page;
    use Botble\Blog\Models\Post;
    use Botble\Blog\Models\Category;

    $pages = Page::pluck('name', 'id');
    $posts = Post::pluck('name', 'id');
    $categories = Category::pluck('name', 'id');
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
window.availableContentOptions = {
    page: @json($pages),
    post: @json($posts),
    category: @json($categories),
};
</script>

<script>
let sidebarWidgets = {!! $widgets ?: '[]' !!};
let activeWidget = null;
let dragIndex = null;
let serviceDragIndex = null;

/* ========= RENDER MAIN WIDGETS ========= */

function renderWidgets() {
    const wrapper = document.getElementById('sidebar-widget-wrapper');
    wrapper.innerHTML = '';

    sidebarWidgets.forEach((widget, index) => {

        const type = widget.type ?? '';
        const settings = widget.settings ?? {};

        wrapper.innerHTML += `
            <div class="card mb-3" draggable="true"
                 ondragstart="dragStart(event, ${index})"
                 ondragover="dragOver(event)"
                 ondrop="dropWidget(event, ${index})">

                <div class="card-header d-flex justify-content-between align-items-center"
                     onclick="toggleWidget(${index})"
                     style="cursor:pointer;">
                    <strong>${type || 'New Widget'}</strong>
                    <span>☰</span>
                </div>

                <div class="card-body ${activeWidget === index ? '' : 'd-none'}">

                    <div class="d-flex gap-2 mb-2">
                        <select class="form-control"
                                onchange="updateWidgetType(${index}, this.value)">
                            <option value="">Select Widget</option>
                            <option value="service-categories" ${type==='service-categories'?'selected':''}>Service Categories</option>
                            <option value="sidebar-cta" ${type==='sidebar-cta'?'selected':''}>Sidebar CTA</option>
                        </select>

                        <button type="button"
                                class="btn btn-danger btn-sm"
                                onclick="removeWidget(${index})">
                            ✕
                        </button>
                    </div>

                    ${renderWidgetSettings(index, type, settings)}

                </div>
            </div>
        `;
    });

    updateHiddenInput();
}

/* ========= SETTINGS RENDERER ========= */

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

/* ========= SERVICE ITEMS ========= */

function renderServiceItems(widgetIndex, items) {
    let html = '';

    items.forEach((item, itemIndex) => {
        html += `
            <div class="border p-2 mb-2"
                 draggable="true"
                 ondragstart="dragServiceStart(event, ${widgetIndex}, ${itemIndex})"
                 ondragover="dragOver(event)"
                 ondrop="dropServiceItem(event, ${widgetIndex}, ${itemIndex})">

                <select class="form-control mb-2"
                        onchange="updateServiceItemType(${widgetIndex}, ${itemIndex}, this.value)">
                    <option value="">Select Type</option>
                    <option value="page" ${item.type==='page'?'selected':''}>Page</option>
                    <option value="post" ${item.type==='post'?'selected':''}>Post</option>
                    <option value="category" ${item.type==='category'?'selected':''}>Post Category</option>
                    <option value="latest_from_category" ${item.type==='latest_from_category'?'selected':''}>Latest Posts from Category</option>
                    <option value="custom" ${item.type==='custom'?'selected':''}>Custom Link</option>
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

/* ========= CLEAN OPTION BUILDER ========= */

function buildSelectOptions(type, selectedValue = null) {

    const data = window.availableContentOptions[type] ?? {};
    let html = `<option value="">Select</option>`;

    Object.entries(data).forEach(([id, label]) => {
        html += `
            <option value="${id}" ${String(id) === String(selectedValue) ? 'selected' : ''}>
                ${label}
            </option>
        `;
    });

    return html;
}

/* ========= SERVICE ITEM FIELD RENDERER ========= */

function renderServiceItemFields(widgetIndex, itemIndex, item) {

    if (item.type === 'custom') {
        return `
            <input type="text" class="form-control mb-2"
                   placeholder="Label"
                   value="${item.label ?? ''}"
                   onchange="updateServiceItem(${widgetIndex}, ${itemIndex}, 'label', this.value)">
            <input type="text" class="form-control"
                   placeholder="URL"
                   value="${item.url ?? ''}"
                   onchange="updateServiceItem(${widgetIndex}, ${itemIndex}, 'url', this.value)">
        `;
    }

    if (item.type === 'latest_from_category') {
        return `
            <select class="form-control mb-2"
                onchange="updateServiceItem(${widgetIndex}, ${itemIndex}, 'id', this.value)">
                ${buildSelectOptions('category', item.id)}
            </select>

            <input type="number"
                   class="form-control"
                   placeholder="Limit"
                   value="${item.limit ?? 5}"
                   onchange="updateServiceItem(${widgetIndex}, ${itemIndex}, 'limit', this.value)">
        `;
    }

    if (item.type === 'page' || item.type === 'post' || item.type === 'category') {
        return `
            <select class="form-control"
                onchange="updateServiceItem(${widgetIndex}, ${itemIndex}, 'id', this.value)">
                ${buildSelectOptions(item.type, item.id)}
            </select>
        `;
    }

    return '';
}

/* ========= WIDGET CONTROLS ========= */

function addWidget(){ sidebarWidgets.push({type:'',settings:{}}); renderWidgets(); }
function updateWidgetType(i,v){ sidebarWidgets[i].type=v; sidebarWidgets[i].settings={}; renderWidgets(); }
function updateSetting(i,k,v){ sidebarWidgets[i].settings[k]=v; updateHiddenInput(); }
function removeWidget(i){ sidebarWidgets.splice(i,1); renderWidgets(); }
function toggleWidget(i){ activeWidget = activeWidget===i?null:i; renderWidgets(); }

/* ========= DRAG & DROP WIDGET ========= */

function dragStart(e,i){ dragIndex=i; }
function dragOver(e){ e.preventDefault(); }
function dropWidget(e,i){
    e.preventDefault();
    const moved=sidebarWidgets.splice(dragIndex,1)[0];
    sidebarWidgets.splice(i,0,moved);
    renderWidgets();
}

/* ========= SERVICE ITEM CONTROLS ========= */

function dragServiceStart(e,w,i){ serviceDragIndex=i; }

function dropServiceItem(e,w,i){
    e.preventDefault();
    const items=sidebarWidgets[w].settings.items;
    const moved=items.splice(serviceDragIndex,1)[0];
    items.splice(i,0,moved);
    renderWidgets();
}

function addServiceItem(w){
    if(!sidebarWidgets[w].settings.items)
        sidebarWidgets[w].settings.items=[];
    sidebarWidgets[w].settings.items.push({type:''});
    renderWidgets();
}

function updateServiceItemType(w,i,v){
    sidebarWidgets[w].settings.items[i].type=v;
    renderWidgets();
}

function updateServiceItem(w,i,k,v){
    sidebarWidgets[w].settings.items[i][k]=v;
    updateHiddenInput();
}

function removeServiceItem(w,i){
    sidebarWidgets[w].settings.items.splice(i,1);
    renderWidgets();
}

function updateHiddenInput(){
    document.getElementById('page_sidebar_widgets_json').value =
        JSON.stringify(sidebarWidgets);
}

renderWidgets();
</script>
