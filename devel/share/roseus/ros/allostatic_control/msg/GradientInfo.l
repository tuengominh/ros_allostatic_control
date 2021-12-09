;; Auto-generated. Do not edit!


(when (boundp 'allostatic_control::GradientInfo)
  (if (not (find-package "ALLOSTATIC_CONTROL"))
    (make-package "ALLOSTATIC_CONTROL"))
  (shadow 'GradientInfo (find-package "ALLOSTATIC_CONTROL")))
(unless (find-package "ALLOSTATIC_CONTROL::GRADIENTINFO")
  (make-package "ALLOSTATIC_CONTROL::GRADIENTINFO"))

(in-package "ROS")
;;//! \htmlinclude GradientInfo.msg.html


(defclass allostatic_control::GradientInfo
  :super ros::object
  :slots (_adsign _hsign ))

(defmethod allostatic_control::GradientInfo
  (:init
   (&key
    ((:adsign __adsign) 0.0)
    ((:hsign __hsign) 0.0)
    )
   (send-super :init)
   (setq _adsign (float __adsign))
   (setq _hsign (float __hsign))
   self)
  (:adsign
   (&optional __adsign)
   (if __adsign (setq _adsign __adsign)) _adsign)
  (:hsign
   (&optional __hsign)
   (if __hsign (setq _hsign __hsign)) _hsign)
  (:serialization-length
   ()
   (+
    ;; float32 _adsign
    4
    ;; float32 _hsign
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _adsign
       (sys::poke _adsign (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _hsign
       (sys::poke _hsign (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _adsign
     (setq _adsign (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _hsign
     (setq _hsign (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get allostatic_control::GradientInfo :md5sum-) "999d9275d196ff95aab41905a8d95a6c")
(setf (get allostatic_control::GradientInfo :datatype-) "allostatic_control/GradientInfo")
(setf (get allostatic_control::GradientInfo :definition-)
      "float32 adsign
float32 hsign

")



(provide :allostatic_control/GradientInfo "999d9275d196ff95aab41905a8d95a6c")


