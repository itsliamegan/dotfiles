(defun test-project ()
  (interactive)
  (cond ((eq major-mode 'ruby-mode) (rspec-verify-all))))

(defun test-file ()
  (interactive)
  (cond ((eq major-mode 'ruby-mode) (rspec-verify))))

(defun test-single ()
  (interactive)
  (cond ((eq major-mode 'ruby-mode) (rspec-verify-single))))

(defun test-rerun ()
  (interactive)
  (cond ((eq major-mode 'ruby-mode) (rspec-rerun))))

(defun test-toggle ()
  (interactive)
  (cond ((eq major-mode 'ruby-mode) (rspec-toggle-spec-and-target))))
