rd /s /q "release"
rd /s /q "platform/win/build"
cd platform/win
python setup.py build
"C:\Program Files (x86)\NSIS\makensis.exe" main.nsi
setlocal enableextensions
md "../../release/win"
endlocal
move ArenaSH_setup.exe "../../release/win/"
move "build/exe.win-amd64-2.7" "../../release/win/instdir"
cd ../../
