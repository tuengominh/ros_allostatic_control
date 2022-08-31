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

class Resource {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.resource = null;
      this.impact = null;
    }
    else {
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
    // Serializes a message object of type Resource
    // Serialize message field [resource]
    bufferOffset = _serializer.string(obj.resource, buffer, bufferOffset);
    // Serialize message field [impact]
    bufferOffset = _serializer.float32(obj.impact, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Resource
    let len;
    let data = new Resource(null);
    // Deserialize message field [resource]
    data.resource = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [impact]
    data.impact = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.resource);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gazebo_simulation/Resource';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cd332bcd4b1e896fa9f27f8efb55a8f7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string resource
    float32 impact
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Resource(null);
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

module.exports = Resource;
