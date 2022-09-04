;; YASnippet
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :custom
  (yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-prompt-functions '(yas-dropdown-prompt))
  (yas-wrap-around-region t)
  (yas-triggers-in-field t)
  )
(defun my-yas-try-expanding-auto-snippets ()
  (when yas-minor-mode
    (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
      (yas-expand))))
(add-hook 'post-command-hook #'my-yas-try-expanding-auto-snippets)

(provide 'init-yasnippet)
