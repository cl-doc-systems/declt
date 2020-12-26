# cl-api

This is an example project of [CL-API](https://common-lisp.net/project/cl-api/) Common Lisp documentation system.

This repository is part of the <https://github.com/cl-doc-systems> organization, created to compare different Common Lisp documentation systems

The goal is make it easier for CL software developers to choose proper documentation system and to improve docs in their software!

Resulting documentation can be viewed here:

<https://cl-doc-systems.github.io/cl-api/>

## Pros

- It is possible to exclude some symbols from documentation.
- Default theme is readable.
- Usage is really simple.
- Docs can be generated for any CL package from any system.

## Cons

- Does not work with package-inferred systems.
- HTML template can't be changed.
- No way to write a documentation chapters not tied to classes, functions, etc.
- It does not deindent docstrings and to make them correctly formatted,
  you have to write ugly code.
- There is no hook points to extend functional.
- CL-API does not support any markup and you can put links into the docstrings.
- It does not generates `index.html` and if you intend to publish docs on GitHub,
  you have to write additional wrapper to rename it.

## Conclusion

Suitable for building a reference for third-party libraries if they don't have
own documentation. But lack of ability to process handwritten chapters and work
with package inferred systems, make it unusable for 40ants projects.

### Real projects using CL-API

- [colorize](http://redlinernotes.com/docs/colorize.html)
