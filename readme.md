# compare-filehash
Simple PowerShell script to hash a file and compare it to an existing hash.

## usage
```./Compare-FileHash.ps1 <path to file> <algorithm optional, defaults to sha256> <provided hash to check against>```

Accepted algorithms are: sha1, sha256, sha384, sha512, and md5

# Convert-HEIC2JPG
Apple's new default image format isn't always compatible with other software. This is a simple Powershell script to bulk convert all HEIC files in a directory to JPG using ImageMagick. 

## Usage

**ImageMagick 7+ is required. Download it here: [https://imagemagick.org/script/download.php](https://imagemagick.org/script/download.php)**

The script takes one argument, provide a directory path containing HEIC files you'd like to convert to JPG. A new directory called HEIC2JPG will be created within the supplied directory where your converted JPGs will be placed.

### Example

```
./Convert-HEIC2JPG.ps1 c:\users\ethan\downloads\photos\
```