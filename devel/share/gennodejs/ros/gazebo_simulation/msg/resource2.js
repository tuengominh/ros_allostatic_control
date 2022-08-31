// Auto-generated. Do not edit!

// (in-package gazebo_simulation.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class resource2 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.system = null;
      this.resource = null;
      this.impact = null;
    }
    else {
      if (initObj.hasOwnProperty('system')) {
        this.system = initObj.system
      }
      else {
        this.system = '';
      }
      if (initObj.hasOwnProperty('resource')) {
        this.resource = initObj.resource
      }
      else {
        this.resource = '';
      }
      if (initObj.hasOwnProperty('impact')) {
        this.impact = initObj.impact
      }
      else {
        this.impact = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type resource2
    // Serialize message field [system]
    bufferOffset = _serializer.string(obj.system, buffer, bufferOffset);
    // Serialize message field [resource]
    bufferOffset = _serializer.string(obj.resource, buffer, bufferOffset);
    // Serialize message field [impact]
    bufferOffset = _serializer.float32(obj.impact, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type resource2
    let len;
    let data = new resource2(null);
    // Deserialize message field [system]
    data.system = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [resource]
    data.resource = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [impact]
    data.impact = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.system);
    length += _getByteLength(object.resource);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gazebo_simulation/resource2';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '10b0369c5f5bdb9cf04116e86ec64e3b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string system
    string resource
    float32 impact
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new resource2(null);
    if (msg.system !== undefined) {
      resolved.system = msg.system;
    }
    else {
      resolved.system = ''
    }

    if (msg.resource !== undefined) {
      resolved.resource = msg.resource;
    }
    else {
      resolved.resource = ''
    }

    if (msg.impact !== undefined) {
      resolved.impact = msg.impact;
    }
    else {
      resolved.impact = 0.0
    }

    return resolved;
    }
};

module.exports = resource2;
