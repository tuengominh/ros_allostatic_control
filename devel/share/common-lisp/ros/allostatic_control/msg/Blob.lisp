; Auto-generated. Do not edit!


(cl:in-package allostatic_control-msg)


;//! \htmlinclude Blob.msg.html

(cl:defclass <Blob> (roslisp-msg-protocol:ros-message)
  ((Target
    :reader Target
    :initarg :Target
    :type cl:boolean
    :initform cl:nil)
   (Target_x
    :reader Target_x
    :initarg :Target_x
    :type cl:float
    :initform 0.0)
   (Target_color
    :reader Target_color
    :initarg :Target_color
    :type cl:string
    :initform "")
   (R_obstacle
    :reader R_obstacle
    :initarg :R_obstacle
    :type cl:boolean
    :initform cl:nil)
   (L_obstacle
    :reader L_obstacle
    :initarg :L_obstacle
    :type cl:boolean
    :initform cl:nil)
   (R_obstacle_dist
    :reader R_obstacle_dist
    :initarg :R_obstacle_dist
    :type cl:float
    :initform 0.0)
   (L_obstacle_dist
    :reader L_obstacle_dist
    :initarg :L_obstacle_dist
    :type cl:float
    :initform 0.0)
   (num_food
    :reader num_food
    :initarg :num_food
    :type cl:float
    :initform 0.0)
   (num_water
    :reader num_water
    :initarg :num_water
    :type cl:float
    :initform 0.0))
)

(cl:defclass Blob (<Blob>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Blob>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Blob)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name allostatic_control-msg:<Blob> is deprecated: use allostatic_control-msg:Blob instead.")))

(cl:ensure-generic-function 'Target-val :lambda-list '(m))
(cl:defmethod Target-val ((m <Blob>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:Target-val is deprecated.  Use allostatic_control-msg:Target instead.")
  (Target m))

(cl:ensure-generic-function 'Target_x-val :lambda-list '(m))
(cl:defmethod Target_x-val ((m <Blob>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:Target_x-val is deprecated.  Use allostatic_control-msg:Target_x instead.")
  (Target_x m))

(cl:ensure-generic-function 'Target_color-val :lambda-list '(m))
(cl:defmethod Target_color-val ((m <Blob>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:Target_color-val is deprecated.  Use allostatic_control-msg:Target_color instead.")
  (Target_color m))

(cl:ensure-generic-function 'R_obstacle-val :lambda-list '(m))
(cl:defmethod R_obstacle-val ((m <Blob>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:R_obstacle-val is deprecated.  Use allostatic_control-msg:R_obstacle instead.")
  (R_obstacle m))

(cl:ensure-generic-function 'L_obstacle-val :lambda-list '(m))
(cl:defmethod L_obstacle-val ((m <Blob>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:L_obstacle-val is deprecated.  Use allostatic_control-msg:L_obstacle instead.")
  (L_obstacle m))

(cl:ensure-generic-function 'R_obstacle_dist-val :lambda-list '(m))
(cl:defmethod R_obstacle_dist-val ((m <Blob>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:R_obstacle_dist-val is deprecated.  Use allostatic_control-msg:R_obstacle_dist instead.")
  (R_obstacle_dist m))

(cl:ensure-generic-function 'L_obstacle_dist-val :lambda-list '(m))
(cl:defmethod L_obstacle_dist-val ((m <Blob>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:L_obstacle_dist-val is deprecated.  Use allostatic_control-msg:L_obstacle_dist instead.")
  (L_obstacle_dist m))

(cl:ensure-generic-function 'num_food-val :lambda-list '(m))
(cl:defmethod num_food-val ((m <Blob>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:num_food-val is deprecated.  Use allostatic_control-msg:num_food instead.")
  (num_food m))

(cl:ensure-generic-function 'num_water-val :lambda-list '(m))
(cl:defmethod num_water-val ((m <Blob>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader allostatic_control-msg:num_water-val is deprecated.  Use allostatic_control-msg:num_water instead.")
  (num_water m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Blob>) ostream)
  "Serializes a message object of type '<Blob>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'Target) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Target_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'Target_color))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'Target_color))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'R_obstacle) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'L_obstacle) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'R_obstacle_dist))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'L_obstacle_dist))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'num_food))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'num_water))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Blob>) istream)
  "Deserializes a message object of type '<Blob>"
    (cl:setf (cl:slot-value msg 'Target) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Target_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Target_color) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'Target_color) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'R_obstacle) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'L_obstacle) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'R_obstacle_dist) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'L_obstacle_dist) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'num_food) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'num_water) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Blob>)))
  "Returns string type for a message object of type '<Blob>"
  "allostatic_control/Blob")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Blob)))
  "Returns string type for a message object of type 'Blob"
  "allostatic_control/Blob")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Blob>)))
  "Returns md5sum for a message object of type '<Blob>"
  "3395f1fd9ae656e6b4bded8b2c6ac06b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Blob)))
  "Returns md5sum for a message object of type 'Blob"
  "3395f1fd9ae656e6b4bded8b2c6ac06b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Blob>)))
  "Returns full string definition for message of type '<Blob>"
  (cl:format cl:nil "bool Target~%float32 Target_x~%string Target_color~%bool R_obstacle~%bool L_obstacle~%float32 R_obstacle_dist~%float32 L_obstacle_dist~%float32 num_food~%float32 num_water~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Blob)))
  "Returns full string definition for message of type 'Blob"
  (cl:format cl:nil "bool Target~%float32 Target_x~%string Target_color~%bool R_obstacle~%bool L_obstacle~%float32 R_obstacle_dist~%float32 L_obstacle_dist~%float32 num_food~%float32 num_water~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Blob>))
  (cl:+ 0
     1
     4
     4 (cl:length (cl:slot-value msg 'Target_color))
     1
     1
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Blob>))
  "Converts a ROS message object to a list"
  (cl:list 'Blob
    (cl:cons ':Target (Target msg))
    (cl:cons ':Target_x (Target_x msg))
    (cl:cons ':Target_color (Target_color msg))
    (cl:cons ':R_obstacle (R_obstacle msg))
    (cl:cons ':L_obstacle (L_obstacle msg))
    (cl:cons ':R_obstacle_dist (R_obstacle_dist msg))
    (cl:cons ':L_obstacle_dist (L_obstacle_dist msg))
    (cl:cons ':num_food (num_food msg))
    (cl:cons ':num_water (num_water msg))
))
