# Troubleshooting

**Packer Cache**  
Deleting the "packer_cache" folder between builds seems helpful for developing/debugging the autounattend.xml files.

**could not find a supported CD ISO creation command (the supported commands are: xorriso, mkisofs, hdiutil, oscdimg)**  
If you're going to host Death Lab on a Windows machine, [Windows Assessment and Deployment Kit (ADK)](https://go.microsoft.com/fwlink/?linkid=2196127) includes "oscdimg." Make sure to update your execution path after installing the Windows ADK.