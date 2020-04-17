(defun wrap-lines-longer-than-line-length ()
  (add-hook 'text-mode-hook 'auto-fill-mode))

(wrap-lines-longer-than-line-length)
