(defun store-customize-values-in-separate-file ()
  (setq custom-file "~/.emacs.d/custom.el")
  (create-file-unless-exists custom-file)

  (load custom-file))

(defun always-load-newest-file-version ()
  (setq load-prefer-newer t))

(defun improve-startup-screen ()
    (setq dashboard-center-content t
          dashboard-show-shortcuts nil
          dashboard-set-footer nil
          dashboard-items '((projects . 5)
                            (recents . 5)))
  (dashboard-setup-startup-hook))

(defun hide-startup-messages ()
  (defun startup-echo-area-message () "")
  (setq inhibit-splash-screen t
        initial-scratch-message nil))

(defun indent-using-two-spaces ()
  (setq-default indent-tabs-mode nil
                tab-width 2
                tab-stop-list (number-sequence 2 60 2)))

(defun remove-trailing-whitespace-on-save ()
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(defun answer-questions-with-abbreviations ()
  (defalias 'yes-or-no-p 'y-or-n-p))

(defun treat-camelcase-as-separate-words ()
  (add-hook 'prog-mode-hook 'subword-mode))

(defun follow-symlinks-transparently ()
  (setq vc-follow-symlinks t))

(defun end-sentences-with-one-space ()
  (setq sentence-end-double-space nil))

(defun insert-final-newline-on-save ()
  (setq require-final-newline t))

(defun reload-buffers-when-files-change ()
  (global-auto-revert-mode +1))

(defun dont-show-or-ring-bell-on-error ()
  (setq ring-bell-function 'ignore))

(defun set-line-length (line-length)
  (setq-default fill-column line-length))

(defun yank-to-point-instead-of-cursor ()
  (setq mouse-yank-at-point t))

(defun backup-and-autosave-to-temp-directory ()
  (setq backup-directory-alist
        `((".*" . ,temporary-file-directory))

        auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t))))

(defun improve-dired-output ()
  ;; G - Don't show the group that owns the file.
  ;; h - Show human readable file sizes.
  (setq dired-listing-switches "-aGhl --group-directories-first"))

(defun always-use-syntax-highlighting ()
  (global-font-lock-mode +1))

(store-customize-values-in-separate-file)
(always-load-newest-file-version)
(improve-startup-screen)
(hide-startup-messages)
(indent-using-two-spaces)
(remove-trailing-whitespace-on-save)
(answer-questions-with-abbreviations)
(treat-camelcase-as-separate-words)
(follow-symlinks-transparently)
(end-sentences-with-one-space)
(insert-final-newline-on-save)
(reload-buffers-when-files-change)
(dont-show-or-ring-bell-on-error)
(set-line-length 80)
(yank-to-point-instead-of-cursor)
(backup-and-autosave-to-temp-directory)
(improve-dired-output)
(always-use-syntax-highlighting)
