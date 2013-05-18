;;==========================================================
;;YASnippet的配置
;;==========================================================
;;太强大了，强大的模板功能
(add-to-list 'load-path "~/.emacs.d/install/yasnippet-0.8")
(require 'yasnippet)    ;;not yasnippet-bundle
(yas-global-mode 1)
(setq yas/also-auto-indent-first-line t)

;;=================================================================================


;;自动补全
(add-to-list 'load-path "~/.emacs.d/install/auto-complete")
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/install/auto-complete/dict")
(global-auto-complete-mode t)



(provide 'yasnippet-autocomplete)
