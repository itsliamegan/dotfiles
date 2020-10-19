(defun complete-with-ido ()
  (setq projectile-completion-system 'ido))

(defun open-dired-on-switch-project ()
  (setq projectile-switch-project-action 'projectile-dired))

(defun ignore-third-party-files ()
  (add-to-list 'projectile-globally-ignored-directories "*node_modules")
  (add-to-list 'projectile-globally-ignored-directories "vendor"))

(projectile-mode +1)

(complete-with-ido)
(open-dired-on-switch-project)
(ignore-third-party-files)
