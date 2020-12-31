(defpackage #:example/app
  (:use #:cl)
  (:import-from #:example/utils)
  (:import-from #:example/class)
  (:documentation "This is docstring for the @b{example/app} package.

                   The package contains a function which does it's job by
                   applying transformation to the first and second arguments:

                   @aboutfun{foo}

                   When you mention a function like that, it is included into
                   the package description and removed from the
                   \"Other functions...\" section")
  (:export #:foo))
(in-package example/app)


(defun foo (first &key (other 100500))
  "@short{This is example function.}
   @arg[first]{Just a first argument.}
   @arg[other]{Optional keyword argument. Default is 100500.}
   @return{A string with first and other concatenated.}

   Internally it calls @fun{example/utils:do-the-job}
   to do the real job.

   Note, that the link above is broken, but Coo does not warn us when building the docs.
   Sphinx issues a warning inn such case."
  (example/utils:do-the-job first other))
