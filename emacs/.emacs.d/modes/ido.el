(defun create-a-buffer-if-no-candidates-match ()
  (setq ido-create-new-buffer 'always))

(defun show-candidates-vertically ()
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)
  (ido-vertical-mode +1))

(defun fuzzy-match-candidates ()
  (setq ido-enable-flex-matching t
        ido-use-faces nil
        flx-ido-use-faces t)
  (flx-ido-mode +1))

(defun use-ido-everywhere ()
  (setq ido-everywhere t)
  (crm-custom-mode +1)
  (ido-ubiquitous-mode +1))

(defun improve-M-x ()
  (smex-initialize))

(ido-mode +1)

(create-a-buffer-if-no-candidates-match)
(show-candidates-vertically)
(fuzzy-match-candidates)
(use-ido-everywhere)
(improve-M-x)
