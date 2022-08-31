; Auto-generated. Do not edit!


(cl:in-package allostatic_control-msg)


;//! \htmlinclude TemperatureState.msg.html

(cl:defclass <TemperatureState> (roslisp-msg-protocol:ros-message)
  ((temp_aV
    :reader temp_aV
    :initarg :temp_aV
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

(cl:defclass TemperatureState (<TemperatureState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TemperatureState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TemperatureState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name allostatic_control-msg:<TemperatureState> is deprecated: use allostatic_control-msg:TemperatureState instead.")))

(cl:ensure-generic-function 'temp_aV-val :lambda-list '(m))
(cl:defmethod temp_aV-val ((m <TemperatureState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:temp_aV-val is deprecated.  Use allostatic_control-msg:temp_aV instead.")
  (temp_aV m))

(cl:ensure-generic-function 'temp_urgency-val :lambda-list '(m))
(cl:defmethod temp_urgency-val ((m <TemperatureState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:temp_urgency-val is deprecated.  Use allostatic_control-msg:temp_urgency instead.")
  (temp_urgency m))

(cl:ensure-generic-function 'adsign-val :lambda-list '(m))
(cl:defmethod adsign-val ((m <TemperatureState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:adsign-val is deprecated.  Use allostatic_control-msg:adsign instead.")
  (adsign m))

(cl:ensure-generic-function 'hsign-val :lambda-list '(m))
(cl:defmethod hsign-val ((m <TemperatureState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:hsign-val is deprecated.  Use allostatic_control-msg:hsign instead.")
  (hsign m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TemperatureState>) ostream)
  "Serializes a message object of type '<TemperatureState>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'temp_aV))))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TemperatureState>) istream)
  "Deserializes a message object of type '<TemperatureState>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TemperatureState>)))
  "Returns string type for a message object of type '<TemperatureState>"
  "allostatic_control/TemperatureState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TemperatureState)))
  "Returns string type for a message object of type 'TemperatureState"
  "allostatic_control/TemperatureState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TemperatureState>)))
  "Returns md5sum for a message object of type '<TemperatureState>"
  "a5757ceae5e52b647c58e39dc62225c3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TemperatureState)))
  "Returns md5sum for a message object of type 'TemperatureState"
  "a5757ceae5e52b647c58e39dc62225c3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TemperatureState>)))
  "Returns full string definition for message of type '<TemperatureState>"
  (cl:format cl:nil "float32 temp_aV~%float32 temp_urgency~%float32 adsign~%float32 hsign~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TemperatureState)))
  "Returns full string definition for message of type 'TemperatureState"
  (cl:format cl:nil "float32 temp_aV~%float32 temp_urgency~%float32 adsign~%float32 hsign~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TemperatureState>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TemperatureState>))
  "Converts a ROS message object to a list"
  (cl:list 'TemperatureState
    (cl:cons ':temp_aV (temp_aV msg))
    (cl:cons ':temp_urgency (temp_urgency msg))
    (cl:cons ':adsign (adsign msg))
    (cl:cons ':hsign (hsign msg))
))
