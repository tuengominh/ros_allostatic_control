;; Auto-generated. Do not edit!


(when (boundp 'allostatic_control::Drive)
  (if (not (find-package "ALLOSTATIC_CONTROL"))
    (make-package "ALLOSTATIC_CONTROL"))
  (shadow 'Drive (find-package "ALLOSTATIC_CONTROL")))
(unless (find-package "ALLOSTATIC_CONTROL::DRIVE")
  (make-package "ALLOSTATIC_CONTROL::DRIVE"))

(in-package "ROS")
;;//! \htmlinclude Drive.msg.html


(defclass allostatic_control::Drive
  :super ros::object
  :slots (_hunger_drive _thirst_drive _temp_drive _adsign _hsign ))

(defmethod allostatic_control::Drive
  (:init
   (&key
    ((:hunger_drive __hunger_drive) 0.0)
    ((:thirst_drive __thirst_drive) 0.0)
    ((:temp_drive __temp_drive) 0.0)
    ((:adsign __adsign) 0.0)
    ((:hsign __hsign) 0.0)
    )
   (send-super :init)
   (setq _hunger_drive (float __hunger_drive))
   (setq _thirst_drive (float __thirst_drive))
   (setq _temp_drive (float __temp_drive))
   (setq _adsign (float __adsign))
   (setq _hsign (float __hsign))
   self)
  (:hunger_drive
   (&optional __hunger_drive)
   (if __hunger_drive (setq _hunger_drive __hunger_drive)) _hunger_drive)
  (:thirst_drive
   (&optional __thirst_drive)
   (if __thirst_drive (setq _thirst_drive __thirst_drive)) _thirst_drive)
  (:temp_drive
   (&optional __temp_drive)
   (if __temp_drive (setq _temp_drive __temp_drive)) _temp_drive)
  (:adsign
   (&optional __adsign)
   (if __adsign (setq _adsign __adsign)) _adsign)
  (:hsign
   (&optional __hsign)
   (if __hsign (setq _hsign __hsign)) _hsign)
  (:serialization-length
   ()
   (+
    ;; float32 _hunger_drive
    4
    ;; float32 _thirst_drive
    4
    ;; float32 _temp_drive
    4
    ;; float32 _adsign
    4
    ;; float32 _hsign
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _hunger_drive
       (sys::poke _hunger_drive (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _thirst_drive
       (sys::poke _thirst_drive (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _temp_drive
       (sys::poke _temp_drive (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _adsign
       (sys::poke _adsign (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _hsign
       (sys::poke _hsign (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _hunger_drive
     (setq _hunger_drive (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _thirst_drive
     (setq _thirst_drive (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _temp_drive
     (setq _temp_drive (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _adsign
     (setq _adsign (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _hsign
     (setq _hsign (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get allostatic_control::Drive :md5sum-) "e4b100e18918e1da885417627a4aa817")
(setf (get allostatic_control::Drive :datatype-) "allostatic_control/Drive")
(setf (get allostatic_control::Drive :definition-)
      "float32 hunger_drive
float32 thirst_drive
float32 temp_drive
float32 adsign
float32 hsign

")



(provide :allostatic_control/Drive "e4b100e18918e1da885417627a4aa817")


