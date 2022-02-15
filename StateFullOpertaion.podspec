Pod::Spec.new do |spec|


  spec.name         = "StateFullOperation"
  spec.version      = "0.0.1"
  spec.summary      = "Unleash the power of operation with StateFullOperation"


  spec.description  = "Bring States to operation, take control of your application operation with StateFullOperation"

  spec.homepage     = "https://github.com/kiarashvosough1999/StateFullOpertaion.git"

  
  spec.license      = { :type => "MIT", :file => "LICENSE" }



  spec.author             = { "kiarashvosough1999" => "vosough.k@gmail.com" }
  # spec.social_media_url   = ""

  spec.ios.deployment_target = "9.0"
  spec.osx.deployment_target = "10.10"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"

  spec.source       = { :git => "https://github.com/kiarashvosough1999/StateFullOperation.git", :tag => "#{spec.version}" }

  spec.source_files  = "Source/**/*.{swift}"

  spec.swift_versions = ['5.3', '5.4' , '5.5']
  spec.framework = ["Foundation"]

end
