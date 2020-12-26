(defpackage #:example
  (:use #:cl)
  (:export
   ;; Utils
   #:do-the-job
   ;; Class
   #:name
   #:user
   #:last-login-at
   #:email
   #:admin
   ;; App
   #:foo
   #:defrule
   #:number-one)
  (:documentation "

This is a small library which includes a few functions with docstrings and a documentation
for the system and all included packages.

The purpose is to demonstrate core features of the
CL-API (https://common-lisp.net/project/cl-api/) library.

The repository can be used as a template for new libraries if you've choosen CL-API
for documenting your library.

"))

