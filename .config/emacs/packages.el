(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode 1))

(use-package evil-collection
  :ensure t
  :after evil
  :config (evil-collection-init))

(use-package kanagawa-themes
  :ensure t
  :config (load-theme 'kanagawa-dragon t))

(use-package osx-trash
  :ensure t)

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package geiser-mit
  :ensure t)


;; Set EVIL mode keybindings
(with-eval-after-load 'evil
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-define-key 'normal 'global (kbd "<leader>f") 'find-file)
  (evil-define-key 'normal 'global (kbd "<leader>b") 'list-buffers)
  (evil-ex-define-cmd "Explore" 'dired-jump))

;; Ensure that trash will work on Mac
(with-eval-after-load 'osx-trash
  (when (eq system-type 'darwin)
    (osx-trash-setup)))

;; Create undo-history for files
