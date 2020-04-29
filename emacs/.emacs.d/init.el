(defun load-config-files ()
  (add-to-list 'load-path "~/.emacs.d/config")
  (load "utils.el")
  (with-suppressed-message
    (load "tweaks.el")
    (load "ui.el")
    (load-files-in-directory "~/.emacs.d/modes")
    (load "keybindings.el")))

(defun increase-garbage-collection-threshold ()
  (setq gc-cons-threshold most-positive-fixnum
        gc-cons-percentage 0.6))

(defun decrease-garbage-collection-threshold-after-startup ()
  (add-hook 'emacs-startup-hook
            (lambda ()
              (setq 50-megabytes (* 50 1000 1000)
                    gc-cons-threshold 50-megabytes
                    gc-cons-percentage 0.1))))

(defun increase-garbage-collection-threshold-during-startup ()
  (increase-garbage-collection-threshold)
  (decrease-garbage-collection-threshold-after-startup))

(defun configure-package-management ()
  (require 'cask "~/.cask/cask.el")
  (cask-initialize)
  (require 'pallet)
  (pallet-mode +1))

(increase-garbage-collection-threshold-during-startup)
(configure-package-management)

(load-config-files)
