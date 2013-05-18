;;===========================================================
;;键绑定
;;===========================================================


(global-set-key [f1] 'manual-entry)
(global-set-key [C-f1] 'info )

;;f3为查找字符串,alt+f3关闭当前缓冲区
(global-set-key [f3] 'grep-find)
(global-set-key [M-f3] 'kill-this-buffer)

;;.emacs中设一个speedbar的快捷键
 ;;使用 n 和 p 可以上下移动，
 ;; + 展开目录或文件进行浏览，- 收缩，RET 访问目录或文件，g 更新 speedbar。
(global-set-key [(f4)] 'speedbar-get-focus)


;;F5显示/隐藏工具栏 方便调试
(global-set-key [f5] 'tool-bar-mode)
;;ctrl-F5显示/隐藏菜单栏 ;; M-x menu-bar-open
(global-set-key [C-f5] 'menu-bar-mode)

(global-set-key [f10] 'gdb)
(global-set-key [f9] 'smart-compile)


;;目的是开一个shell的小buffer，用于更方便地测试程序(也就是运行程序了)，我经常会用到。
;;f8就是另开一个buffer然后打开shell，C-f8则是在当前的buffer打开shell,shift+f8清空eshell
(defun open-eshell-other-buffer ()
  "Open eshell in other buffer"
  (interactive)
  (split-window-vertically)
  (eshell))
(defun my-eshell-clear-buffer ()
  "Eshell clear buffer."
  (interactive)
  (let ((eshell-buffer-maximum-lines 0))
    (eshell-truncate-buffer)))
(global-set-key [(f8)] 'open-eshell-other-buffer)
(global-set-key [C-f8] 'eshell)
(global-set-key [S-f8] 'my-eshell-clear-buffer)

;;设置[C-f9]为调用dired命令
(global-set-key [C-f6] 'dired)
(global-set-key [f6] 'other-window);f9在其他窗口之间旋转

;;设置F10为撤销
(global-set-key [C-f10] 'undo)


;;设置F11快捷键指定Emacs 的日历系统
(global-set-key [f11] 'calendar) 
;;设置C-F11 快速察看日程安排
(global-set-key [C-f11] 'list-bookmarks)
;;设置S-f11添加注释
(global-set-key [S-f11] 'comment-region)
;;设置M-f11删除注释
(global-set-key [M-f11] 'uncomment-region)



;; ;;F12调到函数定义
(global-set-key [f12] 'semantic-ia-fast-jump)
;;shift-f12跳回去
(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
            (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))


;;==================ecb的配置=================================
;;为了ecb窗口的切换
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

;;隐藏和显示ecb窗口
;;ctrl-f4,激活,ecb
(global-set-key [C-f4] 'ecb-activate)
(global-set-key [S-f4] 'ecb-hide-ecb-windows)
(global-set-key [M-f4] 'ecb-show-ecb-windows)


;;设置M-g为goto-line
(global-set-key (kbd "M-g") 'goto-line)

;;取消control+space键设为mark
(global-set-key (kbd "C-SPC") 'nil)

;;这样 我就不用按 C-@ 来 setmark 了, C-@ 很不好按。
(global-set-key (kbd "M-<SPC>") 'set-mark-command)


;;设置home键指向buffer开头，end键指向buffer结尾
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
;; "C-,"设为屏幕左移命令
(global-set-key (kbd "C-,") 'scroll-left)
;; "C-."设为屏幕右移命令
(global-set-key (kbd "C-.") 'scroll-right)


;;C-z 设置标记
(global-set-key (kbd "C-z") 'set-mark-command)
;;关闭当前窗口,alt+4
(global-set-key (kbd "M-4") 'delete-window)
;;(global-set-key (kbd "M-4") 'kill-this-buffer)
;;关闭其他窗口,alt+1
(global-set-key (kbd "M-1") 'delete-other-windows)
;;水平分割窗口,alt+2
(global-set-key (kbd "M-2") 'split-window-vertically)
;;垂直分割窗口,alt+3
(global-set-key (kbd "M-3") 'split-window-horizontally)
;;切换到其他窗口，alt+0
(global-set-key (kbd "M-0") 'other-window)
;;显示缓冲区完整名称
(global-set-key (kbd "M-5") 'display-buffer-name)

;;================================================================
;;;;;;;;;;;;;;;;;;;;;;;;;;;自动插入括号;;;;;;;;;;;;;;
(show-paren-mode t)
(setq skeleton-pair t)
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd  "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "<" ) 'skeleton-pair-insert-maybe)
(global-set-key (kbd "“" ) 'skeleton-pair-insert-maybe)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
