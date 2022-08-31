
(cl:in-package :asdf)

(defsystem "gazebo_simulation-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Resource" :depends-on ("_package_Resource"))
    (:file "_package_Resource" :depends-on ("_package"))
  ))