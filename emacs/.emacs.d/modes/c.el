(defun indent-using-two-spaces-in-c ()
  (c-set-offset 'substatement-open 0)
  (setq c-basic-offset 2
        c-indent-level 2))

(indent-using-two-spaces-in-c)
