;; Auto-generated. Do not edit!


(when (boundp 'allostatic_control::Blob)
  (if (not (find-package "ALLOSTATIC_CONTROL"))
    (make-package "ALLOSTATIC_CONTROL"))
  (shadow 'Blob (find-package "ALLOSTATIC_CONTROL")))
(unless (find-package "ALLOSTATIC_CONTROL::BLOB")
  (make-package "ALLOSTATIC_CONTROL::BLOB"))

(in-package "ROS")
;;//! \htmlinclude Blob.msg.html


(defclass allostatic_control::Blob
  :super ros::object
  :slots (_Target _Target_x _Target_color _R_obstacle _L_obstacle _R_obstacle_dist _L_obstacle_dist _num_food _num_water ))

(defmethod allostatic_control::Blob
  (:init
   (&key
    ((:Target __Target) nil)
    ((:Target_x __Target_x) 0.0)
    ((:Target_color __Target_color) "")
    ((:R_obstacle __R_obstacle) nil)
    ((:L_obstacle __L_obstacle) nil)
    ((:R_obstacle_dist __R_obstacle_dist) 0.0)
    ((:L_obstacle_dist __L_obstacle_dist) 0.0)
    ((:num_food __num_food) 0.0)
    ((:num_water __num_water) 0.0)
    )
   (send-super :init)
   (setq _Target __Target)
   (setq _Target_x (float __Target_x))
   (setq _Target_color (string __Target_color))
   (setq _R_obstacle __R_obstacle)
   (setq _L_obstacle __L_obstacle)
   (setq _R_obstacle_dist (float __R_obstacle_dist))
   (setq _L_obstacle_dist (float __L_obstacle_dist))
   (setq _num_food (float __num_food))
   (setq _num_water (float __num_water))
   self)
  (:Target
   (&optional (__Target :null))
   (if (not (eq __Target :null)) (setq _Target __Target)) _Target)
  (:Target_x
   (&optional __Target_x)
   (if __Target_x (setq _Target_x __Target_x)) _Target_x)
  (:Target_color
   (&optional __Target_color)
   (if __Target_color (setq _Target_color __Target_color)) _Target_color)
  (:R_obstacle
   (&optional (__R_obstacle :null))
   (if (not (eq __R_obstacle :null)) (setq _R_obstacle __R_obstacle)) _R_obstacle)
  (:L_obstacle
   (&optional (__L_obstacle :null))
   (if (not (eq __L_obstacle :null)) (setq _L_obstacle __L_obstacle)) _L_obstacle)
  (:R_obstacle_dist
   (&optional __R_obstacle_dist)
   (if __R_obstacle_dist (setq _R_obstacle_dist __R_obstacle_dist)) _R_obstacle_dist)
  (:L_obstacle_dist
   (&optional __L_obstacle_dist)
   (if __L_obstacle_dist (setq _L_obstacle_dist __L_obstacle_dist)) _L_obstacle_dist)
  (:num_food
   (&optional __num_food)
   (if __num_food (setq _num_food __num_food)) _num_food)
  (:num_water
   (&optional __num_water)
   (if __num_water (setq _num_water __num_water)) _num_water)
  (:serialization-length
   ()
   (+
    ;; bool _Target
    1
    ;; float32 _Target_x
    4
    ;; string _Target_color
    4 (length _Target_color)
    ;; bool _R_obstacle
    1
    ;; bool _L_obstacle
    1
    ;; float32 _R_obstacle_dist
    4
    ;; float32 _L_obstacle_dist
    4
    ;; float32 _num_food
    4
    ;; float32 _num_water
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _Target
       (if _Target (write-byte -1 s) (write-byte 0 s))
     ;; float32 _Target_x
       (sys::poke _Target_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _Target_color
       (write-long (length _Target_color) s) (princ _Target_color s)
     ;; bool _R_obstacle
       (if _R_obstacle (write-byte -1 s) (write-byte 0 s))
     ;; bool _L_obstacle
       (if _L_obstacle (write-byte -1 s) (write-byte 0 s))
     ;; float32 _R_obstacle_dist
       (sys::poke _R_obstacle_dist (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _L_obstacle_dist
       (sys::poke _L_obstacle_dist (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _num_food
       (sys::poke _num_food (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _num_water
       (sys::poke _num_water (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _Target
     (setq _Target (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _Target_x
     (setq _Target_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _Target_color
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _Target_color (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _R_obstacle
     (setq _R_obstacle (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _L_obstacle
     (setq _L_obstacle (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _R_obstacle_dist
     (setq _R_obstacle_dist (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _L_obstacle_dist
     (setq _L_obstacle_dist (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _num_food
     (setq _num_food (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _num_water
     (setq _num_water (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get allostatic_control::Blob :md5sum-) "3395f1fd9ae656e6b4bded8b2c6ac06b")
(setf (get allostatic_control::Blob :datatype-) "allostatic_control/Blob")
(setf (get allostatic_control::Blob :definition-)
      "bool Target
float32 Target_x
string Target_color
bool R_obstacle
bool L_obstacle
float32 R_obstacle_dist
float32 L_obstacle_dist
float32 num_food
float32 num_water

")



(provide :allostatic_control/Blob "3395f1fd9ae656e6b4bded8b2c6ac06b")


