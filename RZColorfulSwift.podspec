Pod::Spec.new do |s|
  s.name         = "RZColorfulSwift"
  s.version      = "0.0.4"
  s.summary      = "NSAttributedString富文本的快捷设置方法集合,以及UITextView、UITextField、UILabel富文本简单优雅的使用"
  s.description  = <<-DESC
  富文本方法集合，使用链式的方法快速简单的使用富文本NSAttributedString的功能
                   DESC
  s.homepage     = "https://github.com/rztime/RZColorfulSwift"
  s.license      = "LICENSE"
  s.author             = { "rztime" => "rztime@vip.qq.com" }
  
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/rztime/RZColorfulSwift.git", :tag => "#{s.version}" }

  s.subspec 'AttributeCore' do |ss| 
    ss.source_files = "RZColorfulSwift/RZColorfulSwift/AttributeCore/*"
  end

  s.subspec 'Core' do |ss|
    ss.dependency 'RZColorfulSwift/AttributeCore'
    ss.source_files = "RZColorfulSwift/RZColorfulSwift/Core/*"
  end
end
