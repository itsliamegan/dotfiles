(defun properly-indent-after-newlines ()
  (setq ruby-use-smie nil
        ruby-deep-indent-paren nil))

(defun use-correct-ruby-from-chruby ()
  (add-hook 'ruby-mode-hook
            (lambda ()
              (with-suppressed-message (chruby-use-corresponding)))))

(defun scroll-to-first-error-after-running-tests ()
  (add-hook 'minitest-compilation-mode-hook
            (lambda ()
              (make-local-variable 'compilation-scroll-output)
              (setq compilation-scroll-output 'first-error))))

(defun switch-to-test-window-after-running ()
  (add-hook 'compilation-finish-functions
            (lambda (buffer string)
              (other-window 1))))

(properly-indent-after-newlines)
(use-correct-ruby-from-chruby)
(scroll-to-first-error-after-running-tests)
;(switch-to-test-window-after-running)
