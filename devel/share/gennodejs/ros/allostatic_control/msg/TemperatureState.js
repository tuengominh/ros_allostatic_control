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

class TemperatureState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.temp_aV = null;
      this.temp_urgency = null;
      this.adsign = null;
      this.hsign = null;
    }
    else {
      if (initObj.hasOwnProperty('temp_aV')) {
        this.temp_aV = initObj.temp_aV
      }
      else {
        this.temp_aV = 0.0;
      }
      if (initObj.hasOwnProperty('temp_urgency')) {
        this.temp_urgency = initObj.temp_urgency
      }
      else {
        this.temp_urgency = 0.0;
      }
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
    // Serializes a message object of type TemperatureState
    // Serialize message field [temp_aV]
    bufferOffset = _serializer.float32(obj.temp_aV, buffer, bufferOffset);
    // Serialize message field [temp_urgency]
    bufferOffset = _serializer.float32(obj.temp_urgency, buffer, bufferOffset);
    // Serialize message field [adsign]
    bufferOffset = _serializer.float32(obj.adsign, buffer, bufferOffset);
    // Serialize message field [hsign]
    bufferOffset = _serializer.float32(obj.hsign, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TemperatureState
    let len;
    let data = new TemperatureState(null);
    // Deserialize message field [temp_aV]
    data.temp_aV = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [temp_urgency]
    data.temp_urgency = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [adsign]
    data.adsign = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [hsign]
    data.hsign = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'allostatic_control/TemperatureState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a5757ceae5e52b647c58e39dc62225c3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 temp_aV
    float32 temp_urgency
    float32 adsign
    float32 hsign
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TemperatureState(null);
    if (msg.temp_aV !== undefined) {
      resolved.temp_aV = msg.temp_aV;
    }
    else {
      resolved.temp_aV = 0.0
    }

    if (msg.temp_urgency !== undefined) {
      resolved.temp_urgency = msg.temp_urgency;
    }
    else {
      resolved.temp_urgency = 0.0
    }

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

module.exports = TemperatureState;
