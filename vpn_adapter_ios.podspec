#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint sshvpn_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'vpn_adapter_ios'
  s.version          = '1.0.1'
  s.summary          = 'Vpn utils for ios native'
  s.description      = <<-DESC
Vpn utils for ios native.
                       DESC
  s.homepage         = 'http://naviddev.info'
  s.license          = { :file => './LICENSE' }
  s.author           = { 'Navid Shokoufeh' => 'Navidshokoufeh.dev@gmail.com.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.static_framework = true
  s.platform = :ios, '15.0'
  s.preserve_path = ['include/ExtParser.framework','include/openconnect.framework','include/SshLib.framework']
  s.vendored_frameworks  = ['include/ExtParser.framework','include/openconnect.framework','include/SshLib.framework']

  s.vendored_libraries = "**/*.a"

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'}
end
