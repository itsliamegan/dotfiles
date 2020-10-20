(defun set-comment-face ()
  (set-face-italic 'font-lock-comment-face nil))

(defun configure-theme ()
  (load-theme 'pastel t))

(defun set-font ()
  (let ((font-size (if (eq (display-pixel-height) 900)
                       "24"
                     "28")))
    (set-face-attribute 'default nil :font (concat "InconsolataG-" font-size))))

(defun hide-graphical-ui-elements ()
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (set-window-scroll-bars (minibuffer-window) nil nil))

(defun hide-minor-modes-in-modeline ()
  (setq minions-mode-line-lighter ""
        minions-mode-line-delimiters '("" . ""))
  (minions-mode +1))

(defun highlight-offending-characters ()
  ;; face - Required to highlight anything.
  ;; lines-tail - Anything past the line length.
  ;; tabs - Tab characters.
  ;; trailing - Trailing whitespace.
  (setq whitespace-style '(face lines-tail tabs trailing))
  (global-whitespace-mode +1))

(defun highlight-current-line ()
  (global-hl-line-mode +1))

(defun highlight-matching-parens ()
  (setq show-paren-delay 0
        show-paren-style 'parenthesis)
  (add-hook 'prog-mode-hook
            (lambda ()
              (show-smartparens-mode)
              (set-face-attribute 'sp-pair-overlay-face nil :underline nil))))

(defun match-fringe-with-background ()
  (set-face-attribute 'fringe nil
                      :foreground (face-foreground 'default)
                      :background (face-background 'default)))

(defun use-proper-colors-in-compilation-buffer ()
  (setq compilation-environment '("TERM=xterm-256color"))
  (advice-add 'compilation-filter :around (lambda (f proc string)
                                            (funcall f proc (xterm-color-filter string)))))

(configure-theme)
(set-font)
(hide-graphical-ui-elements)
(hide-minor-modes-in-modeline)
(highlight-offending-characters)
(highlight-current-line)
(highlight-matching-parens)
(match-fringe-with-background)
(use-proper-colors-in-compilation-buffer)
