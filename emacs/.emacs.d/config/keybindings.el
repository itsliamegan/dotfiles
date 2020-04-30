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

   "C-S-p" 'projectile-switch-project
   "C-p" 'projectile-find-file

   "C-S-o" 'dired
   "C-o" 'find-file

   "C-S-f" 'counsel-projectile-rg
   "C-f" 'swiper

   "C-S-r" 'projectile-replace
   "C-r" 'vr/query-replace

   "C-<tab>" 'other-window
   "C-t" 'split-window-right
   "C-w" 'delete-window

   "C-s" 'save-buffer
   "C-," 'previous-buffer
   "C-." 'next-buffer

   "SPC SPC" 'counsel-M-x
   "SPC q" 'save-buffers-kill-terminal
   "SPC g" 'magit))

(show-cheat-sheet-when-pressing-prefix)
(bind-commands)
