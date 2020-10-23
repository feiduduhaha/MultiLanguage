#
# Be sure to run `pod lib lint MultiLanguage.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MultiLanguage'
  s.version          = '1.0.2'
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
      
      echo "\n**********************判断是否需要执行多语言python脚本*********************************"
      
      podsPath=${BUILT_PRODUCTS_DIR}
      shortPath="/Multi_language.bundle/"
      plistPath="${podsPath}/${shortPath}Config.plist"
      filterScriptPath="${podsPath}/${shortPath}firstScript.py"
      transScriptPath="${podsPath}/${shortPath}secoundScript.py"
      
      echo "我的工作目录"
      cho $podsPath
      
      RunFilterScript=`/usr/libexec/PlistBuddy -c "Print RunFilterScript" $plistPath`
      echo "$RunFilterScript"
      if [ $RunFilterScript == "true" ]
      then
          echo "执行过滤脚本，生成csv文件"
          ${filterScriptPath}
      else
          echo "不需要执行过滤脚本"
      fi
      
      RunScvToJsonScScript=`/usr/libexec/PlistBuddy -c "Print RunScvToJsonScScript" $plistPath`
      echo "$RunScvToJsonScScript"
      if [ $RunScvToJsonScScript == "true" ]
      then
          echo "执行转换csv到json脚本"
          ${transScriptPath}
      else
          echo "不需要转换脚本"
      fi
      echo "\n**********************MultiLanguage全部脚本运行完毕************************************\n"
    '
  }
end
