# Setup

## 1. Install dependencies

Install the following tools before running the setup script:

- git
- stow
- tmux
- starship
- wezterm
- nvim

## 2. Create symbolic links

Make the setup script executable and run it:

```sh
chmod +x setup.sh
./setup.sh
```

This will create the required symbolic links for the configuration files.

## 3. Load shell configuration

Add the following line to your `~/.bashrc` or `~/.zshrc`:

```sh
source /path/to/load.sh
```

Replace `/path/to/load.sh` with the actual path to `load.sh`.

After updating your shell configuration, either restart your shell or run:

```sh
source ~/.bashrc
# or
source ~/.zshrc
```
