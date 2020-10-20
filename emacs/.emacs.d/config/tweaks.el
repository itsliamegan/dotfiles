(defun store-customize-values-in-separate-file ()
  (setq custom-file "~/.emacs.d/custom.el")
  (create-file-unless-exists custom-file)

  (load custom-file))

(defun store-custom-themes-in-themes-directory ()
  (setq custom-theme-directory "~/.emacs.d/themes"))

(defun always-load-newest-file-version ()
  (setq load-prefer-newer t))

(defun improve-startup-screen ()
  (setq dashboard-center-content t
        dashboard-set-footer nil
        dashboard-show-shortcuts nil
        dashboard-startup-banner 'logo
        dashboard-items '((recents . 5)
                          (projects . 5)))
  (dashboard-setup-startup-hook))

(defun hide-startup-messages ()
  (defun startup-echo-area-message () "")
  (setq inhibit-splash-screen t
        initial-scratch-message nil))

(defun indent-using-two-spaces-in-most-modes ()
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
  (setq dired-listing-switches "-aGhl"))

(defun always-use-syntax-highlighting ()
  (global-font-lock-mode +1))

(defun switch-to-help-window-after-opening ()
  (setq help-window-select t))

(defun fullscreen-on-startup ()
  (add-to-list 'default-frame-alist '(fullscreen . maximized)))

(defun show-relative-line-numbers-for-programming-modes ()
  (setq display-line-numbers-type 'relative)
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))

(defun use-system-PATH ()
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(defun remove-messages-buffer ()
  (setq-default message-log-max nil)
  (kill-buffer "*Messages*"))

(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))

(defun remove-extraneous-buffers ()
  (remove-messages-buffer)
  (remove-scratch-buffer))

(defun custom-mode-line-render (left center right &optional lpad rpad)
  "Return a string the width of the current window with LEFT, CENTER, and RIGHT
spaced out accordingly, LPAD and RPAD, can be used to add a number of spaces to
the front and back of the string."
  (condition-case err
      (let* ((left (if lpad (concat (make-string lpad ?\s) left) left))
             (right (if rpad (concat right (make-string rpad ?\s)) right))
             (width (apply '+ (window-width) (let ((m (window-margins))) (list (or (car m) 0) (or (cdr m) 0)))))
             (total-length (+ (length left) (length center) (length right) 2)))
        (when (> total-length width) (setq left "" right ""))
        (let* ((left-space (/ (- width (length center)) 2))
               (right-space (- width left-space (length center)))
               (lspaces (max (- left-space (length left)) 1))
               (rspaces (max (- right-space (length right)) 1 0)))
          (concat left (make-string lspaces  ?\s)
                  center
                  (make-string rspaces ?\s)
                  right)))
    (error (format "[%s]: (%s) (%s) (%s)" err left center right))))

(defun custom-mode-line-format ()
  (setq-default mode-line-format
                '((:eval (custom-mode-line-render
                          (concat (format-mode-line "%b ")
                                  (downcase (concat "(" mode-name ")"))
                                  (if (and (buffer-modified-p) (not buffer-read-only))
                                      " [+]"
                                    ""))
                          ""
                          (format-mode-line "%l,%c")
                          1
                          20)))))

(defun jump-to-definitions ()
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  (setq xref-after-jump-hook (lambda ()
                               (delete-other-windows))))

(store-customize-values-in-separate-file)
(store-custom-themes-in-themes-directory)
(always-load-newest-file-version)
(improve-startup-screen)
(hide-startup-messages)
(indent-using-two-spaces-in-most-modes)
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
(switch-to-help-window-after-opening)
(fullscreen-on-startup)
;; (show-relative-line-numbers-for-programming-modes)
(use-system-PATH)
(remove-extraneous-buffers)
(custom-mode-line-format)
(jump-to-definitions)
