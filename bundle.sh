# Delete the old bundle folder and create a new one
echo "Recreating bundle folder"
rm -rf bundle
mkdir bundle

# Prepare docker-compose files
echo "Setting up docker-compose"
cp -R apache bundle/
cp docker-compose.yml bundle/

# Prepare project
echo "Setting up PHP Project"
cp -R php bundle/

# Remove git folder
echo "Removing .git folders"
rm -rf bundle/.git
rm -rf bundle/php/.git

# Clean Composer related files
echo "Removing Composer related files"
# rm -rf bundle/php/vendor
# rm -rf bundle/php/public/install/vendor
rm bundle/php/composer.lock

# Clean other unecessary files
echo "Removing other unecessary files"
rm bundle/php/Procfile
rm bundle/php/app.json
rm bundle/php/apache_app.conf

echo "Setting up Documentation"
cp -R documentation bundle/documentation

# Generate Documentation File (Needs markdown installed 'npm i -g html-to-markdown')
echo "Generating Documentation from README.md"
markdown -t "Zenfreela - Documentation" bundle/php/README.md > bundle/Documentation.html

echo "Done!"