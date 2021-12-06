# glb-shrinker
.bat file to reduce file size of meshes and textures within GLB files for Windows 10.

Uses node packages gltf-pipeline and imagemin-cli.

Requires Node to be already installed.
Only compresses textures that are in .jpg format.

Usage:
- clone repo
- run setup/RUN_THIS_FIRST.bat to globally install required node packages
- drag one or more .glb files into DRAG_GLBS_HERE.bat
- see output in compressed_output folder
