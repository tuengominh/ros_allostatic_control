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

class GradientInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.adsign = null;
      this.hsign = null;
    }
    else {
      if (initObj.hasOwnProperty('adsign')) {
        this.adsign = initObj.adsign
      }
      else {
        this.adsign = 0.0;
      }
      if (initObj.hasOwnProperty('hsign')) {
        this.hsign = initObj.hsign
      }
      else {
        this.hsign = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GradientInfo
    // Serialize message field [adsign]
    bufferOffset = _serializer.float32(obj.adsign, buffer, bufferOffset);
    // Serialize message field [hsign]
    bufferOffset = _serializer.float32(obj.hsign, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GradientInfo
    let len;
    let data = new GradientInfo(null);
    // Deserialize message field [adsign]
    data.adsign = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [hsign]
    data.hsign = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'allostatic_control/GradientInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '999d9275d196ff95aab41905a8d95a6c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 adsign
    float32 hsign
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GradientInfo(null);
    if (msg.adsign !== undefined) {
      resolved.adsign = msg.adsign;
    }
    else {
      resolved.adsign = 0.0
    }

    if (msg.hsign !== undefined) {
      resolved.hsign = msg.hsign;
    }
    else {
      resolved.hsign = 0.0
    }

    return resolved;
    }
};

module.exports = GradientInfo;
