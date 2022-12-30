;; YASnippet
(defun my-selected-text ()
  "mark word at point"
  (when (not (region-active-p))
    (let* ((start (point)) (end (point))
           (syntaxes "w_") ;; "w" for real word
           )
      (skip-syntax-backward syntaxes)
      (setq start (point))
      (skip-syntax-forward syntaxes)
      (setq end (point))
      (unless (= start end)
        (goto-char start)
        (set-mark-command ())
        (goto-char end)
        )))
  nil
  )

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :hook
  (yasnippet-mode . #'my-selected-text)
  :custom
  (yas-snippet-dirs '("~/.emacs.d/yasnippets"))
  (yas-prompt-functions '(yas-dropdown-prompt))
  (yas-wrap-around-region nil)
  (yas-triggers-in-field t)
  )

(defun my-yas-try-expanding-auto-snippets ()
  (when yas-minor-mode
    (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
      (yas-expand))))
(add-hook 'post-command-hook #'my-yas-try-expanding-auto-snippets)

(provide 'init-yasnippet)
