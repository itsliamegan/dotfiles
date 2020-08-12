(defun show-cheat-sheet-when-pressing-prefix ()
  (which-key-mode +1))

(defun bind-escape-to-cancel-actions ()
  (general-define-key
   :keymaps 'key-translation-map

   "ESC" "C-g"))

(defun bind-commands ()
  (bind-escape-to-cancel-actions)

  (general-define-key
   :states 'normal
   :keymaps 'override

   "SPC SPC" 'counsel-M-x

   "SPC t p" 'test-project
   "SPC t f" 'test-file
   "SPC t s" 'test-single
   "SPC t r" 'test-rerun
   "SPC t t" 'test-toggle

   "SPC g" 'magit

   "s-P" 'projectile-switch-project
   "s-p" 'projectile-find-file

   "s-F" 'counsel-projectile-rg
   "s-f" 'swiper

   "s-O" 'counsel-switch-buffer
   "s-o" 'counsel-find-file

   "s-R" 'projectile-replace
   "s-r" 'vr/query-replace

   "s-." 'next-buffer
   "s-," 'previous-buffer))

(show-cheat-sheet-when-pressing-prefix)
(bind-commands)
