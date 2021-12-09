// Auto-generated. Do not edit!

// (in-package allostatic_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Blob {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Target = null;
      this.Target_x = null;
      this.Target_color = null;
      this.R_obstacle = null;
      this.L_obstacle = null;
      this.R_obstacle_dist = null;
      this.L_obstacle_dist = null;
      this.num_food = null;
      this.num_water = null;
    }
    else {
      if (initObj.hasOwnProperty('Target')) {
        this.Target = initObj.Target
      }
      else {
        this.Target = false;
      }
      if (initObj.hasOwnProperty('Target_x')) {
        this.Target_x = initObj.Target_x
      }
      else {
        this.Target_x = 0.0;
      }
      if (initObj.hasOwnProperty('Target_color')) {
        this.Target_color = initObj.Target_color
      }
      else {
        this.Target_color = '';
      }
      if (initObj.hasOwnProperty('R_obstacle')) {
        this.R_obstacle = initObj.R_obstacle
      }
      else {
        this.R_obstacle = false;
      }
      if (initObj.hasOwnProperty('L_obstacle')) {
        this.L_obstacle = initObj.L_obstacle
      }
      else {
        this.L_obstacle = false;
      }
      if (initObj.hasOwnProperty('R_obstacle_dist')) {
        this.R_obstacle_dist = initObj.R_obstacle_dist
      }
      else {
        this.R_obstacle_dist = 0.0;
      }
      if (initObj.hasOwnProperty('L_obstacle_dist')) {
        this.L_obstacle_dist = initObj.L_obstacle_dist
      }
      else {
        this.L_obstacle_dist = 0.0;
      }
      if (initObj.hasOwnProperty('num_food')) {
        this.num_food = initObj.num_food
      }
      else {
        this.num_food = 0.0;
      }
      if (initObj.hasOwnProperty('num_water')) {
        this.num_water = initObj.num_water
      }
      else {
        this.num_water = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Blob
    // Serialize message field [Target]
    bufferOffset = _serializer.bool(obj.Target, buffer, bufferOffset);
    // Serialize message field [Target_x]
    bufferOffset = _serializer.float32(obj.Target_x, buffer, bufferOffset);
    // Serialize message field [Target_color]
    bufferOffset = _serializer.string(obj.Target_color, buffer, bufferOffset);
    // Serialize message field [R_obstacle]
    bufferOffset = _serializer.bool(obj.R_obstacle, buffer, bufferOffset);
    // Serialize message field [L_obstacle]
    bufferOffset = _serializer.bool(obj.L_obstacle, buffer, bufferOffset);
    // Serialize message field [R_obstacle_dist]
    bufferOffset = _serializer.float32(obj.R_obstacle_dist, buffer, bufferOffset);
    // Serialize message field [L_obstacle_dist]
    bufferOffset = _serializer.float32(obj.L_obstacle_dist, buffer, bufferOffset);
    // Serialize message field [num_food]
    bufferOffset = _serializer.float32(obj.num_food, buffer, bufferOffset);
    // Serialize message field [num_water]
    bufferOffset = _serializer.float32(obj.num_water, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Blob
    let len;
    let data = new Blob(null);
    // Deserialize message field [Target]
    data.Target = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [Target_x]
    data.Target_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Target_color]
    data.Target_color = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [R_obstacle]
    data.R_obstacle = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [L_obstacle]
    data.L_obstacle = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [R_obstacle_dist]
    data.R_obstacle_dist = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [L_obstacle_dist]
    data.L_obstacle_dist = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [num_food]
    data.num_food = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [num_water]
    data.num_water = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.Target_color);
    return length + 27;
  }

  static datatype() {
    // Returns string type for a message object
    return 'allostatic_control/Blob';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3395f1fd9ae656e6b4bded8b2c6ac06b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool Target
    float32 Target_x
    string Target_color
    bool R_obstacle
    bool L_obstacle
    float32 R_obstacle_dist
    float32 L_obstacle_dist
    float32 num_food
    float32 num_water
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Blob(null);
    if (msg.Target !== undefined) {
      resolved.Target = msg.Target;
    }
    else {
      resolved.Target = false
    }

    if (msg.Target_x !== undefined) {
      resolved.Target_x = msg.Target_x;
    }
    else {
      resolved.Target_x = 0.0
    }

    if (msg.Target_color !== undefined) {
      resolved.Target_color = msg.Target_color;
    }
    else {
      resolved.Target_color = ''
    }

    if (msg.R_obstacle !== undefined) {
      resolved.R_obstacle = msg.R_obstacle;
    }
    else {
      resolved.R_obstacle = false
    }

    if (msg.L_obstacle !== undefined) {
      resolved.L_obstacle = msg.L_obstacle;
    }
    else {
      resolved.L_obstacle = false
    }

    if (msg.R_obstacle_dist !== undefined) {
      resolved.R_obstacle_dist = msg.R_obstacle_dist;
    }
    else {
      resolved.R_obstacle_dist = 0.0
    }

    if (msg.L_obstacle_dist !== undefined) {
      resolved.L_obstacle_dist = msg.L_obstacle_dist;
    }
    else {
      resolved.L_obstacle_dist = 0.0
    }

    if (msg.num_food !== undefined) {
      resolved.num_food = msg.num_food;
    }
    else {
      resolved.num_food = 0.0
    }

    if (msg.num_water !== undefined) {
      resolved.num_water = msg.num_water;
    }
    else {
      resolved.num_water = 0.0
    }

    return resolved;
    }
};

module.exports = Blob;
