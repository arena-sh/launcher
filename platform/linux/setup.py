import sys
from cx_Freeze import setup,Executable

includefiles = []
includes = ['Tkinter']
packages = ['pkg_resources._vendor']

base = None
if (sys.platform == 'win32'):
    base = "Win32GUI"

setup(
    name = 'ArenaSH',
    version = '0.2.1',
    description = 'ArenaSH Game Launcher',
    author = 'ArenaSH',
    author_email = 'arenabash@gmail.com',
    options = {'build_exe': {'includes': includes, 'include_files': includefiles, 'packages':packages}},
    executables = [Executable(script='../../launcher', base=base)]
)
