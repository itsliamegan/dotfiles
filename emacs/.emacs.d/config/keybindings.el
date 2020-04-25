(defun show-cheat-sheet-when-pressing-prefix ()
  (which-key-mode +1))

(defun bind-escape-to-cancel-actions ()
  (general-define-key
   :keymaps 'key-translation-map

   "ESC" "C-g"))

(defun bind-normal-copy-paste ()
  (cua-mode +1))

(defun bind-commands ()
  (general-define-key
   :states 'normal
   :keymaps 'override

   "C-S-p" 'projectile-switch-project
   "C-p" 'projectile-find-file

   "C-s" 'save-buffer
   "C-," 'previous-buffer
   "C-." 'next-buffer

   "C-f" 'swiper
   "C-r" 'vr/query-replace

   "SPC SPC" 'counsel-M-x
   "SPC q" 'save-buffers-kill-terminal
   "SPC g" 'magit))

(defun bind-rspec-commands ()
  (general-define-key
   :states 'normal
   :keymaps 'rspec-verifiable-mode-map

   "SPC a" 'rspec-verify-all
   "SPC v" 'rspec-verify
   "SPC s" 'rspec-verify-single
   "SPC r" 'rspec-rerun
   "SPC t" 'rspec-toggle-spec-and-target))

(show-cheat-sheet-when-pressing-prefix)
(bind-escape-to-cancel-actions)
(bind-normal-copy-paste)
(bind-commands)
(bind-rspec-commands)
