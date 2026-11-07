;;
;; Configure Emacs packages
;;

;; MELPA Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; vterm
(use-package vterm
  :ensure t)

;; evil
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

;; Configure Evil
(with-eval-after-load 'evil
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-ex-define-cmd "Explore" 'dired-jump)
  (evil-define-key 'normal 'global (kbd "<leader>ff") 'find-file)
  (evil-define-key 'normal 'global (kbd "<leader>bb") 'switch-to-buffer)
  )

;; themes
(use-package kanagawa-themes
  :ensure t
  :config
  (load-theme 'kanagawa-dragon t))

;; lisp
(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl")
  :config
  (slime-setup '(slime-fancy)))
