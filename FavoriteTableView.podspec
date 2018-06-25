Pod::Spec.new do |s|

  s.name         = "FavoriteTableView"
  s.version      = "2.0"
  s.summary      = "Nice design to a TableView"

  s.description  = <<-DESC
                  Agrega a tu TableView esste nuevo diseño.
                   DESC

  s.homepage     = "https://DianaVera@bitbucket.org/DianaVera/"
  s.license      = { :type => "MIT", :file => "LICENSE" }



  s.author             = { "dveraull" => "dianic.veul@gmail.com" }

  s.source       = { :git => "https://DianaVera@bitbucket.org/DianaVera/favoritetableview.git", :tag => "#{s.version}" }
  s.swift_version = '4.1'
  s.ios.deployment_target = '11.3'

  s.requires_arc     = true
  s.ios.frameworks = 'UIKit', 'Foundation'

  s.source_files  = "FavoriteListSection/Sources/*.{swift}"

  s.resources = "FavoriteListSection/Sources/*.{png,xib}"
  

end