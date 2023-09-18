# Main config files for mine most used applications

This is the repo where I put the last configurations used in the main
applications in use.

### For now, the following applications have their configurations files in this repo:

1. Vim
2. Tmux (using tpm plugin manager)
3. Zsh
4. i3wm

### Some previews

#### Fetch and the i3statusbar

![Fetch](https://github.com/ymtec90/dotfiles/blob/main/images/fetch.png?raw=true)

#### Vim

![Vim](https://github.com/ymtec90/dotfiles/blob/main/images/vim.png?raw=true)

#### Tmux with stylized status bar (inspired in the gruvbox plugin)

![Tmux](https://github.com/ymtec90/dotfiles/blob/main/images/tmux.png?raw=true)

#### How to setup tmux

1. Open your terminal.
2. Type `$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
3. Type `$ mkdir ~/.config/tmux`
4. Paste the `tmux.conf` inside the created folder
   `$ mv .../configs/tmux.conf ~/.config/tmux/`
5. Start the tmux and then press `Ctrl + b + I` to force the system to install
   the required plugins.

#### How to use the venv functions while in a terminal using Zsh:

The script is very intuitive and easy to use. Follow the instructions bellow and
manage your python virtual environments without pain.

The first thing to understand is that the venv script commands will look for a
directory named `$HOME/.virtualenvs`. In the case of this directory did not
exists, it will create the directory and the environment given by the user in
the `cvenv` function.

That being said, let's see the detail about the commands:

1. `lvenv` - Use to list the environments created by the user. It will inform if
   there is no environment or directory in the system.
2. `cvenv` - Use to create a new enviroment. As said before, if there is no
   enviroment folder in the system it will create one for you. You must provide
   an enviroment name to the function to work. Ex: Call `cvenv test` to create
   an environment named `test`.
3. `avenv` - Use for list the environments in the system and then input the
   desired one to activate it.
4. `dvenv` - Use for list the environments in the system and then input the
   desired one to delete it.

Like I told above, the use is very easy and the script comes ready in the .zshrc
file. No need to edit anything. If you want to integrate with the .zshrc you
already had setup in your system, look for the functions in the bottom of my
.zshrc file and then copy for your own.
