(defun delay-error-checking ()
  (setq flycheck-idle-change-delay 1.2))

(defun disable-unhelpful-checkers ()
  (setq-default flycheck-disabled-checkers '(emacs-lisp
                                             emacs-lisp-checkdoc
                                             ruby-reek
                                             ruby-rubocop)))

(global-flycheck-mode +1)

(delay-error-checking)
(disable-unhelpful-checkers)
