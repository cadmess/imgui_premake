find . -name "*.sln" | xargs rm 
find . -name "*.vcxproj" | xargs rm 
find . -name "*.vcxproj.filters" | xargs rm 
find . -name "*.vcxproj.user" | xargs rm 
rm -r ".vs"