(defun show-cheat-sheet-when-pressing-prefix ()
  (which-key-mode +1))

(defun bind-escape-to-cancel-actions ()
  (general-define-key
   :keymaps 'key-translation-map

   "ESC" "C-g"))

(defun bind-normal-copy-paste ()
  (cua-mode +1))

(defun bind-test-commands ()
  (general-define-key
   :states 'normal
   :states 'override

   "SPC t p" 'test-project
   "SPC t f" 'test-file
   "SPC t s" 'test-single
   "SPC t r" 'test-rerun
   "SPC t t" 'test-toggle))

(defun bind-commands ()
  (bind-escape-to-cancel-actions)
  (bind-normal-copy-paste)
  (bind-test-commands)

  (general-define-key
   :states 'normal
   :keymaps 'override

   "s-P" 'projectile-switch-project
   "s-p" 'projectile-find-file

   "s-O" 'dired
   "s-o" 'find-file

   "s-F" 'counsel-projectile-rg
   "s-f" 'swiper

   "s-R" 'projectile-replace
   "s-r" 'vr/query-replace

   "s-<tab>" 'other-window
   "s-t" 'split-window-right
   "s-w" 'delete-window

   "s-s" 'save-buffer
   "s-," 'previous-buffer
   "s-." 'next-buffer

   "s-Z" 'undo-tree-redo
   "s-z" 'undo-tree-undo

   "SPC SPC" 'counsel-M-x
   "SPC q" 'save-buffers-kill-terminal
   "SPC g" 'magit))

(show-cheat-sheet-when-pressing-prefix)
(bind-commands)
