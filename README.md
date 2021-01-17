# Declt

This is an example project of [Declt](https://www.lrde.epita.fr/~didier/software/lisp/declt/user/index.html) Common Lisp documentation system.

This repository is part of the <https://github.com/cl-doc-systems> organization, created to compare different Common Lisp documentation systems

The goal is make it easier for CL software developers to choose proper documentation system and to improve docs in their software!

Resulting documentation can be viewed here:

<https://cl-doc-systems.github.io/declt/> ([PDF version](https://cl-doc-systems.github.io/declt/index.pdf) is very nice!)

Pros
====

- Generates manuals in Texinfo which can be converted to `HTML`, `PDF`, `DVI`
  and `PostScript`. Here is [PDF version](https://cl-doc-systems.github.io/declt/index.pdf) of this site.
- Automatically embeds license information.
- Uses standard [Texinfo format](https://www.gnu.org/software/texinfo/manual/texinfo/texinfo.html),
  which has good documentation. Theoretically, Texinfo should well suite for large documents.
- It is able to generate single or multi page `HTML` output. To switch the mode, change
  `single-page-p` variable in `docs/scripts/builder.lisp`.

Cons
====

- Works only under `SBCL`.
- Free form documentation chapters are limited by "Introduction" and "Conclusion".
- Texinfo is not so popular these days. Also, it is very verbose.
- There is no default CSS theme.
- I wasn't able to use cross referencing Texinfo tags from
  docstrings. Seems Texinfo markup does not work there. But it works
  in the introduction and conclusion.


## Real projects using Declt

- [Quickref](https://gitlab.common-lisp.net/quickref/quickref) ([rendered docs](https://quickref.common-lisp.net/))


## Conclusion

Declt can be used be used when you need to generate API reference for third-party libraries
as [Quickref](https://quickref.common-lisp.net/) does for all Quicklisp libraries.

Ability to generate docs in different formats also might be interesting.

But the lack of markup support for docstrings and cross-reference helpers along with limited ability
to create free form documentation chapters makes Declt useless for documenting
[40Ants](https://40ants.com) projects.
