;; YASnippet

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :custom
  (yas-snippet-dirs '("~/.emacs.d/yasnippets"))
  (yas-prompt-functions '(yas-dropdown-prompt))
  (yas-wrap-around-region nil)
  (yas-triggers-in-field t)
  )

(provide 'init-yasnippet)
