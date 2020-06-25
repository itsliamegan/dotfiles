(defun enable-mode-in-correct-files ()
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode)))

(defun properly-indent ()
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))

(defun pair-keywords ()
  (add-hook 'web-mode-hook 'turn-off-smartparens-mode)
  (setq web-mode-enable-auto-pairing t))

(enable-mode-in-correct-files)
(properly-indent)
(pair-keywords)
