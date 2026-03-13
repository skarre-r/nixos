- [x] fix fingerprint reader (fprintd)

- [ ] xdg settings
  - [ ] hide .desktop items
  - [ ] figure out a way to override .desktop item icons

- [ ] gnome
  - [ ] dconf settings
    - [ ] dconf2nix
  - [ ] (macOS-like) keybindings
    - [ ] left alt + X
    - [ ] disable maximize window (super + up)
    - [ ] super + space = search (spotlight)
    - [ ] left ctrl > super:
      - [ ] super + q = quit
      - [ ] super + w = close window
      - [ ] super + t = new tab
    - [ ] keyd vs gnome-tweaks
    - [ ] https://github.com/canadaduane/my-nixos-conf/blob/main/system/keyd/keyd.conf
  - [ ] magnet/ rectangle-like window management
    - [ ] gTile extension
  - [ ] rcmd-like window management
    - [x] rebind physical copilot key
      - [x] keyd: https://github.com/rvaiya/keyd
    - [ ] run-or-raise
      - [x] https://extensions.gnome.org/extension/1336/run-or-raise
      - [ ] https://github.com/CZ-NIC/run-or-raise
  - [ ] configure workspaces (flashspace)

- [ ] zed
  - [ ] settings
  - [x] extensions

- [ ] librewolf settings + extensions
  - [ ] ublock origin extension
  - [ ] dark reader extension
  - [ ] 1password extension
  - [ ] google search engine

- [ ] just
  - [ ] global justfile w/ home.file? (to rebuild, etc)
  - [ ] recipe to commit new generations?

- [ ] awesome nix
  - [x] nh
  - [ ] ~~nix-index~~
  - [ ] stylix?
  - [ ] nix-software-center?
  - [ ] nixos-conf-editor?

- [x] starship config
- [ ] neovim (nvf) config (WIP)
- [ ] obsidian config (WIP)
- [ ] ssh config?

---

brightnessctl -d "platform::micmute" s 0

---

macOS window shortcuts:

- <Ctrl><LeftAlt>Enter = fullscreen
- <Ctrl><LeftAlt>Left = left 1/2
- <Ctrl><LeftAlt>Right = right 1/2
- <Ctrl><LeftAlt>Up = top 1/2
- <Ctrl><LeftAlt>Down = bottom 1/2
- <Ctrl><LeftAlt>C = center
- <Ctrl><LeftAlt>J = bottom left 1/4
- <Ctrl><LeftAlt>K = bottom right 1/4
- <Ctrl><LeftAlt>U = top left 1/4
- <Ctrl><LeftAlt>I = top right 1/4
- <Ctrl><LeftAlt>D = left 1/3
- <Ctrl><LeftAlt>F = center 1/3
- <Ctrl><LeftAlt>G = right 1/3
- <Ctrl><LeftAlt>V = center semi-fullscreen
- <Ctrl><LeftAlt>M = center mobile sized
- <Ctrl><LeftAlt>, = smaller center mobile sized

(<Ctrl><LeftAlt> = <Ctrl><Fn>)

macOS editor shortcuts:

- <LeftShift><LeftAlt>Down = copy line down
- <LeftShift>Up/Down = select lines
- <LeftAlt>Left/Right = jump word
- <LeftAlt>Up/Down = move line
- <LeftAlt>Backspace/Delete = delete word
- <LeftSuper>Left/Right = start/ end of line
- <LeftSuper>Up/Down = start/ end of file
- <LeftSuper>Backspace/Delete = delete line
- <LeftShift><LeftSuper>Left/Right = select to start/ end of line
- <LeftShift><LeftSuper>Up/Down = select to start/ end of file
- <LeftSuper>. = show "suggestions"
- <LeftSuper>S = save
- <LeftSuper>Q = quit app
- <LeftSuper>W = close tab
- <LeftSuper>K > <LeftSuper>W = close all tabs
- <LeftSuper>P = files
- <LeftShift><LeftSuper>P = execute command
- <LeftSuper>T = new tab
- <LeftSuper>N = new window/ file/ ???

misc macoOS shortcuts:

- <RightAlt>8 = [
- <RightAlt>9 = ]
- <LeftShift><RightAlt>8 = {
- <LeftShift><RightAlt>9 = }
