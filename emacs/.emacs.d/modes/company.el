(defun complete-with-tab-key ()
  (define-key company-active-map (kbd "<tab>") 'company-complete))

(defun enable-completions-when-programming ()
  (add-hook 'prog-mode-hook
            (lambda ()
              (company-mode +1)
              (complete-with-tab-key))))

(defun slightly-delay-showing-completions ()
  (setq company-idle-delay .1))

(defun only-show-completions-inline ()
  (add-hook 'company-mode-hook
            (lambda ()
              (setq company-frontends '(company-preview-frontend)))))

(enable-completions-when-programming)
(slightly-delay-showing-completions)
(only-show-completions-inline)
