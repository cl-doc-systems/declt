(defpackage #:example/app
  (:use #:cl)
  (:import-from #:example/utils)
  (:import-from #:example/class)
  (:documentation "This is docstring for the EXAMPLE/APP package.

                   The package contains a FOO function which does it's job by
                   applying transformation to the first and second arguments.")
  (:export #:foo))
(in-package example/app)


(defun foo (first &key (other 100500))
  "This is example function.

   * FIRST - Just a first argument.
   * OTHER - Optional keyword argument. Default is 100500.

   Returns: A string with first and other concatenated.

   Internally it calls EXAMPLE/UTILS:DO-THE-JOB
   to do the real job.

   Note, that the link above is broken, but Coo does not warn us when building the docs.
   Sphinx issues a warning inn such case.
"
  (example/utils:do-the-job first other))
