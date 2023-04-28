mkdir build
cd build

set CXXFLAGS="/D_HAS_AUTO_PTR_ETC=1"

cmake -G "NMake Makefiles" ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_BUILD_TYPE:STRING=Release ^
	-DBUILD_SHARED_LIBS=ON ^
      %SRC_DIR%
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1


nmake install
if errorlevel 1 exit 1
