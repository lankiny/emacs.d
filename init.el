;;emacs参数
;; -nw 不使用图形界面 -no-window
;; -q  不加载配置文件
;; --debug-init
;;http_proxy=http://127.0.0.1:8087 emacs

;;;; 添加Emacs搜索路径
(add-to-list 'load-path "~/.emacs.d/_emacs")
(add-to-list 'load-path "~/.emacs.d/install/ecb-2.40")
;;--------------------------------------------

;; ===================color theme====================>
(add-to-list 'load-path "~/.emacs.d/install/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-deep-blue)

;;===================================================>

;;;=======================自动补全====================
(require 'yasnippet-autocomplete)

;;=================================================================================

;;;;读取脚本
(load "base.el")
(load "cykbd.el")


;;为了编程的配置
(load "cycode.el")
(load "smart-compile.el")

;;收发邮件mu4e(Gmail)
(load "init-mu.el")

;;ecb自动添加===============================================================
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(global-semantic-stickyfunc-mode nil nil (semantic-util-modes))
 '(global-semantic-tag-folding-mode t nil (semantic-util-modes))
 '(semantic-idle-scheduler-idle-time 3)
 '(semantic-self-insert-show-completion-function (lambda nil (semantic-ia-complete-symbol-menu (point))))
 '(session-use-package t nil (session)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
 
;;ecb自动添加结束============================================================


