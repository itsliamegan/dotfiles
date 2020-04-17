(defun show-cheat-sheet-when-pressing-prefix ()
  (which-key-mode +1))

(defun bind-commands ()
  (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)
  (global-set-key (kbd "M-p") 'projectile-switch-project)

  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "C-x g") 'magit))

(show-cheat-sheet-when-pressing-prefix)
(bind-commands)
