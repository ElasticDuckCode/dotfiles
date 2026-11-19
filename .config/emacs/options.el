;; Remove window decoration
(add-to-list 'default-frame-alist '(undecorated . t))                           

;; Remove the menu bar
(menu-bar-mode -1)                                                              

;; Remove the scroll bar
(toggle-scroll-bar -1)                                                          

;; Remove the tool bar
(tool-bar-mode -1)                                                              

;; Don't show the startup
(setq inhibit-startup-screen t)                                                 

;; Dont' show splash
(setq inhibit-splash-screen t)                                                  

;; Set custom-file for auto-generated config.
(setq custom-file (locate-user-emacs-file "custom.el"))                         

;; Load the custom-file
(load custom-file 'noerror)                                                     

;; Set delete commands in dired to move to trash.
(setq delete-by-moving-to-trash t)                                              

;; Set font
(add-to-list 'default-frame-alist                                               
	     '(font . "BlexMono Nerd Font-18:semibold"))            

;; Move backups/auto-saves/lock-files to same folder
(let ((backup-dir (expand-file-name "backups/" user-emacs-directory)))          
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
