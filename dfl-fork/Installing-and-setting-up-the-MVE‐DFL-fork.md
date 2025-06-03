_**Please note:**_ This article is written with Windows 10/11 in mind. While it is possible to run DFL on Linux, that will not be covered in this article.


Installing and updating the MVE-DFL fork is easiest via **Git**.
If you don't already have it, it is recommended you install [Git for Windows](https://gitforwindows.org/).
You do not need to know (almost) anything about Git itself, it will be enough to copy the commands from this article.


## Additional .bat files
It is recommended you download and extract the additional .bat files that make it easier to use some of the new functionality of this fork.
You can download them from here: [DeepFaceLab-bat_files.zip](https://github.com/user-attachments/files/16921699/DeepFaceLab-bat_files.zip)
And then simply extract them in your main DFL directory, next to your existing .bat files.

***


## Fresh DFL installation
🛠 Under construction 🛠

Make sure to download the build appropriate for your hardware:
* DeepFaceLab NVIDIA RTX 3000 series build - for Nvidia 3000 series GPUs (uses CUDA)
* DeepFaceLab NVIDIA up to RTX 2080 TI build - for Nvidia GPUs that support CUDA, and are not from series 3000. This includes series 2000, 1600, 1000, and 900
* DeepFaceLab DirectX 12 build - for AMD, Intel, or Nvidia GPUs that fully support DX12. This includes AMD Radeon R5, R7, R9 200 and newer, Intel HD Graphics 500 and newer, and some older Nvidia GPUs
> **NOTE:** CUDA-based builds will provide better performance than the DX12 build


Secondly, run the downloaded executable file, or use your archive application of choice (ie [7-zip](https://www.7-zip.org/)) to extract the content.

> **Recommendations:**
> - you should avoid any spaces in the path to the directory where you extract DFL
> - if possible, you should put DFL on an SSD

Inside your DFL directory you should find:
* directory called `_internal`
* directory called `workspace`
* a lot of different `.bat` files
* and a `changelog.html`


Depending on which build you downloaded and extracted, your DFL directory will look something like this:  
![image](https://github.com/user-attachments/assets/46481f34-d9a4-4c17-92d0-4aff761b751b)

You can now continue to [Installing the MVE-DFL fork with existing DFL installation](https://github.com/MachineEditor/DeepFaceLab-MVE/wiki/Installing-and-setting-up-the-MVE%E2%80%90DFL-fork#installing-the-mve-dfl-fork-with-an-existing-dfl-installation).

***


## Installing the MVE-DFL fork with an existing DFL installation  
If you already have DFL installed and set up, there's only a few steps to do to start using this fork.

### Installing with Git - recommended  
This is the recommended option, as it will make updating easier as well.

1. go to your existing DFL directory and open `_internal, you should see something like this:  
![image](https://github.com/user-attachments/assets/ce1c4d6c-1828-49ec-b9ce-c3e825a96743)
2. either **rename** `DeepFaceLab` (this is recommended), for example into `DeepFaceLab_old` so you keep a copy if you run into problems  
or delete that directory (only if you're sure of what you're doing)
3. open Command Prompt (**Win+R** > cmd) and navigate to your `DFL\_internal` directory, something like this:  
![image](https://github.com/user-attachments/assets/b095d460-7e03-4787-bece-7a8a586a284a)  
4. type and run `setenv`
5. type and run `git clone https://github.com/MachineEditor/DeepFaceLab-MVE`
6. after it is done, type and run `cd DeepFaceLab` followed by `python -m pip install -r requirements-cuda.txt`  
After everything is done, you should now see a new `DeepFaceLab˛directory inside your `internal`, something like this:  
![image](https://github.com/user-attachments/assets/5069ca85-d952-4923-a27b-c416f539fcd9)  
If you did not encounter any errors, congratulations, you are done! :)


### Installing without Git
_**Please note:**_ you will not be able to use Git to update this kind of install.

Before going over the steps to set everything up, first go to [the MVE-DFL fork's project page](https://github.com/MachineEditor/DeepFaceLab-MVE) and then click `Code > Download ZIP` as in this picture:  
![image](https://github.com/user-attachments/assets/ec10b5cb-9a3a-4902-b4fb-a09a3bcf03cd)  
The file offered for download should be called `DeepFaceLab-master.zip`

Next, follow these steps:
1. go to your existing DFL directory and open `_internal, you should see something like this:  
![image](https://github.com/user-attachments/assets/ce1c4d6c-1828-49ec-b9ce-c3e825a96743)
2. either **rename** `DeepFaceLab` (this is recommended), for example into `DeepFaceLab_old` so you keep a copy if you run into problems  
or delete that directory (only if you're sure of what you're doing)
3. extract the downloaded `.zip` file here (in `_internal`)
4. rename extracted directory from `DeepFaceLab-master` into `DeepFaceLab`
5. double click `python_console.bat`, after which you should see something like this  
![image](https://github.com/user-attachments/assets/750b2a9a-0b5a-44f6-a9f8-482618bdf762)  
6. now type and run `cd ..\DeepFaceLab`
7. type and run `python -m pip install -r requirements-cuda.txt`  
And you're done!

***


## Updating the MVE-DFL fork's files
After updates were pushed by developers, or for any other reason, update process will depend on how you installed the fork. The easiest way to update is via the `git pull` command.

### Updating if you used Git to install
1. open Command Prompt and navigate to `long_DFL_directory_name\_internal\DeepFaceLab`
2. type and run `git pull`
3. done! :)

### Updating if you downloaded the zip and did not use Git
You will need to download the latest full project's zip file and extract it.  
Follow the steps 1-3 from [Installing without Git](https://github.com/MachineEditor/DeepFaceLab-MVE/wiki/Installing-and-setting-up-this-DFL-fork#installing-without-git)
