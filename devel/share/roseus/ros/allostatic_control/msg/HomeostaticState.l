;; Auto-generated. Do not edit!


(when (boundp 'allostatic_control::HomeostaticState)
  (if (not (find-package "ALLOSTATIC_CONTROL"))
    (make-package "ALLOSTATIC_CONTROL"))
  (shadow 'HomeostaticState (find-package "ALLOSTATIC_CONTROL")))
(unless (find-package "ALLOSTATIC_CONTROL::HOMEOSTATICSTATE")
  (make-package "ALLOSTATIC_CONTROL::HOMEOSTATICSTATE"))

(in-package "ROS")
;;//! \htmlinclude HomeostaticState.msg.html


(defclass allostatic_control::HomeostaticState
  :super ros::object
  :slots (_energy_aV _water_aV _temp_aV _hunger_urgency _thirst_urgency _temp_urgency _adsign _hsign ))

(defmethod allostatic_control::HomeostaticState
  (:init
   (&key
    ((:energy_aV __energy_aV) 0.0)
    ((:water_aV __water_aV) 0.0)
    ((:temp_aV __temp_aV) 0.0)
    ((:hunger_urgency __hunger_urgency) 0.0)
    ((:thirst_urgency __thirst_urgency) 0.0)
    ((:temp_urgency __temp_urgency) 0.0)
    ((:adsign __adsign) 0.0)
    ((:hsign __hsign) 0.0)
    )
   (send-super :init)
   (setq _energy_aV (float __energy_aV))
   (setq _water_aV (float __water_aV))
   (setq _temp_aV (float __temp_aV))
   (setq _hunger_urgency (float __hunger_urgency))
   (setq _thirst_urgency (float __thirst_urgency))
   (setq _temp_urgency (float __temp_urgency))
   (setq _adsign (float __adsign))
   (setq _hsign (float __hsign))
   self)
  (:energy_aV
   (&optional __energy_aV)
   (if __energy_aV (setq _energy_aV __energy_aV)) _energy_aV)
  (:water_aV
   (&optional __water_aV)
   (if __water_aV (setq _water_aV __water_aV)) _water_aV)
  (:temp_aV
   (&optional __temp_aV)
   (if __temp_aV (setq _temp_aV __temp_aV)) _temp_aV)
  (:hunger_urgency
   (&optional __hunger_urgency)
   (if __hunger_urgency (setq _hunger_urgency __hunger_urgency)) _hunger_urgency)
  (:thirst_urgency
   (&optional __thirst_urgency)
   (if __thirst_urgency (setq _thirst_urgency __thirst_urgency)) _thirst_urgency)
  (:temp_urgency
   (&optional __temp_urgency)
   (if __temp_urgency (setq _temp_urgency __temp_urgency)) _temp_urgency)
  (:adsign
   (&optional __adsign)
   (if __adsign (setq _adsign __adsign)) _adsign)
  (:hsign
   (&optional __hsign)
   (if __hsign (setq _hsign __hsign)) _hsign)
  (:serialization-length
   ()
   (+
    ;; float32 _energy_aV
    4
    ;; float32 _water_aV
    4
    ;; float32 _temp_aV
    4
    ;; float32 _hunger_urgency
    4
    ;; float32 _thirst_urgency
    4
    ;; float32 _temp_urgency
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
     ;; float32 _energy_aV
       (sys::poke _energy_aV (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _water_aV
       (sys::poke _water_aV (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _temp_aV
       (sys::poke _temp_aV (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _hunger_urgency
       (sys::poke _hunger_urgency (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _thirst_urgency
       (sys::poke _thirst_urgency (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _temp_urgency
       (sys::poke _temp_urgency (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _adsign
       (sys::poke _adsign (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _hsign
       (sys::poke _hsign (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _energy_aV
     (setq _energy_aV (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _water_aV
     (setq _water_aV (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _temp_aV
     (setq _temp_aV (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _hunger_urgency
     (setq _hunger_urgency (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _thirst_urgency
     (setq _thirst_urgency (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _temp_urgency
     (setq _temp_urgency (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _adsign
     (setq _adsign (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _hsign
     (setq _hsign (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get allostatic_control::HomeostaticState :md5sum-) "4a099a68a501f1e47aa53247b3024fb7")
(setf (get allostatic_control::HomeostaticState :datatype-) "allostatic_control/HomeostaticState")
(setf (get allostatic_control::HomeostaticState :definition-)
      "float32 energy_aV
float32 water_aV
float32 temp_aV
float32 hunger_urgency
float32 thirst_urgency
float32 temp_urgency
float32 adsign
float32 hsign

")



(provide :allostatic_control/HomeostaticState "4a099a68a501f1e47aa53247b3024fb7")


