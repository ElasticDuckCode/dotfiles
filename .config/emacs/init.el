;; MELPA Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

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
  (setq evil-want-keybinding nil) ; Required for evil-collection
  (setq evil-undo-system 'undo-redo) ; Built-in Emacs 28+ undo/redo system

  :config
  (evil-mode 1))

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

;; Emacs Configuration
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Set Font
(set-frame-font "BlexMono Nerd Font Medium 18" nil t)
