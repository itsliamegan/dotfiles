(defun enable-completions-when-programming ()
  (add-hook 'prog-mode-hook
            (lambda ()
              (company-mode +1))))

(defun slightly-delay-showing-completions ()
  (setq company-idle-delay .2))

(defun only-show-completions-inline ()
  (add-hook 'company-mode-hook
            (lambda ()
              (setq company-frontends '(company-preview-frontend)))))

(enable-completions-when-programming)
(slightly-delay-showing-completions)
(only-show-completions-inline)
