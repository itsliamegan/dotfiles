;; Setup package.el and add MELPA as a source.
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Install use-package to declaratively manage packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Make use-package always install packages if they aren't already
;; installed.
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Define some utility functions.

(defun util/kill-other-buffers ()
  "Kill all buffers other than the current."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun util/transparency (amount)
  "Set Emacs to be (100-AMOUNT)% transparent."
  (interactive "nTransparency Amount:")
  (set-frame-parameter (selected-frame) 'alpha amount))

;; Define some global keybindings.

(global-set-key (kbd "C-c n") 'next-buffer)
(global-set-key (kbd "C-c b") 'previous-buffer)

;; Disable the Emacs splash screen and start in org mode.
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

;; Disable any visual or audio error bell.
(setq ring-bell-function 'ignore)

;; Use 2 spaces instead of tabs for indenting.
(setq indent-tabs-mode nil
      tab-stop-list (number-sequence 2 60 2))

;; Disable most of the graphical aspects of the UI.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Place all auto-save and backup files in the /tmp directory.
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

;; Highlight the current line.
(global-hl-line-mode)

;; Allow diminishing of minor modes in the modeline and diminish some
;; built-in modes.
(use-package diminish
  :config
  (diminish 'abbrev-mode)
  (diminish 'auto-revert-mode)
  (diminish 'eldoc-mode))

;; Highlight characters after the 80 character limit.
(use-package whitespace
  :diminish (global-whitespace-mode
	     whitespace-mode)
  :config
  (setq whitespace-style '(face
			   trailing
                           space-before-tab
			   space-after-tab
			   lines-tail)
        whitespace-line-column 70)
  (global-whitespace-mode))

;; Magit for interacting with git repos.
(use-package magit
  :bind ("C-c g" . magit-status))

;; Use ivy for completion and allow fuzzy matching.
(use-package ivy
  :diminish ivy-mode
  :config
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (ivy-mode))

;; Projectile to manage projects, but don't use the "prefix-style"
;; keybindings.
(use-package projectile
  :diminish projectile-mode
  :config
  (setq projectile-completion-system 'ivy
        projectile-require-project-root nil))

;; Counsel projectile combines ivy and projectile.
(use-package counsel-projectile
  :after projectile
  :bind (("C-c f" . counsel-projectile-find-file)
         ("C-c p" . counsel-projectile-switch-project))
  :config
  (counsel-projectile-mode))

;; Use dumb-jump to jump to definition of a symbol.
(use-package dumb-jump
  :bind ("C-c d" . dumb-jump-go)
  :config
  (setq dumb-jump-selector 'ivy)
  (dumb-jump-mode))

;; Markdown mode for plaintext editing.
(use-package markdown-mode)

;; Org mode for plaintext editing.
(use-package org)

;; YAML mode for editing YAML files.
(use-package yaml-mode)

;; Use chruby to change Ruby versions.
(use-package chruby
  :config
  (chruby-use-corresponding))

;; Minitest mode for testing Ruby.
(use-package minitest
  :bind (("C-c t t" . minitest-verify)
         ("C-c t a" . minitest-verify-all))

  :config
  (add-hook 'ruby-mode-hook 'minitest-mode))

;; Open links in Emacs' built in browser.
(setq browse-url-browser-function 'eww-browse-url)

;; Engine mode for searching the web.
(use-package engine-mode
  :config
  (engine/set-keymap-prefix (kbd "C-c s"))
  (defengine duckduckgo
    "https://duckduckgo.com/?q=%s"
    :keybinding "d")
  (defengine stackoverflow
    "https://stackoverflow.com/search?q=%s"
    :keybinding "s")
  (engine-mode))

;; Elfeed for reading RSS.
(use-package elfeed
  :bind ("C-c r" . elfeed)
  :config
  (setq elfeed-feeds '(("https://www.counterpunch.org/feed" politics)
		       ("https://jacobinmag.com/feed" politics)
		       ("https://newrepublic.com/rss.xml" politics)
		       ("https://theintercept.com/feed?rss" politics)
		       ("https://www.thenation.com/feed/?post_type=article" politics)
		       ("https://news.ycombinator.com/rss" dev))))

;; Install and use the solarized theme.
(use-package solarized-theme
  :config
  (setq solarized-high-contrast-mode-line t
        solarized-use-variable-pitch nil
        solarized-scale-org-headlines nil)
  (load-theme 'solarized-dark t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (elfeed yaml-mode use-package solarized-theme minitest markdown-mode helm-projectile flycheck fill-column-indicator evil-surround evil-magit evil-collection dumb-jump diminish counsel-projectile chruby))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

