
(cl:in-package :asdf)

(defsystem "allostasis_msg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "resource" :depends-on ("_package_resource"))
    (:file "_package_resource" :depends-on ("_package"))
  ))