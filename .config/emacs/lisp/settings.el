;;
;; Configure Emacs settings
;;

(setq custom-file (locate-user-emacs-file "custom.el"))                     ; Set separate configuration file for auto-generated settings
(load custom-file 'noerror)

(add-to-list 'default-frame-alist '(font . "BlexMono Nerd Font Medium 15")) ; Set font
