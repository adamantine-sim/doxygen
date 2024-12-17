#! /usr/bin/fish

# Remove everything in the directory but build_doxygen.fish, CMakeLists.txt, and
# .github
rm -r (string match -rv 'build_doxygen.fish|CMakeLists.txt|.github' -- *)
# Download adamantine master branch and build the Doxygen documentation
wget https://github.com/adamantine-sim/adamantine/archive/refs/heads/master.zip
unzip master.zip
rm master.zip
cd adamantine-master
cp ../CMakeLists.txt .
mkdir build
cd build
cmake ..
make documentation
# Move the Doxygen documentation to the root file
mv doc/doxygen_html/* ../..
cd ../..
rm -r adamantine-master
# Push the Doxygen documentation to the repo
git add .
git commit -m "Update Doxygen"
git push origin gh-pages
