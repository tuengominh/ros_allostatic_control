; Auto-generated. Do not edit!


(cl:in-package allostasis_msg-msg)


;//! \htmlinclude resource.msg.html

(cl:defclass <resource> (roslisp-msg-protocol:ros-message)
  ((system
    :reader system
    :initarg :system
    :type cl:string
    :initform "")
   (resource
    :reader resource
    :initarg :resource
    :type cl:string
    :initform "")
   (impact
    :reader impact
    :initarg :impact
    :type cl:float
    :initform 0.0))
)

(cl:defclass resource (<resource>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <resource>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'resource)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name allostasis_msg-msg:<resource> is deprecated: use allostasis_msg-msg:resource instead.")))

(cl:ensure-generic-function 'system-val :lambda-list '(m))
(cl:defmethod system-val ((m <resource>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostasis_msg-msg:system-val is deprecated.  Use allostasis_msg-msg:system instead.")
  (system m))

(cl:ensure-generic-function 'resource-val :lambda-list '(m))
(cl:defmethod resource-val ((m <resource>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostasis_msg-msg:resource-val is deprecated.  Use allostasis_msg-msg:resource instead.")
  (resource m))

(cl:ensure-generic-function 'impact-val :lambda-list '(m))
(cl:defmethod impact-val ((m <resource>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostasis_msg-msg:impact-val is deprecated.  Use allostasis_msg-msg:impact instead.")
  (impact m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <resource>) ostream)
  "Serializes a message object of type '<resource>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'system))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'system))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'resource))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'resource))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'impact))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <resource>) istream)
  "Deserializes a message object of type '<resource>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'system) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'system) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'resource) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'resource) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'impact) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<resource>)))
  "Returns string type for a message object of type '<resource>"
  "allostasis_msg/resource")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resource)))
  "Returns string type for a message object of type 'resource"
  "allostasis_msg/resource")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<resource>)))
  "Returns md5sum for a message object of type '<resource>"
  "10b0369c5f5bdb9cf04116e86ec64e3b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'resource)))
  "Returns md5sum for a message object of type 'resource"
  "10b0369c5f5bdb9cf04116e86ec64e3b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<resource>)))
  "Returns full string definition for message of type '<resource>"
  (cl:format cl:nil "string system~%string resource~%float32 impact~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'resource)))
  "Returns full string definition for message of type 'resource"
  (cl:format cl:nil "string system~%string resource~%float32 impact~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <resource>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'system))
     4 (cl:length (cl:slot-value msg 'resource))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <resource>))
  "Converts a ROS message object to a list"
  (cl:list 'resource
    (cl:cons ':system (system msg))
    (cl:cons ':resource (resource msg))
    (cl:cons ':impact (impact msg))
))
