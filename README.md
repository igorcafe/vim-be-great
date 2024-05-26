# Vim Be Great

A series of interactive exercises to go from totally beginner to professional
vimmer.

## Getting started

1. Clone the repository

```sh
git clone https://github.com/igorcafe/vim-be-great
```

2. Exercise

```sh
cd ./vim-be-great

./exercise
```

3. Quitting

If you try to exit vim the regular way, the script will launch another vim.
To really quit the exercise you must press <kbd>Esc</kbd>, type `:cq` and press
<kbd>Enter</kbd>.


4. Resuming from where you left

The script automatically store where you left inside the file `.current`.
To resume, just launch the exercise again with `./exercise`.
