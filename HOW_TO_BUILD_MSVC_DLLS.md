#How to build MSVC dlls

The default nlopt Windows dll's available here:

http://ab-initio.mit.edu/wiki/index.php/NLopt_on_Windows

These were compiled with MinGW. However, not all D compilers are capable of 
linking to MinGW dll's on Windows. The alternative is to use the Microsoft
Visual Studio linker.

For the MSVC linker to properly link the C nlopt library to the D program, it 
has to be in the right format. To do this requires compiling them with Visual
Studio. Thankfully, a CMAKE file is available to make this easier. But there are
still adjustments that must get made to do it properly. 

After building the files, they can be used as any other library. However, note
that because the default DMD linker is OPTLINK on 32bit builds, then one must
pass -m32mscoff to instead use the MSVC linker. The 64bit build uses the MSVC
linker by default (as does LDC, not sure on GDC). This means that the only
way to call nlopt from D on Windows is to build these dlls/libs.

To build the dlls/libs: 
1) Download the source. As of this writing, the source on the website does not 
include the CMake files. These can be downloaded from the Windows site (put them
in the nlopt source folder). Note: the Github source repo has a more up to date 
version of the CMake files as of this writing, though these dll's were built
with the website release rather anything from Github.

2) Make some modifications to the ./api/nlopt.h file. 

a) For a 32bit build, change
#if 0 && (defined(_WIN32) || defined(__WIN32__))
to
#if 1 && (defined(_WIN32) || defined(__WIN32__))

b) Add
#ifndef NLOPT_DLL
#define NLOPT_DLL
#endif

#ifndef NLOPT_DLL_EXPORT
#define NLOPT_DLL_EXPORT
#endif

It can also be useful to a
#undef NLOPT_DLL
#undef NLOPT_DLL_EXPORT
at the end of the file

c) For a Release Build on nlopt 2.4.2, cobalya.c needs to be adjusted to take
into account
https://github.com/stevengj/nlopt/issues/51

3) Open the CMake Gui, select the correct locations for the build and where to 
output the files, then select Configure. Choose the appropriate Visual Studio
edition (Note: if you have already built one version of these dll's, then you
will need to adjust the cache to re-set the generator). Select BUILD_SHARED_LIBS
if you want to and un-select BUILD_PYTHON if that is an option. Re-configure, 
then run Generate. This will put the Visual Studio project files in the selected
folder. 

4) Build the dll with Visual Studio. Open the nlopt.vcxproj file in Visual 
Studio. Run Build to generate the debug build. If instead you need the Release
Build, change the option in the drop-down for Active Configuration. Also in
Configuration Manager.

There are two subsequent steps. Either update the dub.json to point to the 
correct location of the files or move the files to the location in the
dub.json file. 

Note: the second approach may require adding the directory containing the dll/
lib files to the Windows path, then log out and log back in. If switching
between x86 and x86_64, it may require re-doing this step. 



