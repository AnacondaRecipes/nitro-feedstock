:: cmd
echo "Building %PKG_NAME%."

mkdir build
cd build
if errorlevel 1 exit /b 1

set CXXFLAGS="/D_HAS_AUTO_PTR_ETC=1"

:: Generate the build files.
echo "Generating the build files..."
cmake .. %CMAKE_ARGS% ^
      -G"Ninja" ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_BUILD_TYPE:STRING=Release ^
	-DBUILD_SHARED_LIBS=ON ^
      %SRC_DIR%
if errorlevel 1 exit /b 1

:: Build.
echo "Building..."
ninja -j%CPU_COUNT%
if errorlevel 1 exit /b 1


:: Install.
echo "Installing..."
ninja install
if errorlevel 1 exit /b 1


:: Error free exit.
echo "Error free exit!"
exit 0
