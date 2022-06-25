find . -name "*.sln" | xargs rm 
find . -name "*.vcxproj" | xargs rm 
find . -name "*.vcxproj.filters" | xargs rm 
find . -name "*.vcxproj.user" | xargs rm 
rm -r ".vs"

function pause(){
   read -p "$*"
}

read -t 5 -p "Press any key in 5 seconds to keep window open.." key
if [[ $? -gt 128 ]] ; then
    echo -e "\nWindow exiting.."
else
    echo ""
    pause pause 'Key pressed. Keeping window open. Press [Enter] to close..'
fi
exit