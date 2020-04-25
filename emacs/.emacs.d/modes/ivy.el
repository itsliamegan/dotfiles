(defun show-recent-files-in-bookmarks-and-lists ()
  (setq ivy-use-virtual-buffers t))

(defun fuzzy-match-candidates-except-swiper ()
  (setq ivy-re-builders-alist
        '((swiper . ivy--regex-plus)
          (t . ivy--regex-fuzzy))))

(defun dont-start-inputs-with-caret ()
  (setq ivy-initial-inputs-alist nil))

(defun dont-show-candidate-count ()
  (setq ivy-count-format ""))

(ivy-mode +1)
(counsel-mode +1)

(show-recent-files-in-bookmarks-and-lists)
(fuzzy-match-candidates-except-swiper)
(dont-start-inputs-with-caret)
(dont-show-candidate-count)
