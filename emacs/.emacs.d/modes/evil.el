(defun enable-evil-bindings-for-many-builtin-modes ()
  (evil-collection-init))

(defun enable-surround-operations ()
  (global-evil-surround-mode +1))

(defun enable-comment-operations ()
  (evil-commentary-mode +1))

(defun bind-argument-operations ()
  (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
  (define-key evil-outer-text-objects-map "a" 'evil-outer-arg))

(setq evil-want-keybinding nil)
(evil-mode +1)

(enable-evil-bindings-for-many-builtin-modes)
(enable-surround-operations)
(enable-comment-operations)
(bind-argument-operations)
