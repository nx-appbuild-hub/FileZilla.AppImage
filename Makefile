SOURCE="https://dl1.cdn.filezilla-project.org/client/FileZilla_3.48.1_x86_64-linux-gnu.tar.bz2?h=RBOvu7YE7zCSXFMc6EFeMw&x=1593729063"
OUTPUT="FileZilla.AppImage"

all:
	echo "Building: $(OUTPUT)"
	wget --output-document=filezilla.tar.bz2 --continue $(SOURCE)
	mkdir -p ./build
	tar xjf filezilla.tar.bz2 -C ./build
	mkdir -p AppDir/application
	mkdir -p AppDir/lib
	cp -r build/FileZilla3/* AppDir/application
	export ARCH=x86_64 && ./bin/appimagetool.AppImage AppDir $(OUTPUT)
	rm -rf AppDir/application
	rm -rf AppDir/lib
	rm -rf build
	rm -rf filezilla.tar.bz
