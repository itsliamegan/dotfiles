(defun set-mode-line-colors ()
  (set-face-attribute 'mode-line nil
                      :background "#2f2f2f"
                      :foreground "#f5f5f5"
                      :box '(:color "#f5f5f5"))
  (set-face-attribute 'mode-line-inactive nil
                      :background "#202020"
                      :foreground "#bebebe"
                      :box '(:color "#bebebe")))

(defun set-company-mode-colors ()
  (set-face-attribute 'company-preview nil
                      :background "#000000"
                      :foreground "#f6f3e8")
  (set-face-attribute 'company-preview-common nil
                      :background "#000000"
                      :foreground "#f6f3e8"))

(defun configure-theme ()
  (load-theme 'ir-black t)
  (set-face-attribute 'default nil :foreground "#ffffff")
  (set-mode-line-colors)
  (add-hook 'company-mode-hook 'set-company-mode-colors))

(defun set-font-size ()
  (setq font-size-in-pt 28)
  (setq font-size (* font-size-in-pt 10))
  (set-face-attribute 'default nil :height font-size))

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

(defun use-pretty-symbols ()
  (global-prettify-symbols-mode +1))

(configure-theme)
(set-font-size)
(hide-graphical-ui-elements)
(hide-minor-modes-in-modeline)
(highlight-offending-characters)
(highlight-matching-parens)
(use-pretty-symbols)
