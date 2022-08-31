; Auto-generated. Do not edit!


(cl:in-package allostatic_control-msg)


;//! \htmlinclude GradientInfo.msg.html

(cl:defclass <GradientInfo> (roslisp-msg-protocol:ros-message)
  ((adsign
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

(cl:defclass GradientInfo (<GradientInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GradientInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GradientInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name allostatic_control-msg:<GradientInfo> is deprecated: use allostatic_control-msg:GradientInfo instead.")))

(cl:ensure-generic-function 'adsign-val :lambda-list '(m))
(cl:defmethod adsign-val ((m <GradientInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:adsign-val is deprecated.  Use allostatic_control-msg:adsign instead.")
  (adsign m))

(cl:ensure-generic-function 'hsign-val :lambda-list '(m))
(cl:defmethod hsign-val ((m <GradientInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:hsign-val is deprecated.  Use allostatic_control-msg:hsign instead.")
  (hsign m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GradientInfo>) ostream)
  "Serializes a message object of type '<GradientInfo>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GradientInfo>) istream)
  "Deserializes a message object of type '<GradientInfo>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GradientInfo>)))
  "Returns string type for a message object of type '<GradientInfo>"
  "allostatic_control/GradientInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GradientInfo)))
  "Returns string type for a message object of type 'GradientInfo"
  "allostatic_control/GradientInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GradientInfo>)))
  "Returns md5sum for a message object of type '<GradientInfo>"
  "999d9275d196ff95aab41905a8d95a6c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GradientInfo)))
  "Returns md5sum for a message object of type 'GradientInfo"
  "999d9275d196ff95aab41905a8d95a6c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GradientInfo>)))
  "Returns full string definition for message of type '<GradientInfo>"
  (cl:format cl:nil "float32 adsign~%float32 hsign~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GradientInfo)))
  "Returns full string definition for message of type 'GradientInfo"
  (cl:format cl:nil "float32 adsign~%float32 hsign~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GradientInfo>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GradientInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'GradientInfo
    (cl:cons ':adsign (adsign msg))
    (cl:cons ':hsign (hsign msg))
))
