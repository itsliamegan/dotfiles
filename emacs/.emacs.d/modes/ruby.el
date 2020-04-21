(defun properly-indent-after-newlines ()
  (setq ruby-use-smie nil
        ruby-deep-indent-paren nil))

(defun use-correct-ruby-from-chruby ()
  (add-hook 'ruby-mode-hook
            (lambda ()
              (with-suppressed-message (chruby-use-corresponding)))))

(defun test-with-minitest ()
  (add-hook 'ruby-mode-hook
            (lambda ()
              (minitest-mode +1))))

(defun scroll-to-first-error-after-running-tests ()
  (add-hook 'minitest-compilation-mode-hook
            (lambda ()
              (setq compilation-scroll-output 'first-error))))

(properly-indent-after-newlines)
(use-correct-ruby-from-chruby)
(test-with-minitest)
(scroll-to-first-error-after-running-tests)
