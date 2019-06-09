import sys
from cx_Freeze import setup,Executable

includefiles = ['app.ico']
includes = ['Tkinter']

base = None
if (sys.platform == 'win32'):
    base = "Win32GUI"

setup(
    name = 'ArenaSH',
    version = '0.2.0',
    description = 'ArenaSH Game Launcher',
    author = 'ArenaSH',
    author_email = 'arenabash@gmail.com',
    options = {'build_exe': {'includes': includes, 'include_files': includefiles}},
    executables = [Executable(script='../../launcher', base=base, icon="app.ico")]
)
