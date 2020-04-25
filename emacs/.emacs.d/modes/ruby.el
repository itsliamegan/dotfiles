(defun properly-indent-after-newlines ()
  (setq ruby-use-smie nil
        ruby-deep-indent-paren nil))

(defun use-correct-ruby-from-chruby ()
  (add-hook 'ruby-mode-hook
            (lambda ()
              (with-suppressed-message (chruby-use-corresponding)))))

(defun configure-rspec-independently-from-emacs ()
  (setq rspec-command-options ""))

(defun scroll-to-first-error-after-running-specs ()
  (add-hook 'rspec-compilation-mode-hook
            (lambda ()
              (setq compilation-scroll-output 'first-error))))

(properly-indent-after-newlines)
(use-correct-ruby-from-chruby)
(configure-rspec-independently-from-emacs)
(scroll-to-first-error-after-running-specs)
