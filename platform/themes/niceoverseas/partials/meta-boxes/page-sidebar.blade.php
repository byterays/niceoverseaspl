<div class="form-group">
    <label for="enable_sidebar">{{ __('Enable Sidebar') }}</label>
    <select name="enable_sidebar" id="enable_sidebar" class="form-control">
        <option value="yes" {{ $enableSidebar === 'yes' ? 'selected' : '' }}>
            {{ __('Yes') }}
        </option>
        <option value="no" {{ $enableSidebar === 'no' ? 'selected' : '' }}>
            {{ __('No') }}
        </option>
    </select>
</div>

<div class="form-group">
    <label for="sidebar_id">{{ __('Sidebar ID') }}</label>
    <select name="sidebar_id" id="sidebar_id" class="form-control">
        <option value="page_sidebar" {{ $sidebarId === 'page_sidebar' ? 'selected' : '' }}>
            Page Sidebar
        </option>
        <option value="service_sidebar" {{ $sidebarId === 'service_sidebar' ? 'selected' : '' }}>
            Service Sidebar
        </option>
    </select>

    <small class="text-muted">
        Sidebar must be registered in theme and populated via
        <strong>Appearance → Widgets</strong>.
    </small>
</div>
