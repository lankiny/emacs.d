;;==============================================================
;;gdb-UI配置
;;==============================================================
(setq gdb-use-separate-io-buffer t)
(setq gdb-many-windows t)
;;(load-library "multi-gud.el")
;;(load-library "multi-gdb-ui.el")


;;==================================================
;;cedet插件设置
;;==================================================
(add-to-list 'load-path "~/.emacs.d/install/cedet-1.0/speedbar")
(add-to-list 'load-path "~/.emacs.d/install/cedet-1.0/eieio")
(add-to-list 'load-path "~/.emacs.d/install/cedet-1.0/semantic")
(add-to-list 'load-path "~/.emacs.d/install/cedet-1.0/common")
(require 'cedet)
(require 'semantic-decorate-include)
(require 'semantic-gcc)
(require 'semantic-ia)
(require 'eassist)
(require 'semantic-lex-spp)
 
(semantic-load-enable-excessive-code-helpers)
 
(custom-set-variables
 '(semantic-idle-scheduler-idle-time 3)
 '(semantic-self-insert-show-completion-function
   (lambda nil (semantic-ia-complete-symbol-menu (point))))
 '(global-semantic-tag-folding-mode t nil (semantic-util-modes)))
 
(setq senator-minor-mode-name "SN")
(setq semantic-imenu-auto-rebuild-directory-indexes nil)
(global-srecode-minor-mode 1)
(global-semantic-mru-bookmark-mode 1)
(global-semantic-tag-folding-mode 1)
 
(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
(setq-mode-local erlang-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
 
;; customisation of modes
(defun alexott/cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  ;;
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
 
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key (kbd "C-c <left>") 'semantic-tag-folding-fold-block)
  (local-set-key (kbd "C-c <right>") 'semantic-tag-folding-show-block)
  )
(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'lisp-mode-hook 'alexott/cedet-hook)
(add-hook 'scheme-mode-hook 'alexott/cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'alexott/cedet-hook)
(add-hook 'erlang-mode-hook 'alexott/cedet-hook)
 
(defun alexott/c-mode-cedet-hook ()
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)
 
;; hooks, specific for semantic
(defun alexott/semantic-hook ()
  (imenu-add-to-menubar "TAGS")
  )
(add-hook 'semantic-init-hooks 'alexott/semantic-hook)
 
;; gnu global support
(when (cedet-gnu-global-version-check t)
  (require 'semanticdb-global)
  (semanticdb-enable-gnu-global-databases 'c-mode)
  (semanticdb-enable-gnu-global-databases 'c++-mode))
 
;; ctags
(when (cedet-ectag-version-check t)
  (require 'semanticdb-ectag)
  (semantic-load-enable-primary-exuberent-ctags-support))
 
;;; ede customization
(global-ede-mode t)
(ede-enable-generic-projects)

;;====================== END CEDET =====================================


;;ecb配置
;;==============================================================
;;(require 'ecb)
;;开启ecb用,M-x:ecb-activate
(require 'ecb-autoloads)
;;自动启动ecb并且不显示每日提示
;;(require 'ecb)
;;(setq ecb-auto-activate t)
(setq ecb-tip-of-the-day nil)

;; Ecb的操作:
;; C-c . g d 目录列表窗口
;; C-c . g s 源码窗口
;; C-c . g m 方法和变量窗口
;; C-c . g h 历史窗口
;; C-c . g l 最后选择过的编辑窗口
;; C-c . g 1 编辑窗口1
;; C-c . g n 编辑窗口n
;; C-c . l c 选择版面
;; C-c . l r 重画版面
;; C-c . l t 拴牢版面(锁定版面)
;; C-c . l w 拴牢可见的ecb窗口
;; C-c . \   拴牢编绎窗口

;; 其中l为小写字母(L)
;;===================================================

;;==========================================================
;;加载cscope
;;==========================================================
(require 'xcscope)



;;======================================================================
;;C/C++ SECTION

;;代码缩进量
(setq c-basic-offset 6)
;;缩进风格
(setq c-default-style '((java-mode . "java")
                                  (awk-mode . "awk")
                                  (other . "linux")))

;;将回车（RET）绑定到自动换行缩进
(defun my-make-CR-do-indent ()
        (define-key c-mode-base-map "\C-m" 'c-context-line-break))
      (add-hook 'c-initialization-hook 'my-make-CR-do-indent)



;;自动补全括号
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
                               (?` ?` _ "''")
                               (?\( ?  _ " )")
                               (?\[ ?  _ "]")
                               (?\{ ? _ " }")
                               ))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)
;;输入左边的括号，就会自动补全右边的部分.包括(), "", [] , {} , 等等。

;;=====================================================================

