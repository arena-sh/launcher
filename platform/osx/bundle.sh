#/bin/sh
SOURCE=../..
DEST=$SOURCE/release/osx
APP_NAME=$DEST/Arena.app
rm -rf $DEST
rm -rf tmp.app
mkdir -p $APP_NAME/Contents/Resources/Scripts
mkdir -p $APP_NAME/Contents/MacOS
cp app.icns $APP_NAME/Contents/Resources/.
cp $SOURCE/launcher $APP_NAME/Contents/MacOS/launcher_main
chmod u+x $APP_NAME/Contents/MacOS/launcher_main
osacompile -o tmp.app applet.src
cp tmp.app/Contents/MacOS/applet $APP_NAME/Contents/MacOS/launcher
cp tmp.app/Contents/Resources/Scripts/main.scpt $APP_NAME/Contents/Resources/Scripts/main.scpt
cp tmp.app/Contents/Resources/applet.rsrc $APP_NAME/Contents/Resources/launcher.rsrc
/usr/libexec/PlistBuddy -c "Add :CFBundleIdentifier string \"com.arenash.launcher\"" $APP_NAME/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Add :CFBundleName string \"Arena\"" $APP_NAME/Contents/Info.plist > /dev/null
/usr/libexec/PlistBuddy -c "Add :CFBundleVersion string \"0.0.1\"" $APP_NAME/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Add :CFBundleExecutable string \"launcher\"" $APP_NAME/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Add :CFBundleIconFile string \"app.icns\"" $APP_NAME/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Add :CFBundleURLTypes array" $APP_NAME/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Add :CFBundleURLTypes:0 dict" $APP_NAME/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Add :CFBundleURLTypes:0:CFBundleURLName string Arena" $APP_NAME/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Add :CFBundleURLTypes:0:CFBundleURLSchemes array" $APP_NAME/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Add :CFBundleURLTypes:0:CFBundleURLSchemes:0 string arena" $APP_NAME/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Add :LSBackgroundOnly string \"1\"" $APP_NAME/Contents/Info.plist > /dev/null
