
;; tabbar
(require 'tabbar)
(tabbar-mode t)

;;------------------------------------------------------------------------------
;;tabbar分组设置
;;-----------------------------------------------------------------------------
(defun tabbar-buffer-groups ()
   "Return the list of group names the current buffer belongs to.
     Return a list of one element based on major mode."
   (list
    (cond
     ((or (get-buffer-process (current-buffer))
          ;; Check if the major mode derives from `comint-mode' or
          ;; `compilation-mode'.
          (tabbar-buffer-mode-derived-p
           major-mode '(comint-mode compilation-mode)))
      "Process"
      )
     ;; ((member (buffer-name)
     ;;          '("*scratch*" "*Messages*" "*Help*"))
     ;;  "Common"
     ;;  )
     ((string-equal "*" (substring (buffer-name) 0 1))
      "Common"
      )
     ((member (buffer-name)
              '("xyz" "day" "m3" "abi" "for" "nws" "eng" "f_g" "tim" "tmp"))
      "Main"
      )
     ((eq major-mode 'dired-mode)
      "Dired"
      )
     ((eq major-mode 'cc-mode)
      '("C/C++")
      )
     ((memq major-mode
            '(help-mode apropos-mode Info-mode Man-mode))
      "Common"
      )
     ((memq major-mode
            '(rmail-mode
              rmail-edit-mode vm-summary-mode vm-mode mail-mode
              mh-letter-mode mh-show-mode mh-folder-mode
              gnus-summary-mode message-mode gnus-group-mode
              gnus-article-mode score-mode gnus-browse-killed-mode))
      "Mail"
      )
     (t
      ;; Return `mode-name' if not blank, `major-mode' otherwise.
      (if (and (stringp mode-name)
               ;; Take care of preserving the match-data because this
               ;; function is called when updating the header line.
               (save-match-data (string-match "[^ ]" mode-name)))
          mode-name
        (symbol-name major-mode))
      ))))
   

;;设置tabbar快捷键
(global-set-key (kbd "<C-M-up>") 'tabbar-backward-group)
(global-set-key (kbd "<C-M-down>") 'tabbar-forward-group)
(global-set-key (kbd "<C-M-left>") 'tabbar-backward)
(global-set-key (kbd "<C-M-right>") 'tabbar-forward)


;;;; 设置tabbar外观
;; 设置默认主题: 字体, 背景和前景颜色，大小
;; (set-face-attribute 'tabbar-default nil
                  
;;                     :background "#405060"
;;                     :foreground "#8ac6d4"
                   
;;                     )
;; ;; 设置左边按钮外观：外框框边大小和颜色
;; (set-face-attribute 'tabbar-button nil 
;;                     :inherit 'tabbar-default
;;                     :box '( :color "gray30")
;;                     )
;; ;; 设置当前tab外观：颜色，字体，外框大小和颜色
;; (set-face-attribute 'tabbar-selected nil
;;                     :inherit 'tabbar-default
;;                     :foreground "DarkGreen"
;;                     :background "LightGoldenrod"
;;                     :box '( :color "DarkGoldenrod")
;;                     ;; :overline "black"
;;                     ;; :underline "black"
                   
;;                     )
;; ;; 设置非当前tab外观：外框大小和颜色
;; (set-face-attribute 'tabbar-unselected nil
;;                     :inherit 'tabbar-default
;;                     :box '( :color "gray70")
;;                     )


;;------------------------------------------------------------------------------
;;tabbar美化，参考自：http://hi.baidu.com/fcl06/item/1043b9fefdbae65cc9f33782
;;------------------------------------------------------------------------------

;; Hooks based on yswzing's hooks, but modified for this function state.
;; called each time the modification state of the buffer changed
(defun ep-modification-state-change ()
  (tabbar-set-template tabbar-current-tabset nil)
  (tabbar-display-update))

;; first-change-hook is called BEFORE the change is made
(defun ep-on-buffer-modification ( a b c)
    ;;(set-buffer-modified-p t)
    (ep-modification-state-change))

(add-hook 'after-save-hook 'ep-modification-state-change)
;;(add-hook 'first-change-hook 'ep-on-buffer-modification)
(add-hook 'after-change-functions 'ep-on-buffer-modification)

(defvar tabbar-last-tab nil)

(defvar tabbar-close-tab-function nil
  "Function to call to close a tabbar tab.  Passed a single argument, the tab
construct to be closed.")

(defvar tabbar-new-tab-function nil
  "Function to call to create a new buffer in tabbar-mode.  Optional single
argument is the MODE for the new buffer.")

(defun tabbar-buffer-close-tab (tab)
  (let ((buffer (tabbar-tab-value tab)))
    (with-current-buffer buffer
      (kill-buffer buffer))))

(setq tabbar-close-tab-function 'tabbar-buffer-close-tab)

(defun tabbar-context-menu ()
  "Pop up a context menu."
  (interactive)
  (popup-menu (tabbar-popup-menu)))
(defun tabbar-popup-print ()
  "Print Buffer"
  (interactive))
(defun tabbar-popup-close ()
  "Tab-bar pop up close"
  (interactive)
  (funcall tabbar-close-tab-function tabbar-last-tab))
(defun tabbar-popup-close-but ()
  "Tab-bar close all BUT this buffer"
  (interactive)
  (let ((cur (symbol-value (funcall tabbar-current-tabset-function))))
    (mapc (lambda(tab)
            (unless (eq tab tabbar-last-tab)
              (funcall tabbar-close-tab-function tab)))
          cur)))
(defun tabbar-popup-save-as ()
  "Tab-bar save as"
  (interactive)
  (let* ((buf (tabbar-tab-value tabbar-last-tab)))
    (save-excursion
      (set-buffer buf)
      (call-interactively 'write-file))))
(defun tabbar-popup-rename ()
  "Tab-bar rename"
  (interactive)
  (let* ((buf (tabbar-tab-value tabbar-last-tab))
         (fn (buffer-file-name buf)))
    (save-excursion
      (set-buffer buf)
      (when (call-interactively 'write-file)
        (if (string= fn (buffer-file-name (current-buffer)))
            (error "Buffer has same name.  Just saved instead.")
          (delete-file fn))))))
(defun tabbar-popup-delete ()
  "Tab-bar delete file"
  (interactive)
  (let* ((buf (tabbar-tab-value tabbar-last-tab))
        (fn (buffer-file-name buf)))
    (when (yes-or-no-p (format "Are you sure you want to delete %s?" buf))
      (save-excursion
        (set-buffer buf)
        (set-buffer-modified-p nil)
        (kill-buffer (current-buffer))
        (delete-file fn)))))
(defun tabbar-popup-remove-compression-ext (file-name &optional new-compression)
  "Removes compression extension, and possibly adds a new extension"
  (let ((ret file-name))
    (when (string-match "\\(\\(?:\\.\\(?:Z\\|gz\\|bz2\\|tbz2?\\|tgz\\|svgz\\|sifz\\|xz\\|dz\\)\\)?\\)\\(\\(?:~\\|\\.~[0-9]+~\\)?\\)\\'" ret)
      (setq ret (replace-match (concat (or new-compression "") (match-string 2 ret)) t t ret)))
    (symbol-value 'ret)))
(defun tabbar-popup-gz (&optional ext err)
  "Gzips the file"
  (interactive)
  (let* ((buf (tabbar-tab-value tabbar-last-tab))
         (fn (buffer-file-name buf))
         (nfn (tabbar-popup-remove-compression-ext fn (or ext ".gz"))))
    (if (string= fn nfn)
        (error "Already has that compression!")
      (save-excursion
        (set-buffer buf)
        (write-file nfn)
        (if (not (file-exists-p nfn))
            (error "%s" (or err "Could not gzip file!"))
          (when (file-exists-p fn)
            (delete-file fn)))))))
(defun tabbar-popup-bz2 ()
  "Bzip file"
  (interactive)
  (tabbar-popup-gz ".bz2" "Could not bzip the file!"))
(defun tabbar-popup-decompress ()
  "Decompress file"
  (interactive)
  (tabbar-popup-gz "" "Could not decompress the file!"))
(defun tabbar-popup-menu ()
  "Keymap for pop-up menu.  Emacs only."
  `(,(format "%s" (nth 0 tabbar-last-tab))
    ["Close" tabbar-popup-close]
    ["Close all BUT this" tabbar-popup-close-but]
    "--"
    ["Save" tabbar-popup-save]
    ["Save As" tabbar-popup-save-as]
    "--"
    ["Rename File" tabbar-popup-rename
     :active (and (buffer-file-name (tabbar-tab-value tabbar-last-tab)) (file-exists-p (buffer-file-name (tabbar-tab-value tabbar-last-tab))))]
    ["Delete File" tabbar-popup-delete
     :active (and (buffer-file-name (tabbar-tab-value tabbar-last-tab)) (file-exists-p (buffer-file-name (tabbar-tab-value tabbar-last-tab))))]
    "--"
    ["Gzip File" tabbar-popup-gz
     :active (and (executable-find "gzip") (buffer-file-name (tabbar-tab-value tabbar-last-tab))
                  (file-exists-p (buffer-file-name (tabbar-tab-value tabbar-last-tab)))
                  (not (string-match "\\.gz\\(?:~\\|\\.~[0-9]+~\\)?\\'" (buffer-file-name (tabbar-tab-value tabbar-last-tab)))))]
    ["Bzip File" tabbar-popup-bz2
     :active (and (executable-find "bzip2") (buffer-file-name (tabbar-tab-value tabbar-last-tab))
                  (file-exists-p (buffer-file-name (tabbar-tab-value tabbar-last-tab)))
                  (not (string-match "\\.bz2\\(?:~\\|\\.~[0-9]+~\\)?\\'" (buffer-file-name (tabbar-tab-value tabbar-last-tab)))))]
    ["Decompress File" tabbar-popup-decompress
     :active (and
              (file-exists-p (buffer-file-name (tabbar-tab-value tabbar-last-tab)))
              (string-match "\\(?:\\.\\(?:Z\\|gz\\|bz2\\|tbz2?\\|tgz\\|svgz\\|sifz\\|xz\\|dz\\)\\)\\(\\(?:~\\|\\.~[0-9]+~\\)?\\)\\'"
                            (buffer-file-name (tabbar-tab-value tabbar-last-tab))))
     ]
;;    "--"
    ;;    ["Print" tabbar-popup-print]
    )
  )


(defun tabbar-select-tab-callback (event)
  "Handle a mouse EVENT on a tab.
Pass mouse click events on a tab to `tabbar-click-on-tab'."
  (interactive "@e")
  (when (tabbar-click-p event)
    (let ((target (posn-string (event-start event))))
      (tabbar-click-on-tab
       (get-text-property (cdr target) 'tabbar-tab (car target))
       event
       (get-text-property (cdr target) 'tabbar-action (car target))))))

(defsubst tabbar-click-on-tab (tab &optional type action)
  "Handle a mouse click event on tab TAB.
Call `tabbar-select-tab-function' with the received, or simulated
mouse click event, and TAB.
Optional argument TYPE is a mouse click event type (see the function
`tabbar-make-mouse-event' for details)."
  (let* ((mouse-event (tabbar-make-mouse-event type))
         (mouse-button (event-basic-type mouse-event)))
    (if  (eq mouse-button 'mouse-3)
        (progn
          (setq tabbar-last-tab tab)
          (tabbar-context-menu))
    (if (eq action 'close-tab)
        (when (and (eq mouse-button 'mouse-1) tabbar-close-tab-function)
          (funcall tabbar-close-tab-function tab))
      (when tabbar-select-tab-function
        (funcall tabbar-select-tab-function
                 (tabbar-make-mouse-event type) tab)
        (tabbar-display-update))))))

(define-prefix-command 'lwindow-map)
(global-set-key (kbd "<lwindow>") 'lwindow-map)
(global-set-key (kbd "<lwindow> <up>") 'tabbar-backward-group)  ;; 这几句的目的是绑定快捷键这样就可以直接用快捷键来操做了。
(global-set-key (kbd "<lwindow> <down>") 'tabbar-forward-group) ;;不过没有发现有很大用处，所以注释了。
(global-set-key (kbd "<lwindow> <left>") 'tabbar-backward)
(global-set-key (kbd "<lwindow> <right>") 'tabbar-forward)
(defun tabbar-buffer-select-tab (event tab)
  "On mouse EVENT, select TAB."
  (let ((mouse-button (event-basic-type event))
        (buffer (tabbar-tab-value tab)))
    (cond
     ((eq mouse-button 'mouse-1)
      (switch-to-buffer buffer))
     ((eq mouse-button 'mouse-3)
      (pop-to-buffer buffer t))
     ((eq mouse-button 'mouse-2)
      (kill-buffer buffer)))
    ;; Disable group mode.
    (setq tabbar-buffer-group-mode nil)))
;;-------------------------------------------
;; 
;;-------------------------------------------
;;(setq EmacsPortable-global-tabbar 't) ; If you want tabbar
;;(setq EmacsPortable-global-ruler 't) ; if you want a global ruler
;;(setq EmacsPortable-popup-menu 't) ; If you want a popup menu.
;;(setq EmacsPortable-popup-toolbar 't) ; If you want a popup toolbar
;;(require 'tabbar-ruler)
;;-------------------------------------------
;; 
;;-------------------------------------------
(defun* tabbar-ruler-image (&key type disabled color)
  "Returns the scroll-images"
  (let ((clr (or color (if disabled "#0000FF" "#FF5500"))))
    (if (eq type 'close)
        (format "/* XPM */
        static char * close_tab_xpm[] = {
        \"14 11 3 1\",
        \"       c None\",
        \".      c %s\",
        \"+      c #D2D4D1\",
        \"     .....    \",
        \"    .......   \",
        \"   .........  \",
        \"  ... ... ... \",
        \"  .... . .... \",
        \"  ..... ..... \",
        \"  .... . .... \",
        \"  ... ... ... \",
        \"   .........  \",
        \"    .......   \",
        \"     .....    \"};" clr)
    (format
     "/* XPM */
static char * scroll_%s_%s_xpm[] = {
\"17 17 2 1\",
\"       c None\",
\".      c %s\",
\"                 \",
\"                 \",
\"                 \",
\"                 \",
\"                 \",
%s
\"                 \",
\"                 \",
\"                 \",
\"                 \",
\"                 \",
\"                 \"};
" (symbol-name type)
(if disabled "disabled" "enabled")
clr
(cond
 ((eq 'right type)
  "\"                 \",
\"     ..          \",
\"     ....        \",
\"     ......      \",
\"     .....       \",
\"     ...         \",
"
  )
 ((eq 'left type)
  "\"                 \",
\"          ..     \",
\"        ....     \",
\"      ......     \",
\"       .....     \",
\"         ...     \","
  )
 ((eq 'up type)
  "\"        .        \",
\"       ..        \",
\"       ...       \",
\"      ....       \",
\"      .....      \",
\"      .....      \",")
 ((eq 'down type)
  "\"      .....      \",
\"      .....      \",
\"      ....       \",
\"       ...       \",
\"       ..        \",
\"        .        \","))))))

(set-face-attribute 'tabbar-default nil
                    :inherit nil
                    :weight 'normal
                    :width 'normal
                    :slant 'normal
                    :underline nil
                    :strike-through nil
                    ;; inherit from frame                   :inverse-video
                    :stipple nil
                    :background "#AAAAAA"
                    :foreground "black"
                    ;;              :box '(:line-width 2 :color "white" :style nil)
                    :box nil
                    :family "arial"
                    )
(set-face-attribute 'tabbar-selected nil
                    :background "#DDDDDD"
                    :foreground "black"
                    :inherit 'tabbar-default 
                    :box '(:line-width 3 :color "#DDDDDD" :style nil))
;;                  :box '(:line-width 2 :color "white" :style released-button))
(set-face-attribute 'tabbar-unselected nil
                    :inherit 'tabbar-default
                    :background "#AAAAAA"
                    :box '(:line-width 3 :color "#AAAAAA" :style nil))
(set-face-attribute 'tabbar-button nil
                    :inherit 'tabbar-default
                    :box nil)
(set-face-attribute 'tabbar-separator nil
                    :background "grey50"
                    :foreground "grey50"
                    :height 1.0)
(defsubst tabbar-line-tab (tab)
  "Return the display representation of tab TAB.
That is, a propertized string used as an `header-line-format' template
element.
Call `tabbar-tab-label-function' to obtain a label for TAB."
  (let* ( (selected-p (tabbar-selected-p tab (tabbar-current-tabset)))
          (modified-p (buffer-modified-p (tabbar-tab-value tab)))
          (close-button-image (tabbar-find-image 
       `((:type xpm :data ,(tabbar-ruler-image :type 'close :disabled (not modified-p))))))
          (face (if selected-p
                    (if modified-p
                        'tabbar-selected-modified
                      'tabbar-selected
                      )
                  (if modified-p
                      'tabbar-unselected-modified
                    'tabbar-unselected
                    ))))
    (concat
     (propertize "[x]"
                 'display (tabbar-normalize-image close-button-image 0)
                 'face face
                 'pointer 'hand
                 'tabbar-tab tab
                 'local-map (tabbar-make-tab-keymap tab)
                 'tabbar-action 'close-tab
                 )
     (propertize " " 'face face
                 'tabbar-tab tab
                 'local-map (tabbar-make-tab-keymap tab)
                 'help-echo 'tabbar-help-on-tab
                 'face face
                 'pointer 'hand
                 )
     (propertize 
      (if tabbar-tab-label-function
          (funcall tabbar-tab-label-function tab)
        tab)
      'tabbar-tab tab
      'local-map (tabbar-make-tab-keymap tab)
      'help-echo 'tabbar-help-on-tab
      'mouse-face 'tabbar-highlight
      'face face
      'pointer 'hand)
     (propertize (if modified-p
                                         ;;(with-temp-buffer (ucs-insert "207A") (insert " ") (buffer-substring (point-min) (point-max)))
                                     " " " ") 'face face
                 'tabbar-tab tab
                 'local-map (tabbar-make-tab-keymap tab)
                 'help-echo 'tabbar-help-on-tab
                 'face face
                 'pointer 'hand)
     tabbar-separator-value)))
(defface tabbar-selected-modified
  '((t
     :inherit tabbar-selected
     :weight normal))
  "Face used for unselected tabs."
  :group 'tabbar)

(defface tabbar-unselected-modified
  '((t
     :inherit tabbar-unselected
     :weight normal))
  "Face used for unselected tabs."
  :group 'tabbar)
(defface tabbar-key-binding '((t
                               :foreground "white"))
  "Face for unselected, highlighted tabs."
  :group 'tabbar)
(setq tabbar-separator '(0.25))
(defface tabbar-selected-modified
  '((t
     :inherit tabbar-selected
     :weight normal))
  "Face used for unselected tabs."
  :group 'tabbar)
(defface tabbar-unselected-modified
  '((t
     :inherit tabbar-unselected
     :weight normal
     ))
  "Face used for unselected tabs."
  :group 'tabbar)
(defface tabbar-key-binding '((t
                               :foreground "white"))
  "Face for unselected, highlighted tabs."
  :group 'tabbar)
(provide 'tabbar-settings)
