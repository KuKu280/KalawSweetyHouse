# Uncomment the next line to define a global platform for your project
# platform :ios, '13.0'

target 'KalawSweetyHouse' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for KalawSweetyHouse

  target 'KalawSweetyHouseTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'KalawSweetyHouseUITests' do
    # Pods for testing
  end

	pod 'Firebase/Firestore'
  pod 'FSCalendar'

end

# post install
post_install do |installer|
  # ios deployment version
  installer.pods_project.targets.each do |target|
     target.build_configurations.each do |config|
      xcconfig_relative_path = "Pods/Target Support Files/#{target.name}/#{target.name}.#{config.name}.xcconfig"
      file_path = Pathname.new(File.expand_path(xcconfig_relative_path))
      next unless File.file?(file_path)
      configuration = Xcodeproj::Config.new(file_path)
      next if configuration.attributes['LIBRARY_SEARCH_PATHS'].nil?
      configuration.attributes['LIBRARY_SEARCH_PATHS'].sub! 'DT_TOOLCHAIN_DIR', 'TOOLCHAIN_DIR'
      configuration.save_as(file_path)
     end
 end
end
