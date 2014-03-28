coffee -c -o lib/ src/
echo "Compiling Guaycuru..."
echo "#!/usr/bin/env node" > bin/guaycuru
echo " " >> bin/guaycuru
cat lib/guaycuru.js >> bin/guaycuru
chmod +x bin/guaycuru