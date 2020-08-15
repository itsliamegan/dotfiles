(defun set-company-mode-colors ()
  (set-face-attribute 'company-preview nil
                      :background "#151515"
                      :foreground "#a0a0a0")
  (set-face-attribute 'company-preview-common nil
                      :background "#151515"
                      :foreground "#a0a0a0"))

(defun set-comment-face ()
  (set-face-italic 'font-lock-comment-face nil))

(defun configure-theme ()
  (load-theme 'jbeans t)
  (set-comment-face)
  (add-hook 'company-mode-hook 'set-company-mode-colors))

(defun set-font ()
  (set-face-attribute 'default nil :font "Monaco-30"))

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
  (set-face-attribute 'show-paren-match nil :weight 'normal)
  (add-hook 'prog-mode-hook 'show-paren-mode))

(configure-theme)
(set-font)
(hide-graphical-ui-elements)
(hide-minor-modes-in-modeline)
(highlight-offending-characters)
(highlight-current-line)
(highlight-matching-parens)
