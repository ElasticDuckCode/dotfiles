;; Packages
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

;; Package Configuration
(with-eval-after-load 'evil
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-define-key 'normal 'global (kbd "<leader>f") 'find-file)
  (evil-define-key 'normal 'global (kbd "<leader>b") 'switch-to-buffer)
  (evil-ex-define-cmd "Explore" 'dired-jump))

(with-eval-after-load 'osx-trash
  (when (eq system-type 'darwin)
    (osx-trash-setup)))


;; Settings
(add-to-list 'default-frame-alist '(undecorated . t))                           ;; Remove window decoration
(menu-bar-mode -1)                                                              ;; Remove the menu bar
(toggle-scroll-bar -1)                                                          ;; Remove the scroll bar
(tool-bar-mode -1)                                                              ;; Remove the tool bar
(setq inhibit-startup-screen t)                                                 ;; Don't show the startup
(setq inhibit-splash-screen t)                                                  ;; Dont' show splash
(setq custom-file (locate-user-emacs-file "custom.el"))                         ;; Set custom-file for auto-generated config.
(load custom-file 'noerror)                                                     ;; Load the custom-file
(setq delete-by-moving-to-trash t)                                              ;; Set delete commands in dired to move to trash.
(add-to-list 'default-frame-alist '(font . "BlexMono Nerd Font Medium 14"))     ;; Set font
(let ((backup-dir (expand-file-name "backups/" user-emacs-directory)))          ;; Move backups/auto-saves/lock-files to same folder
  (unless (file-exists-p backup-dir)
    (make-directory backup-dir t))
  (setq backup-by-copying t
	backup-directory-alist `(("." . ,backup-dir))
	delete-old-versions t
	kept-new-versions 6
	kept-old-versions 2
	version-control t)
  (setq auto-save-file-name-transforms
	`((".*" ,(file-name-as-directory backup-dir) t)))
  (setq lock-file-name-transforms
        `((".*" ,backup-dir t))))
