;; Auto-generated. Do not edit!


(when (boundp 'gazebo_simulation::resource2)
  (if (not (find-package "GAZEBO_SIMULATION"))
    (make-package "GAZEBO_SIMULATION"))
  (shadow 'resource2 (find-package "GAZEBO_SIMULATION")))
(unless (find-package "GAZEBO_SIMULATION::RESOURCE2")
  (make-package "GAZEBO_SIMULATION::RESOURCE2"))

(in-package "ROS")
;;//! \htmlinclude resource2.msg.html


(defclass gazebo_simulation::resource2
  :super ros::object
  :slots (_system _resource _impact ))

(defmethod gazebo_simulation::resource2
  (:init
   (&key
    ((:system __system) "")
    ((:resource __resource) "")
    ((:impact __impact) 0.0)
    )
   (send-super :init)
   (setq _system (string __system))
   (setq _resource (string __resource))
   (setq _impact (float __impact))
   self)
  (:system
   (&optional __system)
   (if __system (setq _system __system)) _system)
  (:resource
   (&optional __resource)
   (if __resource (setq _resource __resource)) _resource)
  (:impact
   (&optional __impact)
   (if __impact (setq _impact __impact)) _impact)
  (:serialization-length
   ()
   (+
    ;; string _system
    4 (length _system)
    ;; string _resource
    4 (length _resource)
    ;; float32 _impact
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _system
       (write-long (length _system) s) (princ _system s)
     ;; string _resource
       (write-long (length _resource) s) (princ _resource s)
     ;; float32 _impact
       (sys::poke _impact (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _system
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _system (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _resource
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _resource (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _impact
     (setq _impact (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get gazebo_simulation::resource2 :md5sum-) "10b0369c5f5bdb9cf04116e86ec64e3b")
(setf (get gazebo_simulation::resource2 :datatype-) "gazebo_simulation/resource2")
(setf (get gazebo_simulation::resource2 :definition-)
      "string system
string resource
float32 impact

")



(provide :gazebo_simulation/resource2 "10b0369c5f5bdb9cf04116e86ec64e3b")


