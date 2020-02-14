;; Setup package.el and add MELPA as a source.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
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

;; Disable any visual or audio error bell.
(setq ring-bell-function 'ignore)

;; When the point moves outside of the visible window, only move the
;; buffer as far as the point goes.
(setq scroll-conservatively 100)

;; Use 2 spaces instead of tabs for indenting.
(setq indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 2 60 2))

;; Disable most of the graphical aspects of the UI.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Place all auto-save and backup files in the /tmp directory.
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

;; Highlight the current line.
(global-hl-line-mode)

;; Org mode for plaintext editing.
(use-package org)

;; Magit for interacting with git repos.
(use-package magit
  :config
  (define-key global-map (kbd "C-x g") 'magit-status))

;; Use Projectile to navigate around projects.
(use-package projectile
  :config
  (projectile-mode)

  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

  (setq projectile-completion-system 'ivy
        projectile-require-project-root nil))

;; Use Ivy as the completion system.
(use-package ivy
  :config
  (ivy-mode))

;; Use dumb-jump to jump to definition of a symbol.
(use-package dumb-jump
  :config
  (dumb-jump-mode))

;; Show a column at 80 characters to indicate code length limit.
(use-package fill-column-indicator
  :config
  (setq fci-column-indicator 80)
  (setq fci-rule-use-dashes t)
  (setq fci-rule-width 2)
  (setq fci-rule-color "#696969")
  (fci-mode))

(use-package chruby
  :config
  (chruby-use-corresponding))

;; Install and use the solarized theme.
(use-package solarized-theme
  :config
  (load-theme 'solarized-dark t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (chruby dumb-jump rbenv evil-collection use-package twilight-theme s projectile minions linum-relative ivy fill-column-indicator evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
