(defun use-improved-js-mode ()
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(defun indent-using-two-spaces-in-js ()
  (setq js-indent-level 2))

(defun dont-show-error-for-missing-semicolons ()
  (setq js2-strict-missing-semi-warning nil)
  (setq js2-missing-semi-one-line-override nil))

(use-improved-js-mode)
(indent-using-two-spaces-in-js)
(dont-show-error-for-missing-semicolons)
