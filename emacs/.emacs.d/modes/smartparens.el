(require 'smartparens-config)

(add-hook 'prog-mode-hook
          (lambda ()
            (smartparens-mode +1)))
