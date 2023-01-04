# Cyan Yerba

This repo serves as a place to store shell scripts and `Containerfile`s that
help me setup my workflow, which I need the most when running distros
like [OpenSUSE MicroOS](https://microos.opensuse.org/) or
[Fedora Kinoite](https://kinoite.fedoraproject.org/download/), but it could
be applied to any distro.

## After fresh install - Update and setup

After a fresh install make sure to be up to date, but first clone this repo
because we are going to make use of it along this README.

### Get started - Clone this repo

```bash
git clone --depth=1 git@github.com:santigo-zero/cyan-yerba.git
# If the ssh key is not available
git clone --depth=1 https://github.com/santigo-zero/cyan-yerba.git
```

### Update Fedora Kinoite/Silverblue

```bash
rpm-ostree upgrade -r # Flag -r will reboot your machine when rpm-ostree finishes.
```

### Update OpenSUSE MicroOS

```bash
sudo transactional-update
systemctl reboot
```

### Initial setup

After rebooting you should run this scripts to reboot once again.

```bash
./kinoite.sh
# Or
./microos.sh
```

## Tools

### Most of my dotfiles

To get all of my dotfiles I normally curl the script because I have them in
a [repo](https://github.com/santigo-zero/dotfiles/), it's going to work even if
git is not installed.

```bash
curl https://raw.githubusercontent.com/santigo-zero/dotfiles/master/clone-dotfiles | bash
```

Or if you already cloned the repository you can `rsync` the dotfiles directory
to your current `$HOME` running:

```bash
rsync --verbose \
    --recursive \
    --ignore-times \
    --exclude "README.md" \
    --exclude "copy-dotfiles" \
    --exclude "clone-dotfiles" \
    --exclude ".git" \
    dotfiles/ "$HOME"
```

### Distrobox

#### Install

In MicroOS [distrobox](https://github.com/89luca89/distrobox) comes installed
by default, but in the case of Kinoite you need to install it read
[about it here](https://github.com/89luca89/distrobox#installation), I prefer
to use curl

```bash
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --next --prefix ~/.local
```

#### Configure

To configure the container that I use the most you can cd to `./main-distrobox` and run

```bash
./image.sh && ./container.sh && distrobox enter main
```

**While this ^^^ command finishes you can read how to configure the
[colorscheme](###colorscheme) and [flatpaks](###flatpaks)**

### Colorscheme

I don't ship any colorschemes with my dotfiles, they are separate because
JetJBP is my own colorscheme and it's easier to have things separate at
the moment of updating.

```bash
git clone --depth=1 https://github.com/santigo-zero/JetJBP
```

### Flatpaks

Configure everything with the script from this repo that will add
flathub and kde repos so that we can install all of the packages that I use

```bash
./flatpak.sh
```

### Development tools

Most of the tools that I use on a daily basis can be installed with `tools.sh`
this tools range from formatters and package managers to `LSP`s.

```bash
tools.sh # This is going to be in your PATH so type it as is.
```

### Neovim

To get my personal "framework" just run

```bash
gcs git@github.com:santigo-zero/fractal-nvim.git "$XDG_CONFIG_HOME/nvim"
```

But before running neovim you'll probably have to build from source.

Neither Kinoite or MicroOS will let you install stuff like you used to install
in conventional mutable distros, so you should compile like so:

```bash
make CMAKE_INSTALL_PREFIX=~/.local/ install
```

This comes with the advantage of neovim not polluting your global environment
(your host) since it's installed locally to your user. This also avoids having
neovim repeated in every container since distrobox/toolbox can access the build
because the `$HOME` of the containers are binded to your hosts `$HOME`.

#

#

# DEVELOPMENT_TOOLS

# Run tools.sh, a scripts that is in by dotfiles

#

#

# NEOVIM:

# https://github.com/santigo-zero/fractal-nvim

# To build from source use this command:

# make CMAKE_INSTALL_PREFIX=~/.local/ install

# After setting most tools you can run

# gcs git@github.com:santigo-zero/fractal-nvim.git "$XDG_CONFIG_HOME/nvim"

###

# This setting allows the user to continue running sudo in other windows

# and programs without requiring a password for a preset time period in

# each window.

sudo tee -a /etc/sudoers <<EOT
Defaults !tty_tickets
EOT

# # Install zsh

# sudo transactional-update pkg install zsh

# # Now switch to the z shell

# sudo usermod -s /bin/zsh "$USER"

# Change the hostname

echo "Choose new hostname name, the default value being 'fedora' but you can cancel with control+c"
read -r HOSTNAME_NEW
hostnamectl set-hostname "$HOSTNAME_NEW"
