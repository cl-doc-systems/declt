(defpackage #:example/class
  (:use #:cl)
  (:documentation "This package demonstrates how Declt displays classes and generic functions.

                   The key consept is USER class

                   It is possible to check if user has admin privileges, using this IS-ADMIN function.

                   Right now, IS-ADMIN returns T only for objects of class ADMIN.
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
"))


(defclass admin (user)
  ()
  (:documentation "Admins should have additional priveleges."))


;; This class will be show in the documentation
;; and in the USER's "Direct subclasses", but it has no any docstring.
(defclass non-documented-user (user)
  ())


(defclass inner-documented-user (user)
  ()
  (:documentation "This class only to demostrate how Declt's separates exported
symbols from internal.

It will not be shown in the separate section \"Internal Definitions\"."))



(defgeneric is-admin (user)
  (:documentation "Returns t if user can modify the system."))


(defmethod is-admin ((user user))
  nil)


(defmethod is-admin ((user admin))
  t)
