# iCloudDownloader

This is a simple CLI interface for fetching file and folder from the iCloud Storage. 

## Why this CLI ?

Downloading a file stored on iCloud from the Finder is easy, one click and you are done. But when you are on a terminal, you can't open a *.icloud* file in order to force download the file. **iCloudDownloader** is here to fix this issue by provinding a quick command for force download an iCloud file.

## Installation

* [Download the lastest version](https://github.com/farnots/iCloudDownloader/releases)
* Extract the file : `tar -xf ./icd_1.0.tar`
* Move the executable to the */usr/local/bin/* : `mv ./icd /usr/local/bin/icd`

## Usage

* Download a file : `icd <local_file_path>`
* Download a fodler : `icd <local_folder_path>`
* Download all current folder : `icd -A`

## Compatiblity

iCloudDownloader should work on macOS 10.2 Sierra, and on OS X 10.11 El Capitan.

## Futur improvement

* Create a full iCloud manager from the terminal
    * Erase file
    * See download progression

