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
  :custom-face
  (font-latex-sectioning-5-face ((t (:inherit nil :foreground "dark green"))))
  :custom
  (cdlatex-use-dollar-to-ensure-math nil)
  (cdlatex-math-modify-prefix "C-`")
  (cdlatex-math-symbol-prefix ?`)
  (cdlatex-math-modify-alist '
   (;; Character Math Text t nil nil
    (?c "\\textcolor{red}" "\\textcolor{SeaGreen}" t nil nil)
    (?C "\\mathcal" "\\textsc" t nil nil)
    (?h "\\colorbox{SeaGreen}" "\\colorbox{SeaGreen}" t nil nil)
    (?H "\\colorboxd{SeaGreen}" "\\colorboxd{SeaGreen}" t nil nil)
    (?t "\\text" nil t nil nil)
    (?u "\\unit" "\\underline" t nil nil)
    (?- "\\bar" "\\sout" t nil nil)
    (?\] "\\underbracket" nil t nil nil)
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
  (add-to-list 'LaTeX-verbatim-environments "lstinputlisting")
  (add-to-list 'LaTeX-verbatim-environments "lstinline")
  ;; escape indentation for verbatim
  (add-to-list 'LaTeX-indent-environment-list '("lstlisting" current-indentation))
  (add-to-list 'LaTeX-indent-environment-list '("lstinputlisting" current-indentation))
  (add-to-list 'LaTeX-indent-environment-list '("algorithm" current-indentation))
  (add-to-list 'LaTeX-indent-environment-list '("algorithmic" current-indentation))  
  (setq preview-scale-function
        (lambda () (* 0.75 (funcall (preview-scale-from-face)))))
  
  :custom
  (LaTeX-fill-excluded-macros '("hypersetup" "title" "author" "date"))
  (TeX-newline-function 'reindent-then-newline-and-indent)
  )

(provide 'init-latex)
