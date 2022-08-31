; Auto-generated. Do not edit!


(cl:in-package allostatic_control-msg)


;//! \htmlinclude HomeostaticState.msg.html

(cl:defclass <HomeostaticState> (roslisp-msg-protocol:ros-message)
  ((energy_aV
    :reader energy_aV
    :initarg :energy_aV
    :type cl:float
    :initform 0.0)
   (water_aV
    :reader water_aV
    :initarg :water_aV
    :type cl:float
    :initform 0.0)
   (temp_aV
    :reader temp_aV
    :initarg :temp_aV
    :type cl:float
    :initform 0.0)
   (hunger_urgency
    :reader hunger_urgency
    :initarg :hunger_urgency
    :type cl:float
    :initform 0.0)
   (thirst_urgency
    :reader thirst_urgency
    :initarg :thirst_urgency
    :type cl:float
    :initform 0.0)
   (temp_urgency
    :reader temp_urgency
    :initarg :temp_urgency
    :type cl:float
    :initform 0.0)
   (adsign
    :reader adsign
    :initarg :adsign
    :type cl:float
    :initform 0.0)
   (hsign
    :reader hsign
    :initarg :hsign
    :type cl:float
    :initform 0.0))
)

(cl:defclass HomeostaticState (<HomeostaticState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HomeostaticState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HomeostaticState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name allostatic_control-msg:<HomeostaticState> is deprecated: use allostatic_control-msg:HomeostaticState instead.")))

(cl:ensure-generic-function 'energy_aV-val :lambda-list '(m))
(cl:defmethod energy_aV-val ((m <HomeostaticState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:energy_aV-val is deprecated.  Use allostatic_control-msg:energy_aV instead.")
  (energy_aV m))

(cl:ensure-generic-function 'water_aV-val :lambda-list '(m))
(cl:defmethod water_aV-val ((m <HomeostaticState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:water_aV-val is deprecated.  Use allostatic_control-msg:water_aV instead.")
  (water_aV m))

(cl:ensure-generic-function 'temp_aV-val :lambda-list '(m))
(cl:defmethod temp_aV-val ((m <HomeostaticState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:temp_aV-val is deprecated.  Use allostatic_control-msg:temp_aV instead.")
  (temp_aV m))

(cl:ensure-generic-function 'hunger_urgency-val :lambda-list '(m))
(cl:defmethod hunger_urgency-val ((m <HomeostaticState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:hunger_urgency-val is deprecated.  Use allostatic_control-msg:hunger_urgency instead.")
  (hunger_urgency m))

(cl:ensure-generic-function 'thirst_urgency-val :lambda-list '(m))
(cl:defmethod thirst_urgency-val ((m <HomeostaticState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:thirst_urgency-val is deprecated.  Use allostatic_control-msg:thirst_urgency instead.")
  (thirst_urgency m))

(cl:ensure-generic-function 'temp_urgency-val :lambda-list '(m))
(cl:defmethod temp_urgency-val ((m <HomeostaticState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:temp_urgency-val is deprecated.  Use allostatic_control-msg:temp_urgency instead.")
  (temp_urgency m))

(cl:ensure-generic-function 'adsign-val :lambda-list '(m))
(cl:defmethod adsign-val ((m <HomeostaticState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:adsign-val is deprecated.  Use allostatic_control-msg:adsign instead.")
  (adsign m))

(cl:ensure-generic-function 'hsign-val :lambda-list '(m))
(cl:defmethod hsign-val ((m <HomeostaticState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:hsign-val is deprecated.  Use allostatic_control-msg:hsign instead.")
  (hsign m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HomeostaticState>) ostream)
  "Serializes a message object of type '<HomeostaticState>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'energy_aV))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'water_aV))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'temp_aV))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'hunger_urgency))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'thirst_urgency))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'temp_urgency))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'adsign))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'hsign))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HomeostaticState>) istream)
  "Deserializes a message object of type '<HomeostaticState>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'energy_aV) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'water_aV) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'temp_aV) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'hunger_urgency) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'thirst_urgency) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'temp_urgency) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'adsign) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'hsign) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HomeostaticState>)))
  "Returns string type for a message object of type '<HomeostaticState>"
  "allostatic_control/HomeostaticState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HomeostaticState)))
  "Returns string type for a message object of type 'HomeostaticState"
  "allostatic_control/HomeostaticState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HomeostaticState>)))
  "Returns md5sum for a message object of type '<HomeostaticState>"
  "4a099a68a501f1e47aa53247b3024fb7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HomeostaticState)))
  "Returns md5sum for a message object of type 'HomeostaticState"
  "4a099a68a501f1e47aa53247b3024fb7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HomeostaticState>)))
  "Returns full string definition for message of type '<HomeostaticState>"
  (cl:format cl:nil "float32 energy_aV~%float32 water_aV~%float32 temp_aV~%float32 hunger_urgency~%float32 thirst_urgency~%float32 temp_urgency~%float32 adsign~%float32 hsign~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HomeostaticState)))
  "Returns full string definition for message of type 'HomeostaticState"
  (cl:format cl:nil "float32 energy_aV~%float32 water_aV~%float32 temp_aV~%float32 hunger_urgency~%float32 thirst_urgency~%float32 temp_urgency~%float32 adsign~%float32 hsign~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HomeostaticState>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HomeostaticState>))
  "Converts a ROS message object to a list"
  (cl:list 'HomeostaticState
    (cl:cons ':energy_aV (energy_aV msg))
    (cl:cons ':water_aV (water_aV msg))
    (cl:cons ':temp_aV (temp_aV msg))
    (cl:cons ':hunger_urgency (hunger_urgency msg))
    (cl:cons ':thirst_urgency (thirst_urgency msg))
    (cl:cons ':temp_urgency (temp_urgency msg))
    (cl:cons ':adsign (adsign msg))
    (cl:cons ':hsign (hsign msg))
))
