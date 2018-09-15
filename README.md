[![MELPA](https://melpa.org/packages/lsp-racket-badge.svg)](https://melpa.org/#/lsp-racket)

Racket support for lsp-mode using [racket-langserver](hhttps://pkgs.racket-lang.org/package/racket-langserver).

## Installation

Install [`lsp-mode`](https://github.com/emacs-lsp/lsp-mode) first, and either clone
this repository, or install from MELPA. Add the following to your `.emacs`:

```emacs-lisp
(require 'lsp-mode)
(require 'lsp-racket)
(add-hook 'racket-mode-hook #'lsp-racket-enable)
```
