#
# Be sure to run `pod lib lint MultiLanguage.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MultiLanguage'
  s.version          = '0.1.2'
  s.summary          = 'A short description of MultiLanguage.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/feiduduhaha/MultiLanguage'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lan_mailbox@163.com' => 'tianyun1201@163.com' }
  s.source           = { :git => 'https://github.com/feiduduhaha/MultiLanguage.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MultiLanguage/Classes/**/*'
  
  s.resource_bundles = {
     'Multi_language' => ['MultiLanguage/Assets/*.png','MultiLanguage/Files/*.*']
  }
  s.script_phase = { :name => 'MultiLanguageScript', :script => '
      podsPath=${BUILT_PRODUCTS_DIR}
      shortPath="/Multi_language.bundle/"
      plistPath="${podsPath}/${shortPath}Config.plist"
      pyScriptPath="${podsPath}/${shortPath}firstScript.py"
      echo "我的工作目录"
      cho $podsPath
      NeedRunScript=`/usr/libexec/PlistBuddy -c "Print NeedRunScript" $plistPath`
      echo "$NeedRunScript"
      if [ $NeedRunScript == "true" ]
      then
          echo "执行python脚本"
          ${pyScriptPath}
      else
          echo "未获取到配置文件"
      fi
    '
  }
end
