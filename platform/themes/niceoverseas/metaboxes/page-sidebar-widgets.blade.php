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
                    <strong>${type ? type.replace('-', ' ').replace(/\b\w/g, l => l.toUpperCase()) : 'New Widget'}</strong>
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
            <div class="mb-3">
                <label class="form-label">Widget Title</label>
                <input type="text"
                       class="form-control"
                       placeholder="Enter widget title"
                       value="${settings.title ?? ''}"
                       onchange="updateSetting(${index}, 'title', this.value)">
            </div>

            <div class="mb-3">
                <label class="form-label">Menu Items</label>
                <button type="button"
                        class="btn btn-sm btn-success mb-2"
                        onclick="addServiceItem(${index})">
                    <i class="fa fa-plus"></i> Add Menu Item
                </button>

                ${renderServiceItems(index, settings.items ?? [])}
            </div>
        `;
    }

    if (type === 'sidebar-cta') {

        return `
            <div class="mb-3">
                <label class="form-label">Heading Text</label>
                <input type="text"
                    class="form-control"
                    placeholder="Enter heading text"
                    value="${settings.heading ?? ''}"
                    onchange="updateSetting(${index}, 'heading', this.value)">
            </div>

            <div class="mb-3">
                <label class="form-label">Phone Number</label>
                <input type="text"
                    class="form-control"
                    placeholder="Enter phone number"
                    value="${settings.phone ?? ''}"
                    onchange="updateSetting(${index}, 'phone', this.value)">
            </div>

            <!-- Logo Image Picker -->
            <div class="mb-3">
                <label class="form-label">Logo Image</label>
                <div class="d-flex gap-2 align-items-center">
                    <div class="image-preview">
                        ${settings.logo ? `
                            <img src="${settings.logo}" 
                                style="max-width:80px; max-height:80px; border:1px solid #ddd; padding:3px; border-radius:4px;"
                                id="logo-preview-${index}">
                        ` : `
                            <div id="logo-preview-${index}" style="display:none;"></div>
                        `}
                    </div>
                    <div class="d-flex gap-1">
                        <button type="button"
                                class="btn btn-sm btn-info"
                                onclick="selectMedia(${index}, 'logo')">
                            <i class="fa fa-image"></i> Select Image
                        </button>
                        ${settings.logo ? `
                            <button type="button"
                                    class="btn btn-sm btn-danger"
                                    onclick="removeImage(${index}, 'logo')">
                                <i class="fa fa-times"></i>
                            </button>
                        ` : ''}
                    </div>
                </div>
                <small class="text-muted">Recommended size: 200x200px</small>
            </div>

            <!-- Phone Icon Picker -->
            <div class="mb-3">
                <label class="form-label">Phone Icon Image</label>
                <div class="d-flex gap-2 align-items-center">
                    <div class="image-preview">
                        ${settings.phone_icon ? `
                            <img src="${settings.phone_icon}" 
                                style="max-width:50px; max-height:50px; border:1px solid #ddd; padding:3px; border-radius:4px;"
                                id="phone-preview-${index}">
                        ` : `
                            <div id="phone-preview-${index}" style="display:none;"></div>
                        `}
                    </div>
                    <div class="d-flex gap-1">
                        <button type="button"
                                class="btn btn-sm btn-info"
                                onclick="selectMedia(${index}, 'phone_icon')">
                            <i class="fa fa-image"></i> Select Icon
                        </button>
                        ${settings.phone_icon ? `
                            <button type="button"
                                    class="btn btn-sm btn-danger"
                                    onclick="removeImage(${index}, 'phone_icon')">
                                <i class="fa fa-times"></i>
                            </button>
                        ` : ''}
                    </div>
                </div>
                <small class="text-muted">Recommended size: 50x50px</small>
            </div>

            <div class="mb-3">
                <label class="form-label">Animation Delay</label>
                <input type="text"
                    class="form-control"
                    placeholder="e.g. 0.25s"
                    value="${settings.animation_delay ?? '0.25s'}"
                    onchange="updateSetting(${index}, 'animation_delay', this.value)">
                <small class="text-muted">CSS animation delay value</small>
            </div>
        `;
    }

    return '<p class="text-muted">Select a widget type to configure</p>';
}

/* ========= SERVICE ITEMS ========= */

function renderServiceItems(widgetIndex, items) {
    if (!items || items.length === 0) {
        return '<p class="text-muted small">No menu items added yet.</p>';
    }

    let html = '<div class="service-items-list">';

    items.forEach((item, itemIndex) => {
        html += `
            <div class="border p-3 mb-3 rounded" style="background:#f9f9f9;"
                 draggable="true"
                 ondragstart="dragServiceStart(event, ${widgetIndex}, ${itemIndex})"
                 ondragover="dragOver(event)"
                 ondrop="dropServiceItem(event, ${widgetIndex}, ${itemIndex})">

                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="badge bg-secondary">Item ${itemIndex + 1}</span>
                    <span class="text-muted" style="cursor:move;">⋮⋮</span>
                </div>

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
                    <i class="fa fa-trash"></i> Remove
                </button>
            </div>
        `;
    });

    html += '</div>';
    return html;
}

/* ========= CLEAN OPTION BUILDER ========= */

function buildSelectOptions(type, selectedValue = null) {

    const data = window.availableContentOptions[type] ?? {};
    let html = `<option value="">Select ${type}</option>`;

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
            <div class="mb-2">
                <label class="form-label small">Link Label</label>
                <input type="text" class="form-control form-control-sm"
                       placeholder="Enter label"
                       value="${item.label ?? ''}"
                       onchange="updateServiceItem(${widgetIndex}, ${itemIndex}, 'label', this.value)">
            </div>
            <div class="mb-2">
                <label class="form-label small">URL</label>
                <input type="text" class="form-control form-control-sm"
                       placeholder="Enter URL"
                       value="${item.url ?? ''}"
                       onchange="updateServiceItem(${widgetIndex}, ${itemIndex}, 'url', this.value)">
            </div>
        `;
    }

    if (item.type === 'latest_from_category') {
        return `
            <div class="mb-2">
                <label class="form-label small">Select Category</label>
                <select class="form-control form-control-sm"
                    onchange="updateServiceItem(${widgetIndex}, ${itemIndex}, 'id', this.value)">
                    ${buildSelectOptions('category', item.id)}
                </select>
            </div>
            <div class="mb-2">
                <label class="form-label small">Number of Posts</label>
                <input type="number"
                       class="form-control form-control-sm"
                       placeholder="Limit"
                       min="1"
                       max="20"
                       value="${item.limit ?? 5}"
                       onchange="updateServiceItem(${widgetIndex}, ${itemIndex}, 'limit', this.value)">
            </div>
        `;
    }

    if (item.type === 'page' || item.type === 'post' || item.type === 'category') {
        return `
            <div class="mb-2">
                <label class="form-label small">Select ${item.type}</label>
                <select class="form-control form-control-sm"
                    onchange="updateServiceItem(${widgetIndex}, ${itemIndex}, 'id', this.value)">
                    ${buildSelectOptions(item.type, item.id)}
                </select>
            </div>
        `;
    }

    return '';
}

/* ========= WIDGET CONTROLS ========= */

function addWidget(){ 
    sidebarWidgets.push({type:'',settings:{}}); 
    renderWidgets(); 
    activeWidget = sidebarWidgets.length - 1;
}

function updateWidgetType(i,v){ 
    sidebarWidgets[i].type=v; 
    sidebarWidgets[i].settings={}; 
    renderWidgets(); 
}

function updateSetting(i,k,v){ 
    sidebarWidgets[i].settings[k]=v; 
    updateHiddenInput(); 
}

function removeWidget(i){ 
    if(confirm('Are you sure you want to remove this widget?')) {
        sidebarWidgets.splice(i,1); 
        if(activeWidget === i) activeWidget = null;
        renderWidgets(); 
    }
}

function toggleWidget(i){ 
    activeWidget = activeWidget===i ? null : i; 
    renderWidgets(); 
}

function removeImage(widgetIndex, field) {
    sidebarWidgets[widgetIndex].settings[field] = '';
    updateHiddenInput();
    renderWidgets();
}

/* ========= DRAG & DROP WIDGET ========= */

function dragStart(e,i){ 
    dragIndex=i; 
    e.dataTransfer.effectAllowed = 'move';
}

function dragOver(e){ 
    e.preventDefault(); 
    e.dataTransfer.dropEffect = 'move';
}

function dropWidget(e,i){
    e.preventDefault();
    if(dragIndex === null || dragIndex === i) return;
    
    const moved = sidebarWidgets.splice(dragIndex,1)[0];
    sidebarWidgets.splice(i,0,moved);
    dragIndex = null;
    renderWidgets();
}

/* ========= SERVICE ITEM CONTROLS ========= */

function dragServiceStart(e,w,i){ 
    serviceDragIndex = i; 
    e.dataTransfer.setData('text/plain', `${w}:${i}`);
    e.dataTransfer.effectAllowed = 'move';
}

function dropServiceItem(e,w,i){
    e.preventDefault();
    if(serviceDragIndex === null || serviceDragIndex === i) return;
    
    const items = sidebarWidgets[w].settings.items;
    if(!items) return;
    
    const moved = items.splice(serviceDragIndex,1)[0];
    items.splice(i,0,moved);
    serviceDragIndex = null;
    renderWidgets();
}

function addServiceItem(w){
    if(!sidebarWidgets[w].settings.items)
        sidebarWidgets[w].settings.items = [];
    sidebarWidgets[w].settings.items.push({
        type: '',
        id: null,
        label: '',
        url: '',
        limit: 5
    });
    renderWidgets();
}

function updateServiceItemType(w,i,v){
    sidebarWidgets[w].settings.items[i].type = v;
    // Reset fields when changing type
    sidebarWidgets[w].settings.items[i].id = null;
    sidebarWidgets[w].settings.items[i].label = '';
    sidebarWidgets[w].settings.items[i].url = '';
    sidebarWidgets[w].settings.items[i].limit = 5;
    renderWidgets();
}

function updateServiceItem(w,i,k,v){
    sidebarWidgets[w].settings.items[i][k] = v;
    updateHiddenInput();
}

function removeServiceItem(w,i){
    if(confirm('Remove this menu item?')) {
        sidebarWidgets[w].settings.items.splice(i,1);
        renderWidgets();
    }
}

function updateHiddenInput(){
    document.getElementById('page_sidebar_widgets_json').value = 
        JSON.stringify(sidebarWidgets);
}

/* ========= MEDIA SELECTOR ========= */

function selectMedia(widgetIndex, field) {
    // Create temporary element for media selection
    const element = document.createElement('input');
    element.type = 'hidden';
    element.id = 'media-temp-' + Date.now();
    document.body.appendChild(element);

    // Initialize and open media selector
    $(document).find('#' + element.id).rvMedia({
        multiple: false,
        onSelectFiles: function (files, el) {
            if (files && files.length > 0) {
                const file = files[0];
                
                // Get the correct image URL
                let imageUrl = file.url;
                
                // If it's a relative path, ensure it's properly formatted
                if (imageUrl && !imageUrl.startsWith('http') && !imageUrl.startsWith('/')) {
                    imageUrl = '/storage/' + imageUrl;
                }
                
                // Store the URL
                sidebarWidgets[widgetIndex].settings[field] = imageUrl;
                
                // Update hidden input and re-render
                updateHiddenInput();
                renderWidgets();
            }
            
            // Remove temporary element
            $(document).find('#' + element.id).remove();
        }
    });

    // Trigger click to open media selector
    $(document).find('#' + element.id).trigger('click');
}

// Initialize on page load
document.addEventListener('DOMContentLoaded', function() {
    renderWidgets();
});
</script>

<style>
/* Additional styles for better UI */
.service-items-list {
    max-height: 500px;
    overflow-y: auto;
    padding-right: 5px;
}

.image-preview img {
    transition: transform 0.2s;
}

.image-preview img:hover {
    transform: scale(1.05);
}

.card-header {
    background-color: #f8f9fa;
    user-select: none;
}

.card-header:hover {
    background-color: #e9ecef;
}

.gap-2 {
    gap: 0.5rem;
}

.gap-1 {
    gap: 0.25rem;
}

.border.rounded {
    border: 1px solid #dee2e6 !important;
}
</style>