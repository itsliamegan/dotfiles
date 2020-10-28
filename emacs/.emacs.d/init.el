;; -------
;; STARTUP
;; -------


;; Increase the garbage collection threshold at startup, then set it to a
;; reasonable amount after Emacs has initialized.
(defconst *16-mb* (* 16 1024 1024))

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook (lambda ()
                                (setq gc-cons-threshold *16-mb*
                                      gc-cons-percentage 0.1)))

;; Increase the garbage collection threshold when using the minibuffer, then
;; restore it afterwards.
(add-hook 'minibuffer-setup-hook
          (lambda ()
            (setq gc-cons-threshold most-positive-fixnum)))

(add-hook 'minibuffer-exit-hook (lambda ()
                                  (run-at-time 1
                                               nil
                                               (lambda ()
                                                 (setq gc-cons-threshold *16-mb*)))))

;; Disable all the startup messages.
(setq inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(defun startup-echo-area-message () "")

;; Start in a blank scratch buffer in fundamental mode.
(setq initial-scratch-message nil
      initial-major-mode 'fundamental-mode)

;; Improve the startup screen.
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "Emacs"
      dashboard-set-init-info t
      dashboard-center-content t
      dashboard-set-footer nil
      dashboard-show-shortcuts nil
      dashboard-startup-banner 'logo
      dashboard-items '((recents  . 5)
                        (projects . 5)))

;; Store customizations in a separate file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)


;; ---------
;; UTILITIES
;; ---------


(defun delete-current-file-and-buffer ()
  (interactive)
  (let ((filename (buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-buffer)
    (message "Deleted '%s'" filename)))

(defmacro with-suppressed-message (&rest body)
  `(let ((inhibit-message t))
     ,@body))


;; ---------
;; INTERFACE
;; ---------


;; Start in fullscreen with a reasonably sized and spaced font.
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq font-size (if (eq (display-pixel-height) 900)
                    "24"
                  "28"))
(set-face-font 'default (concat "Menlo-" font-size))

;; Disable various elements of the UI.
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Smoother scrolling.
(setq scroll-margin 10
      scroll-step 1
      next-line-add-newlines nil
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; Switch to the help window after it opens.
(setq help-window-select t)

;; Customize the modeline.
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
                        20))))

;; Don't ring/show any bell.
(setq ring-bell-function 'ignore)

;; Use the correct colors in compilation buffers.
(setq compilation-environment '("TERM=xterm-256color"))
(advice-add 'compilation-filter
            :around (lambda (f proc string)
                      (funcall f proc (xterm-color-filter string))))

;; Use a pretty theme.
(load-theme 'github-modern)
(set-face-foreground 'mode-line "#444d56")
(set-face-background 'mode-line "#e1e4e8")
(set-face-background 'line-number "#f6f8fa")
(set-face-foreground 'link "#0366d6")
(set-face-foreground 'minibuffer-prompt "#0366d6")
(set-face-foreground 'font-lock-type-face "#e36209")
(set-face-foreground 'font-lock-variable-name-face "#005cc5")

;; Never implicitly resize the frame when changing fonts et al.
(setq frame-inhibit-implied-resize t)

;; Remove extraneous buffers.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")
(kill-buffer "*scratch*")


;; --------------------------
;; FILE/DIRECTORY INTERACTION
;; --------------------------


;; When opening a file, start in the home directory.
(setq default-directory "~/")

;; Delete trailing whitespace when saving a file.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; End sentences with a single space.
(setq sentence-end-double-space nil)

;; End files with a newline.
(setq require-final-newline t)

;; Refresh buffers automatically when the file changes.
(global-auto-revert-mode +1)

;; Always follow symlinks.
(setq vc-follow-symlinks t)

;; Always accept abbreviated answers "y" and "n" instead of "yes" and "no".
(fset 'yes-or-no-p 'y-or-n-p)

;; Store backups and auto-save files in the system temporary directory.
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Run commands using the system shell.
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Treat camel case words as separate words.
(add-hook 'prog-mode-hook 'subword-mode)

;; Line length of 80 characters.
(setq-default fill-column 80)

;; Indent using 2 spaces.
(setq-default indent-tabs-mode nil
              tab-width 2
              tab-stop-list (number-sequence 2 60 2))

;; Display relative line numbers on all lines but the current line. On the
;; current line, show the absolute line number.
(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)


;; ------------
;; AUTOCOMPLETE
;; ------------


;; Use ivy and counsel for pretty much everything.
(ivy-mode +1)
(counsel-mode +1)

(setq ivy-count-format ""
      ivy-initial-inputs-alist nil
      ivy-use-virtual-buffers t
      ivy-re-builders-alist '((swiper . ivy--regex-plus)
                              (counsel-rg . ivy--regex-plus)
                              (counsel-projectile-rg . ivy--regex-plus)
                              (t . ivy--regex-fuzzy)))

;; Customize some ivy-specific colors.
(set-face-attribute 'ivy-current-match nil :foreground "#0366d6" :bold t :underline nil)
(set-face-attribute 'ivy-prompt-match nil :foreground "#0366d6" :bold t :underline nil)
(set-face-background 'ivy-minibuffer-match-face-2 "#fffbdd")
(set-face-background 'ivy-minibuffer-match-face-3 "#fffbdd")
(set-face-background 'ivy-minibuffer-match-face-4 "#fffbdd")

;; Find definitions with dumb-jump and ivy.
(add-hook 'xref-backend-functions 'dumb-jump-xref-activate)
(setq xref-show-definitions-function 'ivy-xref-show-defs)


;; --------
;; PROJECTS
;; --------


(setq projectile-completion-system 'ivy
      projectile-switch-project-action 'projectile-dired)


;; -------
;; TESTING
;; -------


(defun test-project ()
  (interactive)
  (cond ((eq major-mode 'ruby-mode) (minitest-verify-all))))

(defun test-file ()
  (interactive)
  (cond ((eq major-mode 'ruby-mode) (minitest-verify))))

(defun test-rerun ()
  (interactive)
  (cond ((eq major-mode 'ruby-mode) (minitest-rerun))))


;; ---------
;; LANGUAGES
;; ---------


;; Ruby

;; Use the correct Ruby version from chruby.
(add-hook 'ruby-mode-hook
          (lambda ()
            (with-suppressed-message (chruby-use-corresponding))))

;; Scroll to the first error after running tests.
(add-hook 'minitest-compilation-mode-hook
          (lambda ()
              (make-local-variable 'compilation-scroll-output)
              (setq compilation-scroll-output 'first-error)))

;; Switch to the test window after running tests.
(add-hook 'compilation-finish-functions
          (lambda (buffer string)
            (other-window 1)))


;; -----------
;; KEYBINDINGS
;; -----------


;; Use vi-style keybindings for most modes.
(setq evil-want-keybinding nil)
(evil-mode +1)
(evil-collection-init)
(evil-commentary-mode +1)
(evil-magit-init)
(global-evil-surround-mode +1)

(add-hook 'with-editor-mode-hook 'evil-insert-state)

(setq evil-undo-system 'undo-fu)

(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

;; Use Escape instead of Ctrl-g to cancel any command.
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

;; Configure sensible, macOS-inspired keybindings.
;;
;; ---
;;
;; The keybindings are made up of "prefixes" and "modifiers". Prefixes group
;; together commands with a common theme or purpose. Modifiers can be applied to
;; certain commands within prefixes to give them different meanings.
;;
;; Prefixes:
;;
;;   Cmd   (s)   - Common macOS or macOS-esque bindings.
;;   Ctrl  (C)   - Context-based commands which are slightly less granular than
;;                 motions with text-object.
;;   Space (SPC) - Global, context-independent commands.
;;
;; Modifiers:
;;
;;   Shift  (S) - Indicates that the command performs the opposite of its
;;                typical action.
;;   Option (M) - Indicates that the command performs its typical action on a
;;                "higher level" than the standard command.

;; Cmd prefix
(global-set-key (kbd "s-M-p") 'projectile-switch-project) ; Switch project.
(global-set-key (kbd "s-p")   'projectile-find-file)      ; Find file in project.
(global-set-key (kbd "s-M-o") 'counsel-switch-bufffer)    ; Open specific buffer.
(global-set-key (kbd "s-o")   'counsel-find-file)         ; Open specific file.
(global-set-key (kbd "s-t")   'counsel-imenu)             ; Find symbol in file.
(global-set-key (kbd "s-M-f") 'counsel-projectile-rg)     ; Find text in project.
(global-set-key (kbd "s-f")   'swiper)                    ; Find text in file.
(global-set-key (kbd "s-M-r") 'projectile-replace)        ; Replace text in project.
(global-set-key (kbd "s-r")   'vr/query-replace)          ; Replace text in file.
(global-set-key (kbd "s-z")   'undo-tree-only-undo)       ; Undo.
(global-set-key (kbd "s-Z")   'undo-tree-only-redo)       ; Redo.
(global-set-key (kbd "s-,")   'previous-buffer)           ; Previous buffer.
(global-set-key (kbd "s-.")   'next-buffer)               ; Next buffer.

;; Ctrl prefix
(define-prefix-command 'jump-prefix-map)
(define-key global-map (kbd "C-j") 'jump-prefix-map)
(define-key jump-prefix-map (kbd "c") 'avy-goto-char)
(define-key jump-prefix-map (kbd "d") 'xref-find-definitions)

;; Space prefix.
(define-prefix-command 'space-prefix-map)
(define-key evil-normal-state-map (kbd "SPC") 'space-prefix-map)
(define-key space-prefix-map (kbd "SPC") 'counsel-M-x)  ; Execute command.
(define-key space-prefix-map (kbd "g")   'magit-status) ; Git status.
(define-key space-prefix-map (kbd "p")   'test-project) ; Run tests for the current project.
(define-key space-prefix-map (kbd "t")   'test-file)    ; Run tests for the current file.
(define-key space-prefix-map (kbd "r")   'test-rerun)   ; Run tests for the current file.
