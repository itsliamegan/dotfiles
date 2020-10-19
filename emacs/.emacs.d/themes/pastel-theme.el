(deftheme pastel "A low-contrast theme based on the iTerm pastel color preset.")

(setq pastel-theme--background   "#000000"
      pastel-theme--foreground   "#c7c7c7"
      pastel-theme--highlight    "#202020"
      pastel-theme--gray         "#616161"
      pastel-theme--lightgray    "#8e8e8e"
      pastel-theme--red          "#ff8272"
      pastel-theme--lightred     "#ffc4bd"
      pastel-theme--green        "#b4fa72"
      pastel-theme--lightgreen   "#d6fcb9"
      pastel-theme--yellow       "#fefdc2"
      pastel-theme--lightyellow  "#fefdd5"
      pastel-theme--blue         "#a5d5fe"
      pastel-theme--lightblue    "#c1e3fe"
      pastel-theme--magenta      "#ff8ffd"
      pastel-theme--lightmagenta "#ffb1fe"
      pastel-theme--cyan         "#d0d1fe"
      pastel-theme--lightcyan    "#e5e6fe"
      pastel-theme--white        "#f1f1f1"
      pastel-theme--lightwhite   "#feffff")

(custom-theme-set-faces 'pastel
  `(default ((t (:background ,pastel-theme--background :foreground ,pastel-theme--foreground))))

  ;; Syntax highlighting.
  `(font-lock-keyword-face ((t (:foreground ,pastel-theme--lightblue))))
  `(font-lock-type-face ((t (:foreground ,pastel-theme--lightyellow))))
  `(font-lock-function-name-face ((t (:foreground ,pastel-theme--yellow))))
  `(font-lock-variable-name-face ((t (:foreground ,pastel-theme--lightcyan))))
  `(font-lock-builtin-face ((t (:foreground ,pastel-theme--lightblue))))
  `(font-lock-constant-face ((t (:foreground ,pastel-theme--lightcyan))))
  `(font-lock-string-face ((t (:foreground ,pastel-theme--lightgreen))))
  `(font-lock-comment-face ((t (:foreground ,pastel-theme--lightgray))))

  ;; Misc
  `(button ((t (:foreground ,pastel-theme--lightblue :underline t))))
  `(link ((t (:foreground ,pastel-theme--lightblue :underline t))))
  `(minibuffer-prompt ((t (:foreground ,pastel-theme--lightblue))))

  ;; Background highlighting.
  `(highlight ((t :underline t)))
  `(hl-line ((t :background ,pastel-theme--highlight)))
  `(region ((t :background ,pastel-theme--highlight)))

  ;; Whitespace.
  `(whitespace-line ((t (:background ,pastel-theme--red))))
  `(whitespace-trailing ((t (:background ,pastel-theme--red))))

  ;; Modeline.
  `(mode-line ((t (:background ,pastel-theme--lightgray :foreground ,pastel-theme--white))))
  `(mode-line-inactive ((t (:background ,pastel-theme--gray :foreground ,pastel-theme--lightgray))))

  ;; Search / Replace.
  `(isearch ((t :underline t)))
  `(lazy-highlight ((t :underline t)))

  ;; Show Paren.
  `(show-paren-match ((t :underline t)))
  `(show-paren-mismatch ((t :background ,pastel-theme--red)))

  ;; Magit.
  `(magit-diff-added-highlight ((t (:background ,pastel-theme--highlight :foreground ,pastel-theme--green))))
  `(magit-diff-added ((t (:foreground ,pastel-theme--green))))
  `(magit-diff-removed-highlight ((t (:background ,pastel-theme--highlight :foreground ,pastel-theme--red))))
  `(magit-diff-removed ((t (:foreground ,pastel-theme--red))))
  `(magit-diff-context-highlight ((t (:background ,pastel-theme--highlight))))

  ;; Flycheck
  `(flycheck-error ((t (:underline (:style wave :color ,pastel-theme--red)))))
  `(flycheck-fringe-error ((t (:foreground ,pastel-theme--red))))
  `(flycheck-warning ((t (:underline (:style wave :color ,pastel-theme--yellow)))))
  `(flycheck-fringe-warning ((t (:foreground ,pastel-theme--yellow))))

  ;; Avy.
  `(avy-lead-face ((t (:background ,pastel-theme--lightgreen :foreground ,pastel-theme--gray))))
  `(avy-lead-face-0 ((t (:background ,pastel-theme--lightmagenta :foreground ,pastel-theme--gray)))))
