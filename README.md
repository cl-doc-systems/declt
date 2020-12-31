# ATDOC

This is an example project of [ATDOC](http://www.lichteblau.com/atdoc/doc/) Common Lisp documentation system.

This repository is part of the <https://github.com/cl-doc-systems> organization, created to compare different Common Lisp documentation systems

The goal is make it easier for CL software developers to choose proper documentation system and to improve docs in their software!

Resulting documentation can be viewed here:

<https://cl-doc-systems.github.io/atdoc/> ([PDF version](https://cl-doc-systems.github.io/atdoc/latex/documentation.pdf) is very nice!)

## Pros

- ATDOC uses a custom markup language which allows to do a few interesting things.
- There are special tags to help reference functions and classes.
- There is a special markup for function arguments and return value. When it is
  used, these arguments are extracted into a separate subsection.
- There is a special tags to include class or function description into the other
  docstring. This way, you can write a long package description and put
  all classes and functions in the proper order.
- Docs can be generated for any CL package from any system.
- Generates documentation in HTML, PDF and Info formats.
- You can change CSS to tune the page a little bit.

## Cons

- You have to learn a custom markup language.
- Does not play well with package inferred systems when using a multi-page HTML mode.
- Rendered HTML has strange indentation and package names aren't headers.
- There is no way to change HTML layout, but if you'll want to hack it, then
  you'll have to dive into this XSLT templates hell.
- It is hard to write long, tutorial like documentation, because separate documentation
  files are not supported.

## Real projects using ATDOC

- [trivial-garbage](https://github.com/trivial-garbage/trivial-garbage) ([rendered docs](https://common-lisp.net/project/trivial-garbage/))


## Conclusion

Suitable for building a reference for small libraries.
But lack of ability to process handwritten chapters not bound to the packages and problems
with package inferred systems, make it unusable for 40ants projects.
