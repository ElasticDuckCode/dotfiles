;;
;; Configure Emacs packages
;;

;; MELPA Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package sicp :ensure t)

(use-package vterm :ensure t)

(use-package osx-trash :ensure t)

(use-package geiser-mit :ensure t)

(use-package geiser-guile :ensure t)

(use-package fzf
  :ensure t
  :bind
    ;; Don't forget to set keybinds!
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        ;; command used for `fzf-grep-*` functions
        ;; example usage for ripgrep:
        ;; fzf/grep-command "rg --no-heading -nH"
        fzf/grep-command "grep -nrH"
        ;; If nil, the fzf buffer will appear at the top of the window
        fzf/position-bottom t
        fzf/window-height 15))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(use-package evil
  :ensure t
  :demand t
  :init
  ;; Global settings that must be set BEFORE evil loads
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)    ; Required for evil-collection
  (setq evil-undo-system 'undo-redo) ; Built-in Emacs 28+ undo/redo system

  :config
  (evil-mode 1))

(with-eval-after-load 'evil
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-ex-define-cmd "Explore" 'dired-jump)
  (evil-define-key 'normal 'global (kbd "<leader>ff") 'find-file)
  (evil-define-key 'normal 'global (kbd "<leader>bb") 'switch-to-buffer)
  (setq evil-insert-state-cursor 'box)

  (with-eval-after-load 'fzf
  ;(evil-define-key 'normal 'global (kbd "<leader>ff") #'fzf-find-file)
  ;(evil-define-key 'normal 'global (kbd "<leader>bb") #'fzf-switch-buffer)
  (define-key evil-motion-state-map (kbd "C-f") #'fzf-find-file)))

(with-eval-after-load 'osx-trash
  (when (eq system-type 'darwin)
    (osx-trash-setup)))

(use-package kanagawa-themes
  :ensure t
  :config
  (load-theme 'kanagawa-dragon t))

(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl")
  :config
  (slime-setup '(slime-fancy)))
