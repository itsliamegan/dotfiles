(defun configure-theme ()
  (setq solarized-high-contrast-mode-line t
        solarized-use-variable-pitch nil
        solarized-scale-org-headlines nil)
  (load-theme 'solarized-dark t))

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

(defun highlight-expressions-enclosed-by-parens ()
  (setq show-paren-delay 0
        show-paren-style 'expression)
  (set-face-attribute 'show-paren-match nil :weight 'normal)
  (add-hook 'prog-mode-hook 'show-paren-mode))

(configure-theme)
(hide-graphical-ui-elements)
(hide-minor-modes-in-modeline)
(highlight-offending-characters)
(highlight-current-line)
(highlight-expressions-enclosed-by-parens)
