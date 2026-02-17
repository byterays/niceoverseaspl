
<?php
echo "Current directory: " . __DIR__ . "\n\n";

echo "Checking widget file:\n";
$widgetFile = __DIR__ . '/widgets/SidebarCtaWidget.php';
if (file_exists($widgetFile)) {
    echo "✓ Widget file exists at: $widgetFile\n";
    
    // Get the file content
    $content = file_get_contents($widgetFile);
    
    // Check for namespace
    if (preg_match('/namespace\s+([^;]+);/', $content, $matches)) {
        echo "✓ Namespace found: " . $matches[1] . "\n";
    } else {
        echo "✗ No namespace found in file\n";
    }
    
    // Check for class name
    if (preg_match('/class\s+(\w+)\s+extends/', $content, $matches)) {
        echo "✓ Class name found: " . $matches[1] . "\n";
    } else {
        echo "✗ Could not find class name\n";
    }
} else {
    echo "✗ Widget file NOT found at: $widgetFile\n";
}

echo "\nTrying to include file manually:\n";
require_once $widgetFile;

echo "\nChecking if class exists after manual include:\n";
$classesToCheck = [
    'SidebarCtaWidget',
    'Theme\Niceoverseas\Widgets\SidebarCtaWidget',
    'Theme\niceoverseas\Widgets\SidebarCtaWidget'
];

foreach ($classesToCheck as $class) {
    if (class_exists($class)) {
        echo "✓ Class exists as: $class\n";
    } else {
        echo "✗ Class does NOT exist as: $class\n";
    }
}
