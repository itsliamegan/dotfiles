(defun scroll-to-first-error ()
    (add-hook 'rspec-compilation-mode-hook
            (lambda ()
                (make-local-variable 'compilation-scroll-output)
                (setq compilation-scroll-output 'first-error))))
