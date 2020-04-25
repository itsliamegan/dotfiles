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

(defun use-correct-ruby-in-rspec ()
  (setq rspec-use-chruby t))

(defun switch-to-rspec-window-after-running ()
  (defadvice compile (after jump-back activate)
    (other-window 1)))

(properly-indent-after-newlines)
(use-correct-ruby-from-chruby)
(configure-rspec-independently-from-emacs)
(scroll-to-first-error-after-running-specs)
(use-correct-ruby-in-rspec)
