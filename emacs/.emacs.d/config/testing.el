(defun test-project ()
  (interactive)
  (cond ((eq major-mode 'ruby-mode) (minitest-verify-all))))

(defun test-file ()
  (interactive)
  (cond ((eq major-mode 'ruby-mode) (minitest-verify))))

(defun test-single ()
  (interactive)
  (cond ((eq major-mode 'ruby-mode) (minitest-verify-single))))

(defun test-rerun ()
  (interactive)
  (cond ((eq major-mode 'ruby-mode) (minitest-rerun))))

(defun test-toggle ()
  (interactive)
  (cond ((eq major-mode 'ruby-mode) (minitest-toggle-spec-and-target))))
