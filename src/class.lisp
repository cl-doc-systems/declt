(defpackage #:example/class
  (:use #:cl)
  (:documentation "This package demonstrates how ATDOC displays classes and generic functions.

                   The key consept is user class:

                   USER

                   It is possible to check if user has admin privileges, using this function:

                   IS-ADMIN

                   Right now, `IS-ADMIN' returns `t' only for objects of class `ADMIN':

                   ADMIN
")
  (:export #:foo
           #:user
           #:admin
           #:non-documented-user))
(in-package example/class)


(defclass user ()
  ((name :reader name
         :type string
         :initarg :name
         :documentation "A full username.")
   (email :reader email
          :type string
          :initarg :email
          :documentation "Correct email address.")
   (last-login-at :accessor last-login-at))
  (:documentation "All users in the system have this class.

Last login slot is updated automatically.

NOTE: \"Documented Subclasses\" section contains only classes which are:
"))


(defclass admin (user)
  ()
  (:documentation "Admins should have additional priveleges."))


;; This class will be show in the documentation
;; and in the user's "Documented Subclasses", because it is exported.
;; But there will be a red note about missing documentation string.
(defclass non-documented-user (user)
  ())


(defclass inner-documented-user (user)
  ()
  (:documentation "This class only to demostrate how ATDOC's docstring
collection ignores not exported classes even when they have documentation.

Also, it will not be shown in the \"Documented Subclasses\".
Seems, \"documented\" in terms of ATDOC is \"exported\" and being the public API."))



(defgeneric is-admin (user)
  (:documentation "Returns t if user can modify the system."))


(defmethod is-admin ((user user))
  nil)


(defmethod is-admin ((user admin))
  t)
