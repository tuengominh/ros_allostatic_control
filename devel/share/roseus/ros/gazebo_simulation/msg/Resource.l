;; Auto-generated. Do not edit!


(when (boundp 'gazebo_simulation::Resource)
  (if (not (find-package "GAZEBO_SIMULATION"))
    (make-package "GAZEBO_SIMULATION"))
  (shadow 'Resource (find-package "GAZEBO_SIMULATION")))
(unless (find-package "GAZEBO_SIMULATION::RESOURCE")
  (make-package "GAZEBO_SIMULATION::RESOURCE"))

(in-package "ROS")
;;//! \htmlinclude Resource.msg.html


(defclass gazebo_simulation::Resource
  :super ros::object
  :slots (_resource _impact ))

(defmethod gazebo_simulation::Resource
  (:init
   (&key
    ((:resource __resource) "")
    ((:impact __impact) 0.0)
    )
   (send-super :init)
   (setq _resource (string __resource))
   (setq _impact (float __impact))
   self)
  (:resource
   (&optional __resource)
   (if __resource (setq _resource __resource)) _resource)
  (:impact
   (&optional __impact)
   (if __impact (setq _impact __impact)) _impact)
  (:serialization-length
   ()
   (+
    ;; string _resource
    4 (length _resource)
    ;; float32 _impact
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _resource
       (write-long (length _resource) s) (princ _resource s)
     ;; float32 _impact
       (sys::poke _impact (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _resource
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _resource (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _impact
     (setq _impact (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get gazebo_simulation::Resource :md5sum-) "cd332bcd4b1e896fa9f27f8efb55a8f7")
(setf (get gazebo_simulation::Resource :datatype-) "gazebo_simulation/Resource")
(setf (get gazebo_simulation::Resource :definition-)
      "string resource
float32 impact
")



(provide :gazebo_simulation/Resource "cd332bcd4b1e896fa9f27f8efb55a8f7")


