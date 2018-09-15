;;; lsp-racket.el --- Racket support for lsp-mode -*- lexical-binding: t -*-

;; Copyright (C) 2018 Vishesh Yadav <vishesh3y@gmail.com>

;; Author: Vishesh Yadav <vishesh3y@gmail.com>
;; Version: 1.0
;; Package-Requires: ((lsp-mode "3.0"))
;; Keywords: racket
;; URL: https://github.com/vishesh/lsp-racket

;;; Code:
(require 'lsp-mode)
(require 'lsp-common)

(defcustom lsp-racket-executable-path "racket"
  "Path to Racket executable."
  :group 'lsp-racket
  :type 'string)

(defcustom lsp-racket-server-args '()
  "Extra arguments for the racket language server."
  :group 'lsp-racket
  :risky t
  :type '(repeat string))

(defconst lsp-racket--get-root
  (lsp-make-traverser
   #'(lambda (dir) (directory-files dir nil "info.rkt"))))

(defun lsp-racket--server-command ()
  "Generate the language server startup command."
  `(,lsp-racket-executable-path "--lib" "racket-langserver" ,@lsp-racket-server-args))

(lsp-define-stdio-client lsp-racket
                         "racket"
                         lsp-racket--get-root
                         (lsp-racket--server-command))


(provide 'lsp-racket)
;;; lsp-racket.el ends here
