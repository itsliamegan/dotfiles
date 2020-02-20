;; All my configuration lives in a heavily documented org file. We
;; load this file and evaluate all the emacs-lisp code blocks.
(org-babel-load-file "~/.emacs.d/configuration.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yaml flx yaml-mode use-package solarized-theme minitest markdown-mode helm-projectile flycheck fill-column-indicator evil-surround evil-magit evil-collection engine-mode emms elfeed dumb-jump diminish counsel-projectile chruby))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
