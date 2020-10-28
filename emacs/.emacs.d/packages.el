;; Evaluate this buffer to install all the necessary packages.

(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq packages '(avy
                 chruby
                 counsel
                 counsel-projectile
                 dashboard
                 dumb-jump
                 exec-path-from-shell
                 evil
                 evil-args
                 evil-collection
                 evil-commentary
                 evil-magit
                 evil-surround
                 flx
                 github-modern-theme
                 ivy
                 ivy-xref
                 magit
                 minitest
                 projectile
                 ripgrep
                 swiper
                 undo-fu
                 xterm-color))

(dolist (package packages)
  (unless (package-installed-p package)
    (package-install package)))
