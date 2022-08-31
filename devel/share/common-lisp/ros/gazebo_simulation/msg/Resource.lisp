; Auto-generated. Do not edit!


(cl:in-package gazebo_simulation-msg)


;//! \htmlinclude Resource.msg.html

(cl:defclass <Resource> (roslisp-msg-protocol:ros-message)
  ((resource
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

(cl:defclass Resource (<Resource>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Resource>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Resource)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gazebo_simulation-msg:<Resource> is deprecated: use gazebo_simulation-msg:Resource instead.")))

(cl:ensure-generic-function 'resource-val :lambda-list '(m))
(cl:defmethod resource-val ((m <Resource>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_simulation-msg:resource-val is deprecated.  Use gazebo_simulation-msg:resource instead.")
  (resource m))

(cl:ensure-generic-function 'impact-val :lambda-list '(m))
(cl:defmethod impact-val ((m <Resource>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_simulation-msg:impact-val is deprecated.  Use gazebo_simulation-msg:impact instead.")
  (impact m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Resource>) ostream)
  "Serializes a message object of type '<Resource>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Resource>) istream)
  "Deserializes a message object of type '<Resource>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Resource>)))
  "Returns string type for a message object of type '<Resource>"
  "gazebo_simulation/Resource")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Resource)))
  "Returns string type for a message object of type 'Resource"
  "gazebo_simulation/Resource")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Resource>)))
  "Returns md5sum for a message object of type '<Resource>"
  "cd332bcd4b1e896fa9f27f8efb55a8f7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Resource)))
  "Returns md5sum for a message object of type 'Resource"
  "cd332bcd4b1e896fa9f27f8efb55a8f7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Resource>)))
  "Returns full string definition for message of type '<Resource>"
  (cl:format cl:nil "string resource~%float32 impact~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Resource)))
  "Returns full string definition for message of type 'Resource"
  (cl:format cl:nil "string resource~%float32 impact~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Resource>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'resource))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Resource>))
  "Converts a ROS message object to a list"
  (cl:list 'Resource
    (cl:cons ':resource (resource msg))
    (cl:cons ':impact (impact msg))
))
