;; Auto-generated. Do not edit!


(when (boundp 'allostatic_control::Action)
  (if (not (find-package "ALLOSTATIC_CONTROL"))
    (make-package "ALLOSTATIC_CONTROL"))
  (shadow 'Action (find-package "ALLOSTATIC_CONTROL")))
(unless (find-package "ALLOSTATIC_CONTROL::ACTION")
  (make-package "ALLOSTATIC_CONTROL::ACTION"))

(in-package "ROS")
;;//! \htmlinclude Action.msg.html


(defclass allostatic_control::Action
  :super ros::object
  :slots (_x _th ))

(defmethod allostatic_control::Action
  (:init
   (&key
    ((:x __x) 0.0)
    ((:th __th) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _th (float __th))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:th
   (&optional __th)
   (if __th (setq _th __th)) _th)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _th
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _th
       (sys::poke _th (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _th
     (setq _th (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get allostatic_control::Action :md5sum-) "05821a98e59391a8fea77064466b46c2")
(setf (get allostatic_control::Action :datatype-) "allostatic_control/Action")
(setf (get allostatic_control::Action :definition-)
      "float32 x
float32 th

")



(provide :allostatic_control/Action "05821a98e59391a8fea77064466b46c2")


