$LineBreak = "`n`n"
$TempFolderName="_src"
$FinalFolderName="src"
$ReplaceFolder="replace"

# Warn users that this script deletes their old files
echo $LineBreak
echo "Please backup any files you want to keep in the src folder before continuing. If this is the first time you are running the script, then you are good to go."
echo $LineBreak
pause


# Clear existing temp folder, if any
echo $LineBreak
if (Test-Path "$TempFolderName`\") {
	rm "$TempFolderName`\" -R -Force > $null
}

# Create temp folder
mkdir $TempFolderName -F > $null

# Copy files from SimHub
cp 'C:\Program Files (x86)\SimHub\_Addons\Arduino\DisplayClientV2\*' "$TempFolderName`\"

# Copy custom fonts from SimHub
mkdir $TempFolderName`\AcHubCustomFonts -F > $null
cp 'C:\Program Files (x86)\SimHub\_Addons\Arduino\ArduinoIDE\arduino-1.6.13\libraries\Adafruit_GFX\ACHubCustomFonts\*' "$TempFolderName`\ACHubCustomFonts`\"

# Rename the main script from a library name to main.cpp, which platfomio likes better
mv "$TempFolderName`\DisplayClientV2.ino" "$TempFolderName`\main.cpp" > $null

# Prepend the compatibility layer to the main script
@("#include <EspSimHub.h>", "") +  (Get-Content "$TempFolderName`\main.cpp") | Set-Content "$TempFolderName`\main.cpp"

# Copy files from "replace" folder to temp folder, so that we fix known issues more easily
cp "$ReplaceFolder`\*" "$TempFolderName`\" -Force > $null

# If there is an existing "src" folder, warn users that we're about to delete it
if (Test-Path $FinalFolderName) {
	echo "This is your last chance. Do you want to replace old files with new ones? Close script if not"
	echo $LineBreak
	pause
    # Delete the folder
	rm -r -fo "$FinalFolderName" > $null
}
# Copy the temporary files to the final destination
mv "$TempFolderName`\" "$FinalFolderName`\" > $null

# We're done
echo $LineBreak
echo "Done"
echo $LineBreak
pause

