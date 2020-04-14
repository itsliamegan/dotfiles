(defun enable-evil-bindings-for-many-builtin-modes ()
  (evil-collection-init))

(defun enable-surround-operations ()
  (global-evil-surround-mode +1))

(defun bind-argument-operations ()
  (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
  (define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

  (define-key evil-normal-state-map "L" 'evil-forward-arg)
  (define-key evil-normal-state-map "H" 'evil-backward-arg)
  (define-key evil-motion-state-map "L" 'evil-forward-arg)
  (define-key evil-motion-state-map "H" 'evil-backward-arg)

  (define-key evil-normal-state-map "K" 'evil-jump-out-args))

(setq evil-want-keybinding nil)
(evil-mode +1)

(enable-evil-bindings-for-many-builtin-modes)
(enable-surround-operations)
(bind-argument-operations)
