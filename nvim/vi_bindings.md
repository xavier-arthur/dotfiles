# this init.vim features

### VimPlug automation

init.vim will automatically check if vim-plug is installed and if not will
download it

### general remaps

- (Visual/Normal) \<C-p> to ^
  - goes to the first non-whitespace character in line
- (Visual) \<C-c> to "+c
  - '+' register to copy text from nvim to system's clipboard
- (Visual) \<C-b> to "+p
  - '+' register to copy text from system's clipboard to nvim
- (Insert) {{ to {\<Cr>}<Esc>ko
  - creats a '{}' block and puts the cursor in the middle of it

### .sh remaps

- (Normal/.sh) #!
  - inserts a shebang behind the cursor
- (Normal/.sh) ##
  - runs shellcheck on current buffer

### .tex remaps

- (Normal) #!
  - compiles current buffer
- (Insert) \it to \textit{
  - creates a italic block
- (Insert) \bb to /textbf{
  - creates a bold block

### .java remaps

- (Normal) #!
  - inserts a class and main method

### Leader mappings

- \<Leader> + wq saves and quits all buffers
- \<Leader> + qq force quits
- \<Leader> + qa force quits all buffers
- \<Leader> + ww saves current buffer
- \<Leader> + j adds line a below
- \<Leader> + k adds a line above
- \<Leader> + gg vimgreps current file for designated pattern
- \<Leader> + n goes to cnext iteration of vimgrep
- \<Leader> + lt enter in a new tab with ":e ~/" in command buffer

...and more!
