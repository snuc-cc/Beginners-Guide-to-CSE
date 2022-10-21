---
layout: default
title:  "Macbook Apple Silicon setup"
nav_order: 4
date:   2022-10-13 00:51:58 +0530
permalink: /Macbook/Setup
---

### Necessary package managers

1. [Homebrew](https://brew.sh)  General purpose package installers for both terminal usage and for applications. Paste the below command in terminal to install it.
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. [Miniconda](https://docs.conda.io/en/latest/miniconda.html) 

* Has some similarity to `pip` (You would have come across it, if you had used python previously, for installing python libraries a.k.a pachages).
* Miniconda is a distribution which uses a package manager - `conda`. So the advantage of conda is that it maintains non-python based packages as well. 
* `Miniconda` is much powerful and easy (in my opinion) to handle with isolated environments, so worry if you dont know what an environment is. Refer [docs](https://docs.conda.io/projects/conda/en/latest/user-guide/concepts/environments.html) for more info or [refer below](###Environment-Management-(Python-Based)) for a quick idea of what an environment is.
* Fyi, `Miniforge` is yet another mini version of conda pkg manager, but it is completely open-source, and completely tested, so it is better to go with Miniconda.

> Install latest Miniconda from [here](https://docs.conda.io/en/latest/miniconda.html) for apple silicon. After downloading miniforge, execute the below commands (Where the downloaded file resides in Downloads folder)

```bash
chmod +x ~/DownloadsMiniconda3-latest-MacOSX-arm64.sh
sh ~/Downloads/Miniconda3-latest-MacOSX-arm64.sh
```

**Enter yes wherever it prompts during the installation**
Now close the terminal, open it again you should see `(base)` in front of your terminal prompt. Yay, your installation is successful. If you go through any issues, refer sources from youtube, there are plenty of them. Or you can even copy paste your error msges in google. 

> **The great part of conda environments is that you can uyse `pip` commands as well to install packages within the conda environment without conflicting with system installation of python**


### Environment Management (Python Based)
* Environments are isolated places to work with. What I mean is that, lets say you have two environments `env1` and `env2` and say you are working on two projects.
* Say for `project1` you need older `numpy` (mathematical library) version of `1.20` *(for some reason, may be because you want to use a depracated function for some testing or other purpose)* and for `project2` you need latest numpy version of `1.23` . You cant have/ use both version in a same python interpreter.
* For that you have to create some isolated place where both run independently without affecting/conflicting with each other.
* Here comes environment handy. You can install `numpy 1.20` in `env1` and `numpy 1.23` in `env2`. And whenever you want to use one particular version of `numpy`, you can *activate* that particular environment. 
* Awesome isn't it? Generally speaking, managing environments is one of the most vital skill every computer science student must learn.
* There are various ways in which you can handle environments. 
  * [Conda](https://docs.conda.io/en/latest/)
  * [Virtualenv](https://virtualenv.pypa.io/en/latest/)
  * [venv](https://docs.python.org/3/library/venv.html)
  And so on and so forth.
* I would arguably go with `conda` environment manager. **First**, it is more easy to use in MacOS. **Second**, it is more *robust*. Robust in sense, it is not just a `python` environment manager. It supports a variety of other languages as well (as per their official docs `Python, R, Ruby, Lua, Scala, Java, JavaScript, C/ C++, Fortran, and more`). Just a one stop solution.

> let us see how to begin with environments. Open you Macbook terminal.

#### Create and activate environment
```bash
conda create --name <env-name> -y
conda activate <env-name>
```

#### Installing packages inside environment
```bash
conda install <package-name1> <package-name2> #or
pip install <package-name1> <package-name2>
```

#### Delete environment
```bash
conda env remove --name <env-name>
```



#### If you want to install all dependencies at once from a text file 
- Now that you dont want to install all dependencies one by one. Say you got a text file *(how? more on that in a little while)* which has all your necessary dependencies like the one below,
```
numpy==1.23.1
matplotlib==3.5.2
jupyterlab==3.4.4
pandas==1.4.4
```
- Unless you want a specific version of a package you dont need the version numbers above, i.e `==1.23.1` is not needed.

- The above text file can be obtained by the commands in the next section.
- After getting the text file, say you have asked your friend for his environment configuration and he sent you the text file, which has contents like above. 
- You can create a new environment with the packages inside the text file by,
```bash
conda install --file requirements.txt ## or
pip install -r requirements.txt
```

#### To store the packages along with their version number in a text file
```python
## Pip
pip freeze > requirements.txt 
#or
## Conda
conda list --export > requirements.txt
``` 

Both serves the same purpose.

- Sometimes, while executing the above commands, for instance, instead of having an entry in the requirements.txt file like <br> `numpy==1.19.0` 
it may end up like <br> `numpy @ file:///opt/concourse/worker/volumes/live/38d1301c-8fa9-4d2f-662e-34dddf33b183/volume/numpy_1592841668171/work` .
Seems like an open issue with pip freeze. And we cant reporduce the environment again.

- So always execute the below command to change the behaviour, as a safety measure, to do the same as above 
```bash
pip list --format=freeze > requirements.txt
```
#### To see the list of environments
```bash
conda env list
```




### Applications setup

- **Vscode** 
  * `brew install vscode`. Simple isn't it? Thats why homebrew is powerful, we dont need to manually do stuff. Now you can simply type `code .` in terminal (in some folder, say Desktop folder) to open `vscode` with Desktop as current working directory.
- **Spyder**
  * `brew install spyder` works fine, I wont suggest installing spyder from **heavy weight** anaconda distribution.
  * Look below to know how to use created conda environment in spyder.
- **iTerm**


### Conda Environment setup for Spyder 
- Create a environment(say `spyder`) on which you have to work in spyder. type `conda env list`. It shows the location of all the environment in your system, copy the path of the environment `spyder`. 
- Execute `conda install spyder-kernels -y` so that spyder works properly in the new environment.
- Now Open spyder
- In the top menu bar, select **Spyder --> preferences --> python interpreter --> Use the following Python interpreter.
- Add `Path/of/your/environment/bin/python`. Dont forget to add `/bin/python` at the end.


- _(Optional but sometimes spyder prompts for this installation as necessary)_ Install this essential dependency in terminal once you change interpreter path from default path in spyder IDE. This ensures spyder to run smoothly.
  (As of now version >= 0.9.7 is enough , but it may change in future)
  ```bash
  conda install -c conda-forge rtree=0.9.7
  ```
  
### Tensorflow for MAC M1 GPU Acceleration

- Execute the following commands in terminal **(python=3.8)**. As of now it is compatible with python 3.8 only. Visit [here](https://developer.apple.com/metal/tensorflow-plugin/) for latest updates.
```bash
conda install -c apple tensorflow-deps
```
```bash
python -m pip install tensorflow-macos
```
```bash
python -m pip install tensorflow-metal
```

### Python package issues with M1(Dont worry, these issues vanished in the near future)

- As the developers are gradually shifting to support python packages for apple siicon, there are few packages which arent compatible or there exist problem with that pacakge in M1

- Conda environments come handy here. If that is the case, create a conda environment as below, which is configured to run `x86 architecture` based python packages.
But ofcourse there are performance compromises :).

```bash
# myenv_x86 in env name
CONDA_SUBDIR=osx-64 conda create -n myenv_x86 python=3.9  
conda activate myenv_x86
# ensures that conda installs x86 versions of Python packages 
conda config --env --set subdir osx-64 
```

- Any way executing the above commands always again and again for new environments is tiring. So better create a shell script function **(dont worry if you dont know what is it. It is just one other programming language to work effectively in terminals)**

Write the below shell function in either .bashrc (if you use bash shell) or .zshrc (if you use zsh shell, mostly your mac will be using zsh shell) as below

Make sure you are in home directory, type `cd` in terminal. Then with your favourite editor( I prefer vim ) open `.vimrc` or `.bashrc` and add the below function at the end of the file.
```bash
create_x86(){
  # $@ is used to get all command line arguments,
  # i.e env name and other dependencies
  CONDA_SUBDIR=osx-64 conda create -n $@     

  # $1 is used to get first command line argument,
  #  i.e env name
  conda activate $1                

  # Setting this environment for x86 Architecture          
  conda config --env --set subdir osx-64
}
```
### git related issues

#### `ssh` issue
`git config --global url."https://".insteadOf git://` to replace https protocol from ssh, as ssh is blocked in most of private/ public wifi firewall

#### How to add large files
- By default Github browser supports files of size 25 Mb. From local system, we can upload files of size 50 Mb.
- Let us see how we can upload files of size more than 100 Mb.

##### Install `Git Large File Storage` (LFS)
- `brew install git-lfs`

##### Setup
- `cd` to your working directory
- Type `git lfs install`
- To track and upload large files with extensions, say .pdf, type `git lfs track "*.pdf"`
- Type `git add .gitattributes` to modify your changes in `.gitattributes`, so on each repository you have locally, *large* files with extension `.pdf` will be managed by LFS.
- Same drill - to add, commit and push files
  * `git add .`
  * `git commit -am "Large files committed"`
  * `git push` 

Yay.

