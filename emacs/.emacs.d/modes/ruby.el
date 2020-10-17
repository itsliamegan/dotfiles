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
              (make-local-variable 'compilation-scroll-output)
              (setq compilation-scroll-output 'first-error))))

(defun switch-to-rspec-window-after-running ()
  (add-hook 'compilation-finish-functions
            (lambda (buffer string)
              (other-window 1))))

(properly-indent-after-newlines)
(use-correct-ruby-from-chruby)
(configure-rspec-independently-from-emacs)
(scroll-to-first-error-after-running-specs)
(switch-to-rspec-window-after-running)
