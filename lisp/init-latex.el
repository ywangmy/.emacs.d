(use-package reftex
  :ensure t
  :config
  (setq reftex-plug-into-AUCTeX t)
  )

(use-package cdlatex
  :ensure t
  :config
  (setq cdlatex-takeover-parenthesis nil)
  (setq cdlatex-takeover-dollar nil)
  (setq cdlatex-paired-parens nil)
  :custom
  (cdlatex-use-dollar-to-ensure-math nil)
  (cdlatex-math-modify-prefix ??)
  (cdlatex-math-symbol-prefix ?\;)
  (cdlatex-math-modify-alist '
   ((?c "\\textcolor{red}" "\\textcolor{SeaGreen}" t nil nil)
    (?h "\\colorbox{SeaGreen}" "\\colorbox{SeaGreen}" t nil nil)
    (?H "\\colorboxd{SeaGreen}" "\\colorboxd{SeaGreen}" t nil nil)
    (?t "\\text" nil t nil nil)
    (?u nil "\\underline" t nil nil)
    (?- "\\bar" "\\sout" t nil nil)
    )
   )
  :bind (:map cdlatex-mode-map
              ("<" . nil)
              )
  )

;; LaTeX-mode in latex.el
(use-package latex
  :mode ("\\.tex\\'" . LaTeX-mode)
  :hook ((LaTeX-mode . turn-on-cdlatex)   ; with AUCTeX LaTeX mode
         (LaTeX-mode . turn-on-reftex)
         (LaTeX-mode . prettify-symbols-mode)
         (LaTeX-mode . outline-minor-mode)
         (LaTeX-mode . turn-on-auto-fill)
         )
  :bind (:map LaTeX-mode-map
              ("<backtab>" . LaTeX-indent-line)
              ("C-c C-a" . (lambda () (interactive) (let (TeX-save-query) (TeX-save-document (TeX-master-file))) (TeX-command-run-all nil)))
              )
  :config
  ;; add-to-list only AFTER package loaded
  (mapc (lambda (pair) (push pair tex--prettify-symbols-alist))
        '(("\\item" . ?•)
          ("\\section" . ?§)
          ("\\subsection" . ?§)
          ("\\subsubsection" . ?§)
          ("\\begin" . ?⦃)
          ("\\end" . ?⦄)
          ("\\implies" . ?⇒)
          ("\\iff" . ?⇔)
          ("\\nrightarrow" . ?↛)
          ("\\nRightarrow" . ?⇏)
          ("\\dots" . ?…)
          ("\\cdots" . ?⋯)
          ("\\ddots" . ?⋱)
          ("\\vdots" . ?⋮)
          ("\\bot" . ?⟂)
          ("\\overline" . ?‾)
          ("\\pm" . ?±)
          ("\\mp" . ?∓)
          ("\\star" . ?★)
          )
        )
  (add-to-list 'LaTeX-verbatim-environments "lstlisting")
  (setq preview-scale-function
        (lambda () (* 1.0 (funcall (preview-scale-from-face)))))
  :custom
  (LaTeX-fill-excluded-macros '("hypersetup" "title" "author" "date"))
  (TeX-newline-function 'reindent-then-newline-and-indent)
  )

(provide 'init-latex)
